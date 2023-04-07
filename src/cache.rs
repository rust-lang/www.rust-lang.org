use std::any::Any;
use std::collections::HashMap;
use std::error::Error;
use std::sync::RwLock;
use std::time::Instant;

use rocket::tokio::task;

type CacheItem = (Box<dyn Any + Send + Sync>, Instant);
type Generator = fn() -> Result<Box<dyn Any>, Box<dyn Error>>;

const CACHE_TTL_SECS: u64 = 120;

lazy_static! {
    static ref CACHE: RwLock<HashMap<Generator, CacheItem>> = RwLock::new(HashMap::new());
}

pub async fn get<T>(generator: Generator) -> Result<T, Box<dyn Error>>
where
    T: Send + Sync + Clone + 'static,
{
    if let Some(cached) = get_cached(generator) {
        Ok(cached)
    } else {
        task::spawn_blocking(move || {
            update_cache::<T>(generator)
                // stringify the error to make it Send
                .map_err(|e| e.to_string())
        })
        .await
        .map_err(Box::new)?
        // put the previously stringified error back in a box
        .map_err(|e| e.as_str().into())
    }
}

fn get_cached<T>(generator: Generator) -> Option<T>
where
    T: Send + Sync + Clone + 'static,
{
    let cache = CACHE.read().unwrap();
    cache.get(&generator).map(|&(ref data, timestamp)| {
        if timestamp.elapsed().as_secs() > CACHE_TTL_SECS {
            // Update the cache in the background
            task::spawn_blocking(move || {
                let _ = update_cache::<T>(generator);
            });
        }
        data.downcast_ref::<T>().unwrap().clone()
    })
}

fn update_cache<T>(generator: Generator) -> Result<T, Box<dyn Error>>
where
    T: Send + Sync + Clone + 'static,
{
    if let Ok(data) = generator()?.downcast::<T>() {
        let cloned: T = (*data).clone();
        CACHE
            .write()
            .unwrap()
            .insert(generator, (Box::new(cloned), Instant::now()));
        Ok(*data)
    } else {
        Err("the generator returned the wrong type".into())
    }
}

#[cfg(test)]
mod tests {
    use rocket::tokio;

    use super::{get, Generator, CACHE, CACHE_TTL_SECS};
    use std::any::Any;
    use std::error::Error;
    use std::sync::atomic::{AtomicBool, Ordering};
    use std::thread;
    use std::time::{Duration, Instant};

    #[tokio::test]
    async fn test_cache_basic() {
        static GENERATOR_CALLED: AtomicBool = AtomicBool::new(false);

        fn generator() -> Result<Box<dyn Any>, Box<dyn Error>> {
            GENERATOR_CALLED.store(true, Ordering::SeqCst);
            Ok(Box::new("hello world"))
        }

        // The first time it will call the generator
        GENERATOR_CALLED.store(false, Ordering::SeqCst);
        assert_eq!(get::<&'static str>(generator).await.unwrap(), "hello world");
        assert!(GENERATOR_CALLED.load(Ordering::SeqCst));

        // The second time it won't call the generator, but reuse the latest value
        GENERATOR_CALLED.store(false, Ordering::SeqCst);
        assert_eq!(get::<&'static str>(generator).await.unwrap(), "hello world");
        assert!(!GENERATOR_CALLED.load(Ordering::SeqCst));
    }

    #[tokio::test]
    async fn test_cache_refresh() {
        static GENERATOR_CALLED: AtomicBool = AtomicBool::new(false);

        fn generator() -> Result<Box<dyn Any>, Box<dyn Error>> {
            GENERATOR_CALLED.store(true, Ordering::SeqCst);
            thread::sleep(Duration::from_millis(100));
            Ok(Box::new("hello world"))
        }

        // Initialize the value in the cache
        GENERATOR_CALLED.store(false, Ordering::SeqCst);
        assert_eq!(get::<&'static str>(generator).await.unwrap(), "hello world");
        assert!(GENERATOR_CALLED.load(Ordering::SeqCst));

        // Tweak the cache to fake an expired TTL
        let expired = Instant::now() - Duration::from_secs(CACHE_TTL_SECS * 2);
        CACHE
            .write()
            .unwrap()
            .get_mut(&(generator as Generator))
            .unwrap()
            .1 = expired;

        // The second time it won't call the generator, but start another thread to refresh the
        // value in the background
        GENERATOR_CALLED.store(false, Ordering::SeqCst);
        assert_eq!(get::<&'static str>(generator).await.unwrap(), "hello world");
        assert!(!GENERATOR_CALLED.load(Ordering::SeqCst));

        // Then the background updater thread will finish
        thread::sleep(Duration::from_millis(200));
        assert!(GENERATOR_CALLED.load(Ordering::SeqCst));
    }

    #[tokio::test]
    async fn test_errors_skip_cache() {
        static GENERATOR_CALLED: AtomicBool = AtomicBool::new(false);

        fn generator() -> Result<Box<dyn Any>, Box<dyn Error>> {
            GENERATOR_CALLED.store(true, Ordering::SeqCst);
            Err("an error".into())
        }

        // The first time it will call the generator
        GENERATOR_CALLED.store(false, Ordering::SeqCst);
        assert_eq!(
            get::<&'static str>(generator)
                .await
                .unwrap_err()
                .to_string(),
            "an error"
        );
        assert!(GENERATOR_CALLED.load(Ordering::SeqCst));

        // The second time it will also call the generator
        GENERATOR_CALLED.store(false, Ordering::SeqCst);
        assert_eq!(
            get::<&'static str>(generator)
                .await
                .unwrap_err()
                .to_string(),
            "an error"
        );
        assert!(GENERATOR_CALLED.load(Ordering::SeqCst));
    }
}

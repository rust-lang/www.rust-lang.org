use std::error::Error;
use std::future::Future;
use std::sync::Arc;
use std::time::Instant;

use rocket::tokio::sync::RwLock;
use rocket::tokio::task;
use rocket::State;

const CACHE_TTL_SECS: u64 = 120;

pub type Cache<T> = State<Arc<RwLock<T>>>;

pub trait Cached: Send + Sync + Clone + 'static {
    fn get_timestamp(&self) -> Instant;
    fn fetch() -> impl Future<Output = Result<Self, Box<dyn Error + Send + Sync>>> + Send;
    async fn get(cache: &Cache<Self>) -> Self {
        let cached = cache.read().await.clone();
        let timestamp = cached.get_timestamp();
        if timestamp.elapsed().as_secs() > CACHE_TTL_SECS {
            // Update the cache in the background
            let cache: Arc<_> = cache.inner().clone();
            task::spawn(async move {
                match Self::fetch().await {
                    Ok(data) => *cache.write().await = data,
                    Err(e) => eprintln!("failed to update cache: {e}"),
                }
            });
        }
        cached
    }
}

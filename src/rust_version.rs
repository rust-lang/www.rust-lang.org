use reqwest;
use std::sync::RwLock;
use std::thread;
use std::time::Instant;
use toml;

lazy_static! {
    static ref CACHE: RwLock<Option<(String, Instant)>> = RwLock::new(None);
}

const CACHE_TTL_SECS: u64 = 120;

pub fn rust_version() -> Option<String> {
    cached_rust_version().or_else(fetch_rust_version)
}

fn cached_rust_version() -> Option<String> {
    let cached = CACHE.read().unwrap();
    let (version, timestamp) = cached.as_ref()?;
    if timestamp.elapsed().as_secs() > CACHE_TTL_SECS {
        // Update the cache in the background.
        thread::spawn(fetch_rust_version);
    }
    Some(version.clone())
}

fn fetch_rust_version() -> Option<String> {
    let manifest = reqwest::get("https://static.rust-lang.org/dist/channel-rust-stable.toml")
        .ok()?
        .text()
        .ok()?;
    let manifest = manifest.parse::<toml::Value>().ok()?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str()?;
    let version = rust_version[..rust_version.find(' ')?].to_string();

    // Update the cache.
    *CACHE.write().unwrap() = Some((version.clone(), Instant::now()));
    Some(version)
}

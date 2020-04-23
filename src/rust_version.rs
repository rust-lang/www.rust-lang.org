use std::any::Any;
use std::env;
use std::error::Error;

static MANIFEST_URL: &str = "https://static.rust-lang.org/dist/channel-rust-stable.toml";
static RELEASES_FEED_URL: &str = "https://blog.rust-lang.org/releases.json";

enum FetchTarget {
    Manifest,
    ReleasesFeed,
}

fn fetch(target: FetchTarget) -> Result<reqwest::blocking::Response, Box<dyn Error>> {
    let proxy_env = env::var("http_proxy")
        .or_else(|_| env::var("HTTPS_PROXY"))
        .ok();

    let client = match proxy_env {
        Some(proxy_env) => {
            let proxy = reqwest::Proxy::https(&proxy_env).unwrap();
            reqwest::blocking::ClientBuilder::new()
                .proxy(proxy)
                .build()
                .unwrap()
        }
        None => reqwest::blocking::Client::new(),
    };

    let url = match target {
        FetchTarget::Manifest => MANIFEST_URL,
        FetchTarget::ReleasesFeed => RELEASES_FEED_URL,
    };

    Ok(client.get(url).send()?)
}

fn fetch_rust_version() -> Result<Box<dyn Any>, Box<dyn Error>> {
    let manifest = fetch(FetchTarget::Manifest)?
        .text()?
        .parse::<toml::Value>()?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str().unwrap();
    let version: String = rust_version.split(' ').next().unwrap().to_owned();
    Ok(Box::new(version))
}

fn fetch_rust_release_post() -> Result<Box<dyn Any>, Box<dyn Error>> {
    let releases = fetch(FetchTarget::ReleasesFeed)?
        .text()?
        .parse::<serde_json::Value>()?;
    let url = releases["releases"][0]["url"].as_str().unwrap().to_string();
    Ok(Box::new(url))
}

pub fn rust_version() -> Option<String> {
    match crate::cache::get(fetch_rust_version) {
        Ok(version) => Some(version),
        Err(err) => {
            eprintln!("error while fetching the rust version: {}", err);
            None
        }
    }
}

pub fn rust_release_post() -> Option<String> {
    match crate::cache::get(fetch_rust_release_post) {
        Ok(post) => Some(post),
        Err(err) => {
            eprintln!("error while fetching the rust release post: {}", err);
            None
        }
    }
}

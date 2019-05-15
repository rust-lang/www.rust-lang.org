use reqwest;
use serde_json;
use std::any::Any;
use std::error::Error;
use toml;

static MANIFEST_URL: &str = "https://static.rust-lang.org/dist/channel-rust-stable.toml";
static RELEASES_FEED_URL: &str = "https://blog.rust-lang.org/releases.json";

fn fetch_rust_version() -> Result<Box<Any>, Box<Error>> {
    let manifest = reqwest::get(MANIFEST_URL)?.text()?.parse::<toml::Value>()?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str().unwrap();
    let version: String =
        rust_version[..rust_version.find(' ').unwrap_or(rust_version.len())].to_string();
    Ok(Box::new(version))
}

fn fetch_rust_release_post() -> Result<Box<Any>, Box<Error>> {
    let releases = reqwest::get(RELEASES_FEED_URL)?
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

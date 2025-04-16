use std::env;
use std::error::Error;
use std::time::Instant;

use crate::cache::{Cache, Cached};

static MANIFEST_URL: &str = "https://static.rust-lang.org/dist/channel-rust-stable.toml";

enum FetchTarget {
    Manifest,
}

async fn fetch(target: FetchTarget) -> Result<reqwest::Response, Box<dyn Error + Send + Sync>> {
    let proxy_env = env::var("http_proxy")
        .or_else(|_| env::var("HTTPS_PROXY"))
        .ok();

    let client = match proxy_env {
        Some(proxy_env) => {
            let proxy = reqwest::Proxy::https(proxy_env).unwrap();
            reqwest::ClientBuilder::new().proxy(proxy).build().unwrap()
        }
        None => reqwest::Client::new(),
    };

    let url = match target {
        FetchTarget::Manifest => MANIFEST_URL,
    };

    Ok(client.get(url).send().await?)
}

#[derive(Debug, Clone)]
pub struct RustVersion(pub String, pub Instant);

impl Default for RustVersion {
    fn default() -> Self {
        Self(Default::default(), Instant::now())
    }
}

impl Cached for RustVersion {
    fn get_timestamp(&self) -> Instant {
        self.1
    }
    async fn fetch() -> Result<Self, Box<dyn Error + Send + Sync>> {
        let manifest = fetch(FetchTarget::Manifest)
            .await?
            .text()
            .await?
            .parse::<toml::Value>()?;
        let rust_version = manifest["pkg"]["rust"]["version"].as_str().unwrap();
        let version: String = rust_version.split(' ').next().unwrap().to_owned();
        Ok(RustVersion(version, Instant::now()))
    }
}

pub async fn rust_version(version_cache: &Cache<RustVersion>) -> String {
    RustVersion::get(version_cache).await.0
}

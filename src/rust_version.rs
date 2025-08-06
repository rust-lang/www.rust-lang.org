static MANIFEST_URL: &str = "https://static.rust-lang.org/dist/channel-rust-stable.toml";

#[derive(Debug, Clone)]
pub struct RustVersion(pub String);

/// Fetch the latest stable version of Rust.
pub async fn fetch_rust_version() -> anyhow::Result<RustVersion> {
    println!("Downloading Rust version");
    let manifest = reqwest::get(MANIFEST_URL)
        .await?
        .text()
        .await?
        .parse::<toml::Value>()?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str().unwrap();
    let version: String = rust_version.split(' ').next().unwrap().to_owned();
    Ok(RustVersion(version))
}

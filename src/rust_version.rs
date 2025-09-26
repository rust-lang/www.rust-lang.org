use crate::utils::fetch;

static MANIFEST_URL: &str = "https://static.rust-lang.org/dist/channel-rust-stable.toml";

#[derive(Debug, Clone)]
pub struct RustVersion(pub String);

/// Fetch the latest stable version of Rust.
pub fn fetch_rust_version() -> anyhow::Result<RustVersion> {
    println!("Downloading Rust version");

    let response = fetch(MANIFEST_URL)?;

    let manifest: toml::Value = toml::from_str(&response)?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str().unwrap();
    let version: String = rust_version.split(' ').next().unwrap().to_owned();
    Ok(RustVersion(version))
}

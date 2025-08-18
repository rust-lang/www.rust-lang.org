static MANIFEST_URL: &str = "https://static.rust-lang.org/dist/channel-rust-stable.toml";

#[derive(Debug, Clone)]
pub struct RustVersion(pub String);

/// Fetch the latest stable version of Rust.
pub fn fetch_rust_version() -> anyhow::Result<RustVersion> {
    println!("Downloading Rust version");
    let mut response = ureq::get(MANIFEST_URL).call()?;
    if !response.status().is_success() {
        return Err(anyhow::anyhow!(
            "Failed to download Rust version (HTTP status {}): {}",
            response.status(),
            response.body_mut().read_to_string()?
        ));
    }

    let manifest: toml::Value = toml::from_str(&response.body_mut().read_to_string()?)?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str().unwrap();
    let version: String = rust_version.split(' ').next().unwrap().to_owned();
    Ok(RustVersion(version))
}

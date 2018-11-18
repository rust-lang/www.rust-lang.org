use reqwest;
use toml;

pub fn rust_version() -> Option<String> {
    let manifest = reqwest::get("https://static.rust-lang.org/dist/channel-rust-stable.toml")
        .ok()?
        .text()
        .ok()?;
    let manifest = manifest.parse::<toml::Value>().ok()?;
    let rust_version = manifest["pkg"]["rust"]["version"].as_str()?.to_string();
    Some(rust_version[..rust_version.find(" ")?].to_string())
}

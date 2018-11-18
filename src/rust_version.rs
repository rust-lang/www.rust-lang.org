use reqwest;
use toml;

pub fn rust_version() -> String {
    let manifest = reqwest::get("https://static.rust-lang.org/dist/channel-rust-stable.toml")
        .expect("get response")
        .text()
        .expect("get string");
    let manifest = manifest.parse::<toml::Value>().expect("parse as toml");
    let rust_version = manifest["pkg"]["rust"]["version"]
        .as_str()
        .unwrap()
        .to_string();
    rust_version[..rust_version.find(" ").unwrap()].to_string()
}

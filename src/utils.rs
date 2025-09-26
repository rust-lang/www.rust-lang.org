/// Send a GET request to the given `url` and return the result as a string
pub fn fetch(url: &str) -> anyhow::Result<String> {
    let mut response = ureq::get(url).call()?;
    if !response.status().is_success() {
        return Err(anyhow::anyhow!(
            "Failed to download data from `{url}` (HTTP status {}): {}",
            response.status(),
            response.body_mut().read_to_string()?
        ));
    }

    Ok(response.body_mut().read_to_string()?)
}

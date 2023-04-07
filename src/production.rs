extern crate serde_yaml;

use std::fs;
use std::io;
use std::path::Path;

#[derive(Clone, Serialize, Deserialize)]
pub struct User {
    name: String,
    url: String,
    logo: String,
    how: String,
}

fn read_yaml() -> io::Result<Vec<User>> {
    let data_path = Path::new("./src/data/users.yml");
    assert!(fs::metadata(data_path)?.is_file());
    let data_string = fs::read_to_string(data_path)?;
    let data: Vec<User> = serde_yaml::from_str(&data_string)
        .unwrap_or_else(|_| panic!("failed yaml parse for {}", data_path.display()));
    Ok(data)
}

pub fn get_info() -> io::Result<Vec<User>> {
    read_yaml()
}

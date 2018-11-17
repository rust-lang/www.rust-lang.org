extern crate serde_yaml;

use std::fs;
use std::io;
use std::path::{Path, PathBuf};

#[derive(Serialize, Deserialize)]
pub struct Group {
    name: String,
    description: String,
    chat: String,
    leads: Vec<String>,
}

fn read_team_yaml(team: &str) -> io::Result<Group> {
    let data_path = Path::new("./src/data/teams/").join(team).join("team.yml");
    assert!(fs::metadata(&data_path)?.is_file());
    let data_string = fs::read_to_string(&data_path)?;
    let data: Group = serde_yaml::from_str(&data_string).unwrap();
    Ok(data)
}

pub fn get_data(t: &str) -> io::Result<Vec<Group>> {
    let mut teams = vec![];
    let team_data = fs::read_dir(Path::new("./src/data/").join(t))?;
    for team in team_data {
        let team = team?;
        let data = read_team_yaml(&get_name_from_direntry(team.path())).unwrap();
        teams.push(data);
    }
    Ok(teams)
}

fn get_name_from_direntry(path: PathBuf) -> String {
  path.file_stem().unwrap().to_str().unwrap().to_string()
}

pub fn get_info(name: &str) -> io::Result<Group> {
    read_team_yaml(name)
}

pub fn get_subs(t: &str, team: &str) -> io::Result<Vec<Group>> {
    let mut teams = vec![];
    println!("team {}", team);
    let data_path = Path::new("./src/data/teams/").join(team).join(t);
    if fs::metadata(&data_path).is_ok() {
        let team_data = fs::read_dir(data_path)?;
        for team in team_data {
            let team = team?;
            let data = read_team_yaml(&get_name_from_direntry(team.path())).unwrap();
            teams.push(data);
        }
    }
    Ok(teams)
}

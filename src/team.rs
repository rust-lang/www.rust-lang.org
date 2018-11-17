extern crate serde_yaml;

use std::fs;
use std::io;
use std::path::{Path, PathBuf};

#[derive(Serialize, Deserialize)]
pub struct Team {
    name: String,
    description: String,
    chat: String,
    leads: Vec<String>,
}

fn read_team_yaml(team: &str) -> io::Result<Team> {
    let data_path = Path::new("./src/data/teams/").join(team).join("team.yml");
    assert!(fs::metadata(&data_path)?.is_file());
    let data_string = fs::read_to_string(&data_path)?;
    let data: Team = serde_yaml::from_str(&data_string).unwrap();
    Ok(data)
}

pub fn get_teams() -> io::Result<Vec<Team>> {
    let mut teams = vec![];
    let team_data = fs::read_dir("./src/data/teams/")?;
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

pub fn get_teaminfo(team: &str) -> io::Result<Team> {
    read_team_yaml(team)
}

pub fn get_subteams(team: &str) -> io::Result<Vec<Team>> {
    let mut teams = vec![];
    println!("team {}", team);
    let data_path = Path::new("./src/data/teams/").join(team).join("subteams");
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

pub fn get_subwgs(team: &str) -> io::Result<Vec<Team>> {
    let mut wgs = vec![];
    let data_path = Path::new("./src/data/teams/").join(team).join("wgs");
    if fs::metadata(&data_path).is_ok() {
        let wg_data = fs::read_dir(data_path)?;
        for wg in wg_data {
            let wg = wg?;
            let data = read_team_yaml(&get_name_from_direntry(wg.path())).unwrap();
            wgs.push(data);
        }
    }
    Ok(wgs)
}

pub fn get_wgs() -> io::Result<Vec<Team>> {
    let mut teams = vec![];
    let team_data = fs::read_dir("./src/data/wgs/")?;
    for team in team_data {
        let team = team?;
        let data = read_team_yaml(&get_name_from_direntry(team.path())).unwrap();
        teams.push(data);
    }
    Ok(teams)
}

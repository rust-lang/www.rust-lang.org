use std::fs;
use std::io;
use std::path::PathBuf;

#[derive(Serialize)]
pub struct Team {
    name: String,
}

pub fn get_teams() -> io::Result<Vec<Team>> {
    let mut teams = vec![];
    let team_data = fs::read_dir("./src/data/teams/")?;
    for team in team_data {
        let team = team?;
        teams.push(Team {
            name: team.file_name().into_string().unwrap(),
        });
    }
    Ok(teams)
}

pub fn get_wgs() -> io::Result<Vec<Team>> {
    let mut teams = vec![];
    let team_data = fs::read_dir("./src/data/wgs/")?;
    for team in team_data {
        let team = team?;
        teams.push(Team {
            name: team.file_name().into_string().unwrap(),
        });
    }
    Ok(teams)
}

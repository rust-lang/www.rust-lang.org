use std::fs;
use std::io;
use std::path::Path;

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

pub fn get_teaminfo(team: &str) -> io::Result<Team> {
    println!("team {}", team);
    let data_path = Path::new("./src/data/teams/").join(team).join("team.yml");
    assert!(fs::metadata(data_path)?.is_file());
    Ok(Team { name: team.to_string() })
}

pub fn get_subteams(team: &str) -> io::Result<Vec<Team>> {
    let mut teams = vec![];
    println!("team {}", team);
    let data_path = Path::new("./src/data/teams/").join(team).join("subteams");
    if fs::metadata(&data_path).is_ok() {
        let team_data = fs::read_dir(data_path)?;
        for team in team_data {
            let team = team?;
            teams.push(Team {
                name: team.file_name().into_string().unwrap(),
            });
        }
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

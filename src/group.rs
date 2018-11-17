extern crate serde_yaml;

use std::fs;
use std::io;
use std::path::{Path, PathBuf};

#[derive(Serialize, Deserialize)]
pub struct Group {
    route: String,
    name: String,
    description: String,
    chat: String,
    leads: Vec<String>,
}

fn read_team_yaml(t: &str, name: &str) -> io::Result<Group> {
    let data_path = Path::new("./src/data/").join(t).join(name).join("team.yml");
    assert!(fs::metadata(&data_path)?.is_file());
    let data_string = fs::read_to_string(&data_path)?;
    let data: Group =
        serde_yaml::from_str(&data_string).expect(&format!("failed yaml parse for {} {}", t, name));
    Ok(data)
}

fn read_subs_yaml(t: &str, group: &str, st: &str, sub: &str) -> io::Result<Group> {
    let data_path = Path::new("./src/data/")
        .join(t)
        .join(group)
        .join(st)
        .join(format!("{}.yml", sub));
    println!("trying to find {:?}", data_path);
    assert!(fs::metadata(&data_path)?.is_file());
    let data_string = fs::read_to_string(&data_path)?;
    let data: Group = serde_yaml::from_str(&data_string).expect(&format!(
        "failed yaml parse for {} {} {} {}",
        t, group, st, sub
    ));
    Ok(data)
}

pub fn get_data(t: &str) -> io::Result<Vec<Group>> {
    let mut teams = vec![];
    let team_data = fs::read_dir(Path::new("./src/data/").join(t))?;
    for team in team_data {
        let team = team?;
        let data = read_team_yaml(t, &get_name_from_path(team.path()))
            .expect(&format!("couldn't get team data for type {}", t));
        teams.push(data);
    }
    Ok(teams)
}

fn get_name_from_path(path: PathBuf) -> String {
    path.file_stem()
        .expect("no file stem")
        .to_str()
        .expect("can't make file a string")
        .to_string()
}

pub fn get_info(t: &str, name: &str) -> io::Result<Group> {
    read_team_yaml(t, name)
}

pub fn get_subs(t: &str, team: &str, st: &str) -> io::Result<Vec<Group>> {
    let mut teams = vec![];
    println!("team {}", team);
    let data_path = Path::new("./src/data").join(t).join(team).join(st);
    if fs::metadata(&data_path).is_ok() {
        let sub_data = fs::read_dir(data_path)?;
        for sub in sub_data {
            let sub = sub?;
            let data =
                read_subs_yaml(t, team, st, &get_name_from_path(sub.path())).expect(&format!(
                    "couldn't get subs data for {} {} {}",
                    t,
                    team,
                    get_name_from_path(sub.path())
                ));
            teams.push(data);
        }
    }
    Ok(teams)
}

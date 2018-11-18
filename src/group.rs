extern crate serde_yaml;

use std::fmt;
use std::fs;
use std::io;
use std::path::{Path, PathBuf};

pub enum GroupType {
    WorkingGroup,
    Team,
    Peer,
    Shepard,
}

impl fmt::Display for GroupType {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            GroupType::WorkingGroup => write!(f, "wgs"),
            GroupType::Team => write!(f, "teams"),
            GroupType::Peer => write!(f, "peers"),
            GroupType::Shepard => write!(f, "shepards"),
        }
    }
}

#[derive(Serialize, Deserialize)]
pub struct Group {
    route: String,
    name: String,
    description: String,
    chat: Option<String>,
    repo: Option<String>,
    email: Option<String>,
    leads: Option<Vec<String>>,
    members: Option<Vec<String>>,
}

fn read_toplevel_yaml(t: &GroupType, name: &str) -> io::Result<Group> {
    let data_path = Path::new("./src/data/")
        .join(t.to_string())
        .join(name)
        .join("team.yml");
    assert!(fs::metadata(&data_path)?.is_file());
    let data_string = fs::read_to_string(&data_path)?;
    let data: Group =
        serde_yaml::from_str(&data_string).expect(&format!("failed yaml parse for {} {}", t, name));
    Ok(data)
}

fn read_subs_yaml(t: &GroupType, group: &str, st: &GroupType, sub: &str) -> io::Result<Group> {
    let data_path = Path::new("./src/data/")
        .join(t.to_string())
        .join(group)
        .join(st.to_string())
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

pub fn get_toplevel_data(t: &GroupType) -> io::Result<Vec<Group>> {
    let mut groups = vec![];
    let groups_data = fs::read_dir(Path::new("./src/data/").join(t.to_string()))?;
    for group in groups_data {
        let group = group?;
        let data = read_toplevel_yaml(t, &get_name_from_path(group.path()))
            .expect(&format!("couldn't get toplevel group data for type {}", t));
        groups.push(data);
    }
    Ok(groups)
}

fn get_name_from_path(path: PathBuf) -> String {
    path.file_stem()
        .expect("no file stem")
        .to_str()
        .expect("can't make file a string")
        .to_string()
}

pub fn get_info(t: &GroupType, name: &str) -> io::Result<Group> {
    read_toplevel_yaml(t, name)
}

pub fn get_subs_data(t: &GroupType, group: &str, st: &GroupType) -> io::Result<Vec<Group>> {
    let mut groups = vec![];
    let data_path = Path::new("./src/data")
        .join(t.to_string())
        .join(group)
        .join(st.to_string());
    if fs::metadata(&data_path).is_ok() {
        let sub_data = fs::read_dir(data_path)?;
        for sub in sub_data {
            let sub = sub?;
            let data =
                read_subs_yaml(t, group, st, &get_name_from_path(sub.path())).expect(&format!(
                    "couldn't get subs data for {} {} {}",
                    t,
                    group,
                    get_name_from_path(sub.path())
                ));
            groups.push(data);
        }
    }
    Ok(groups)
}

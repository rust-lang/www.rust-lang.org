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

fn read_toplevel_yaml(t: &str, name: &str) -> io::Result<Group> {
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

pub fn get_toplevel_data(t: &str) -> io::Result<Vec<Group>> {
    let mut groups = vec![];
    let groups_data = fs::read_dir(Path::new("./src/data/").join(t))?;
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

pub fn get_info(t: &str, name: &str) -> io::Result<Group> {
    read_toplevel_yaml(t, name)
}

pub fn get_subs_data(t: &str, group: &str, st: &str) -> io::Result<Vec<Group>> {
    let mut groups = vec![];
    let data_path = Path::new("./src/data").join(t).join(group).join(st);
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

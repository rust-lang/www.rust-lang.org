#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rand;
extern crate reqwest;
extern crate rocket;
extern crate sass_rs;
extern crate toml;

extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;

mod category;
mod group;
mod production;
mod rust_version;

use group::*;
use production::User;

use std::collections::HashMap;
use std::fs::File;
use std::io::prelude::*;
use std::path::{Path, PathBuf};

use rand::seq::SliceRandom;

use rocket::response::NamedFile;
use rocket::Error;
use rocket_contrib::Template;

use sass_rs::{compile_file, Options};

use category::Category;

#[derive(Serialize)]
struct Context {
    page: String,
    title: String,
    parent: String,
    is_landing: bool,
}

#[derive(Serialize)]
struct GroupContext {
    page: String,
    title: String,
    parent: String,
    is_landing: bool,
    data: HashMap<String, Vec<Group>>,
}

#[derive(Serialize)]
struct UsersContext {
    page: String,
    title: String,
    parent: String,
    is_landing: bool,
    data: Vec<Vec<User>>,
}

#[get("/")]
fn index() -> Template {
    #[derive(Serialize)]
    struct Context {
        page: String,
        title: String,
        parent: String,
        is_landing: bool,
        rust_version: String,
    }

    let page = "index".to_string();
    let title = format!("Rust - {}", page).to_string();

    let context = Context {
        page: page.clone(),
        title,
        parent: "layout".to_string(),
        is_landing: true,
        rust_version: rust_version::rust_version()
            .map_or(String::new(), |v| format!("Version {}", v)),
    };
    Template::render(page, &context)
}

#[get("/static/<file..>", rank = 1)]
fn files(file: PathBuf) -> Option<NamedFile> {
    NamedFile::open(Path::new("static/").join(file)).ok()
}

#[get("/<category>")]
fn category(category: Category) -> Template {
    let page = category.index();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: category.name().to_string(),
        title,
        parent: "layout".to_string(),
        is_landing: false,
    };
    Template::render(page, &context)
}

#[get("/governance")]
fn governance() -> Template {
    let page = "governance/index".to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = GroupContext {
        page: page.clone(),
        title,
        parent: "layout".to_string(),
        is_landing: false,
        data: load_governance_data(),
    };
    Template::render(page, &context)
}

fn load_governance_data() -> HashMap<String, Vec<Group>> {
    let mut map: HashMap<String, Vec<Group>> = HashMap::new();
    map.insert(
        GroupType::Team.to_string(),
        group::get_toplevel_data(&GroupType::Team).expect("couldn't get teams data"),
    );
    map.insert(
        GroupType::WorkingGroup.to_string(),
        group::get_toplevel_data(&GroupType::WorkingGroup).expect("couldn't get wgs data"),
    );
    map
}

#[get("/governance/<t>/<subject>", rank = 2)]
fn team(t: String, subject: String) -> Template {
    let page = "governance/group".to_string();
    let title = format!("Rust - {}", page).to_string();
    let t = get_type_from_string(&t).expect("couldn't figure out group type from path string");
    let context = GroupContext {
        page: page.clone(),
        title,
        parent: "layout".to_string(),
        is_landing: false,
        data: load_group_data(t, &subject),
    };
    Template::render(page, &context)
}

fn get_type_from_string(s: &str) -> Result<GroupType, Error> {
    match s {
        "wgs" => Ok(GroupType::WorkingGroup),
        "teams" => Ok(GroupType::Team),
        "peers" => Ok(GroupType::Peer),
        "shepards" => Ok(GroupType::Shepard),
        _ => Err(Error::Internal),
    }
}

fn load_group_data(t: GroupType, group: &str) -> HashMap<String, Vec<Group>> {
    let mut map: HashMap<String, Vec<Group>> = HashMap::new();
    map.insert(
        "info".to_string(),
        vec![group::get_info(&t, group).expect("couldn't get group info")],
    );
    let subteams =
        group::get_subs_data(&t, group, &GroupType::Team).expect("couldn't get subteams data");
    if !subteams.is_empty() {
        map.insert("subteams".to_string(), subteams);
    }
    let subwgs = group::get_subs_data(&t, group, &GroupType::WorkingGroup)
        .expect("couldn't get subwgs data");
    if !subwgs.is_empty() {
        map.insert("subwgs".to_string(), subwgs);
    }
    map
}

#[get("/production/users")]
fn production() -> Template {
    let page = "production/users".to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = UsersContext {
        page: page.clone(),
        title,
        parent: "layout".to_string(),
        is_landing: false,
        data: load_users_data(),
    };
    Template::render(page, &context)
}

fn load_users_data() -> Vec<Vec<User>> {
    let mut rng = rand::thread_rng();
    let mut users = production::get_info().expect("couldn't get production users data");
    users.shuffle(&mut rng);
    users.chunks(3).map(|s| s.to_owned()).collect()
}

#[get("/<category>/<subject>", rank = 4)]
fn subject(category: Category, subject: String) -> Template {
    let page = format!("{}/{}", category.name(), subject.as_str()).to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: subject,
        title,
        parent: "layout".to_string(),
        is_landing: false,
    };
    Template::render(page, &context)
}

#[catch(404)]
fn not_found() -> Template {
    let page = "404";
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: "404".to_string(),
        title,
        parent: "layout".to_string(),
        is_landing: false,
    };
    Template::render(page, &context)
}

#[catch(500)]
fn catch_error() -> Template {
    not_found()
}

fn compile_sass(filename: &str) {
    let scss_file = format!("./src/styles/{}.scss", filename);
    let css_file = format!("./static/styles/{}.css", filename);

    let css = compile_file(&scss_file, Options::default())
        .expect(&format!("couldn't compile sass: {}", &scss_file));
    let mut file =
        File::create(&css_file).expect(&format!("couldn't make css file: {}", &css_file));
    file.write_all(&css.into_bytes())
        .expect(&format!("couldn't write css file: {}", &css_file));
}

fn main() {
    compile_sass("app");
    compile_sass("fonts");

    rocket::ignite()
        .attach(Template::fairing())
        .mount(
            "/",
            routes![index, category, governance, team, production, subject, files],
        )
        .catch(catchers![not_found, catch_error])
        .launch();
}

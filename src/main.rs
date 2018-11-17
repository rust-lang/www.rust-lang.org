#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rocket;
extern crate sass_rs;

extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;

mod category;
mod team;

use team::*;

use std::collections::HashMap;
use std::fs::File;
use std::io::prelude::*;
use std::path::{Path, PathBuf};

use rocket::response::NamedFile;
use rocket_contrib::Template;

use sass_rs::{compile_file, Options};

use category::Category;

#[derive(Serialize)]
struct Context {
    page: String,
    title: String,
    parent: String,
    data: Option<HashMap<String, Vec<Team>>>,
}

#[get("/")]
fn index() -> Template {
    let page = "index".to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: "index".to_string(),
        title: title,
        parent: "layout".to_string(),
        data: None,
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
        title: title,
        parent: "layout".to_string(),
        data: load_governance_data(&page),
    };
    Template::render(page, &context)
}

fn load_governance_data(page: &str) -> Option<HashMap<String, Vec<Team>>> {
    let mut map: HashMap<String, Vec<Team>> = HashMap::new();
    if page == "governance/index" {
        map.insert("teams".to_string(), team::get_teams().unwrap());
        map.insert("wgs".to_string(), team::get_wgs().unwrap());
        return Some(map);
    }
    None
}

#[get("/governance/<subject>", rank = 2)]
fn team(subject: String) -> Template {
    let page = "governance/team".to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: "farts".to_string(),
        title: title,
        parent: "layout".to_string(),
        data: load_team_data(&subject),
    };
    Template::render(page, &context)
}

fn load_team_data(team: &str) -> Option<HashMap<String, Vec<Team>>> {
    let mut map: HashMap<String, Vec<Team>> = HashMap::new();
    map.insert("info".to_string(), vec![team::get_teaminfo(team).unwrap()]);
    let subteams = team::get_subteams(team).unwrap();
    if subteams.len() > 0 {
        map.insert("subteams".to_string(), subteams);
    }
    let subwgs = team::get_subwgs(team).unwrap();
    if subwgs.len() > 0 {
        map.insert("subwgs".to_string(), subwgs);
    }
    return Some(map);
}

#[get("/<category>/<subject>", rank = 4)]
fn subject(category: Category, subject: String) -> Template {
    let page = format!("{}/{}", category.name(), subject.as_str()).to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: subject,
        title: title,
        parent: "layout".to_string(),
        data: None,
    };
    Template::render(page, &context)
}

#[catch(404)]
fn not_found() -> Template {
    let page = "404";
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: "404".to_string(),
        title: title,
        parent: "layout".to_string(),
        data: None,
    };
    Template::render(page, &context)
}

#[catch(500)]
fn catch_error() -> Template {
    not_found()
}

fn compile_sass() {
    let scss = "./src/styles/app.scss";
    let css = compile_file(scss, Options::default()).unwrap();
    let mut file = File::create("./static/styles/app.css").unwrap();
    file.write_all(&css.into_bytes()).unwrap();
}

fn main() {
    compile_sass();
    rocket::ignite()
        .attach(Template::fairing())
        .mount("/", routes![index, category, team, subject, files])
        .catch(catchers![not_found, catch_error])
        .launch();
}

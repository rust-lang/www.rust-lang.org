#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate lazy_static;
extern crate rand;
extern crate reqwest;
extern crate serde_json;
#[macro_use]
extern crate rocket;
extern crate sass_rs;
extern crate toml;

extern crate rocket_contrib;
extern crate serde;
#[macro_use]
extern crate serde_derive;

mod cache;
mod category;
mod group;
mod production;
mod redirect;
mod rust_version;

use group::*;
use production::User;

use std::collections::HashMap;
use std::fs;
use std::fs::File;
use std::io::prelude::*;
use std::iter::FromIterator;
use std::path::{Path, PathBuf};

use rand::seq::SliceRandom;

use rocket::response::{NamedFile, Redirect};
use rocket_contrib::templates::Template;

use sass_rs::{compile_file, Options};

use category::Category;

#[derive(Serialize)]
struct Context<T: ::serde::Serialize> {
    page: String,
    title: String,
    parent: String,
    is_landing: bool,
    data: T,
}

static LAYOUT: &str = "components/layout";

fn get_title(page_name: &str) -> String {
    let mut v: Vec<char> = page_name.replace("-", " ").chars().collect();
    v[0] = v[0].to_uppercase().nth(0).unwrap();
    let page_name = String::from_iter(v);
    format!("{} - Rust programming language", page_name).to_string()
}

#[get("/")]
fn index() -> Template {
    #[derive(Serialize)]
    struct IndexData {
        rust_version: String,
        rust_release_post: String,
    }

    let page = "index".to_string();
    let title = "Rust programming language".to_string();

    let context = Context {
        page: page.clone(),
        title,
        parent: LAYOUT.to_string(),
        is_landing: true,
        data: IndexData {
            rust_version: rust_version::rust_version()
                .map_or(String::new(), |v| format!("Version {}", v)),
            rust_release_post: rust_version::rust_release_post().map_or(String::new(), |v| {
                format!("https://blog.rust-lang.org/{}", v)
            }),
        },
    };
    Template::render(page, &context)
}

#[get("/components/<_file..>", rank = 1)]
fn components(_file: PathBuf) -> Template {
    not_found()
}

#[get("/logos/<file..>", rank = 1)]
fn logos(file: PathBuf) -> Option<NamedFile> {
    NamedFile::open(Path::new("static/logos").join(file)).ok()
}

#[get("/static/<file..>", rank = 1)]
fn files(file: PathBuf) -> Option<NamedFile> {
    NamedFile::open(Path::new("static/").join(file)).ok()
}

#[get("/<category>")]
fn category(category: Category) -> Template {
    let page = category.index();
    let title = get_title(&category.name());
    let context = Context {
        page: category.name().to_string(),
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: (),
    };
    Template::render(page, &context)
}

#[get("/governance")]
fn governance() -> Template {
    let page = "governance/index".to_string();
    let title = "Governance - Rust programming language".to_string();
    let context = Context {
        page: page.clone(),
        title,
        parent: LAYOUT.to_string(),
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
    let t = get_type_from_string(&t).expect("couldn't figure out group type from path string");
    let title = get_title(&format!("{} team", subject));
    let context = Context {
        page: page.clone(),
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: load_group_data(t, &subject),
    };
    Template::render(page, &context)
}

fn get_type_from_string(s: &str) -> Result<GroupType, ()> {
    match s {
        "wgs" => Ok(GroupType::WorkingGroup),
        "teams" => Ok(GroupType::Team),
        "peers" => Ok(GroupType::Peer),
        "shepards" => Ok(GroupType::Shepard),
        _ => Err(()),
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
    let title = "Users - Rust programming language".to_string();
    let context = Context {
        page: page.clone(),
        title,
        parent: LAYOUT.to_string(),
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
    let title = get_title(&subject);
    let context = Context {
        page: subject,
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: (),
    };
    Template::render(page, &context)
}

#[get("/<dest>", rank = 9)]
fn redirect(dest: redirect::Destination) -> Redirect {
    Redirect::permanent(dest.uri)
}

#[get("/en-US/<dest>")]
fn redirect_en_us(dest: redirect::Destination) -> Redirect {
    Redirect::permanent(dest.uri)
}

#[get("/<_locale>/<dest>", rank = 9)]
fn redirect_locale(_locale: redirect::Locale, dest: redirect::Destination) -> Redirect {
    // Temporary until locale support is restored.
    Redirect::temporary(dest.uri)
}

#[catch(404)]
fn not_found() -> Template {
    let page = "404";
    let title = format!("{} - Rust programming language", page).to_string();
    let context = Context {
        page: "404".to_string(),
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: (),
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

fn concat_vendor_css(files: Vec<&str>) {
    let mut concatted = String::new();
    for filestem in files {
        let vendor_path = format!("./static/styles/{}.css", filestem);
        let contents = fs::read_to_string(vendor_path).expect("couldn't read vendor css");
        concatted.push_str(&contents);
    }
    fs::write("./static/styles/vendor.css", &concatted).expect("couldn't write vendor css");
}

fn main() {
    compile_sass("app");
    compile_sass("fonts");
    concat_vendor_css(vec!["skeleton", "tachyons"]);

    rocket::ignite()
        .attach(Template::fairing())
        .mount(
            "/",
            routes![
                index,
                category,
                governance,
                team,
                production,
                subject,
                files,
                logos,
                components,
                redirect,
                redirect_en_us,
                redirect_locale
            ],
        )
        .register(catchers![not_found, catch_error])
        .launch();
}

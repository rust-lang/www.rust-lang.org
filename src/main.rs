#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rocket;

extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;

use std::io;
use std::path::{Path, PathBuf};

use rocket::response::NamedFile;
use rocket_contrib::Template;

#[derive(Serialize)]
struct Context {
    page: String,
    title: String,
    parent: String,
}

#[get("/")]
fn index() -> Template {
    let page = "index".to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: "index".to_string(),
        title: title,
        parent: "layout".to_string(),
    };
    Template::render(page, &context)
}

#[get("/static/<file..>", rank = 1)]
fn files(file: PathBuf) -> Option<NamedFile> {
    NamedFile::open(Path::new("static/").join(file)).ok()
}

#[get("/<category>")]
fn category(category: String) -> Template {
    let page = format!("{}/index", category.as_str()).to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: category,
        title: title,
        parent: "layout".to_string(),
    };
    Template::render(page, &context)
}

#[get("/<category>/<subject>", rank = 2)]
fn subject(category: String, subject: String) -> Template {
    let page = format!("{}/{}", category.as_str(), subject.as_str()).to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: subject,
        title: title,
        parent: "layout".to_string(),
    };
    Template::render(page, &context)
}

fn main() {
    rocket::ignite()
        .attach(Template::fairing())
        .mount("/", routes![index, category, subject, files])
        .launch();
}

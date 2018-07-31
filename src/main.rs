#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rocket;
extern crate sass_rs;

extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;

mod category;

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
fn category(category: Category) -> Template {
    let page = category.index();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: category.name().to_string(),
        title: title,
        parent: "layout".to_string(),
    };
    Template::render(page, &context)
}

#[get("/<category>/<subject>", rank = 2)]
fn subject(category: Category, subject: String) -> Template {
    let page = format!("{}/{}", category.name(), subject.as_str()).to_string();
    let title = format!("Rust - {}", page).to_string();
    let context = Context {
        page: subject,
        title: title,
        parent: "layout".to_string(),
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
    };
    Template::render(page, &context)
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
        .mount("/", routes![index, category, subject, files])
        .catch(catchers![not_found])
        .launch();
}

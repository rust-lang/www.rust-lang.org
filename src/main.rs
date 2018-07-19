#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rocket;
extern crate sass_rs;

extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;
extern crate comrak;

use std::fs::File;
use std::io::prelude::*;
use std::path::{Path, PathBuf};

use rocket::response::NamedFile;
use rocket_contrib::Template;

use sass_rs::{compile_file, Options};

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

#[get("/<category>/<subject>/<chapter>", rank = 2)]
fn chapter(category: String, subject: String, chapter: String) -> Template {
    let page = format!("{}/{}/{}", category, subject, chapter);
    let title = format!("Rust - {} - {}", page, chapter);
    let md_path = PathBuf::from("./templates")
        .join(&page)
        .with_extension("md");
    let content = match ::std::fs::read_to_string(&md_path) {
        Err(e) => {
            println!("Err on {}: {} ({})", page, e, md_path.display());
            None
        }
        Ok(markdown) => {
            use comrak::{markdown_to_html, ComrakOptions};
            Some(markdown_to_html(
                &markdown,
                &ComrakOptions {
                    ext_header_ids: Some("content-".into()),
                    ..ComrakOptions::default()
                },
            ))
        }
    };

    #[derive(Serialize)]
    struct Context {
        page: String,
        title: String,
        parent: String,
        content: Option<String>,
    }

    let context = Context {
        parent: "layout".to_string(),
        page: page.clone(),
        title,
        content,
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
        .mount("/", routes![index, category, subject, chapter, files])
        .launch();
}

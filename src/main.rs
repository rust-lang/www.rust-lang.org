#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rocket_contrib;
extern crate rocket;

use rocket_contrib::Template;

#[get("/")]
fn index() -> Template {
    let context = {};
    Template::render("index", &context)
}

#[get("/<category>")]
fn category(category: String) -> Template {
    let context = {};
    let path = format!("{}/index", category.as_str());
    Template::render(path, &context)
}

#[get("/<category>/<subject>")]
fn subject(category: String, subject: String) -> Template {
    let context = {};
    let path = format!("{}/{}", category.as_str(), subject.as_str());
    Template::render(path, &context)
}

fn main() {
    rocket::ignite()
      .attach(Template::fairing())
      .mount("/", routes![index, category, subject]).launch();
}

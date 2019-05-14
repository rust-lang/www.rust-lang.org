#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate lazy_static;
extern crate rand;
extern crate reqwest;
extern crate serde_json;
#[macro_use]
extern crate rocket;
extern crate rust_team_data;
extern crate sass_rs;
extern crate toml;

extern crate rocket_contrib;
extern crate serde;
#[macro_use]
extern crate serde_derive;

extern crate fluent_bundle;
extern crate regex;

extern crate handlebars;

mod cache;
mod caching;
mod category;
mod headers;
mod i18n;
mod production;
mod redirect;
mod rust_version;
mod teams;

use production::User;

use std::fs;
use std::fs::File;
use std::io::prelude::*;
use std::iter::FromIterator;
use std::path::{Path, PathBuf};

use rand::seq::SliceRandom;

use rocket::{
    http::Status,
    response::{NamedFile, Redirect},
};
use rocket_contrib::templates::Template;

use sass_rs::{compile_file, Options};

use category::Category;

use i18n::{I18NHelper, SupportedLocale, TeamHelper};
use caching::{Cached, Caching};
use rocket::http::hyper::header::CacheDirective;

#[derive(Serialize)]
struct Context<T: ::serde::Serialize> {
    page: String,
    title: String,
    parent: String,
    is_landing: bool,
    data: T,
    lang: String,
    baseurl: String,
}

static LAYOUT: &str = "components/layout";
static ENGLISH: &str = "en-US";

fn baseurl(lang: &str) -> String {
    if lang == "en-US" {
        String::new()
    } else {
        format!("/{}", lang)
    }
}

fn get_title(page_name: &str) -> String {
    let mut v: Vec<char> = page_name.replace("-", " ").chars().collect();
    v[0] = v[0].to_uppercase().nth(0).unwrap();
    let page_name = String::from_iter(v);
    format!("{} - Rust programming language", page_name).to_string()
}

#[get("/components/<_file..>", rank = 1)]
fn components(_file: PathBuf) -> Template {
    not_found()
}

#[get("/logos/<file..>", rank = 1)]
fn logos(file: PathBuf) -> Option<Cached<NamedFile>> {
    NamedFile::open(Path::new("static/logos").join(file))
        .ok()
        .map(|file| file.cached(vec![CacheDirective::MaxAge(3600)]))
}

#[get("/static/<file..>", rank = 1)]
fn files(file: PathBuf) -> Option<Cached<NamedFile>> {
    NamedFile::open(Path::new("static/").join(file))
        .ok()
        .map(|file| file.cached(vec![CacheDirective::MaxAge(3600)]))
}

#[get("/")]
fn index() -> Template {
    render_index(ENGLISH.into())
}

#[get("/<locale>", rank = 3)]
fn index_locale(locale: SupportedLocale) -> Template {
    render_index(locale.0)
}

#[get("/<category>")]
fn category(category: Category) -> Template {
    render_category(category, ENGLISH.into())
}

#[get("/<locale>/<category>", rank = 11)]
fn category_locale(category: Category, locale: SupportedLocale) -> Template {
    render_category(category, locale.0)
}

#[get("/governance")]
fn governance() -> Result<Template, Status> {
    render_governance(ENGLISH.into())
}

#[get("/governance/<section>/<team>", rank = 2)]
fn team(section: String, team: String) -> Result<Template, Result<Redirect, Status>> {
    render_team(section, team, ENGLISH.into())
}

#[get("/<locale>/governance", rank = 10)]
fn governance_locale(locale: SupportedLocale) -> Result<Template, Status> {
    render_governance(locale.0)
}

#[get("/<locale>/governance/<section>/<team>", rank = 12)]
fn team_locale(
    section: String,
    team: String,
    locale: SupportedLocale,
) -> Result<Template, Result<Redirect, Status>> {
    render_team(section, team, locale.0)
}

#[get("/production/users")]
fn production() -> Template {
    render_production(ENGLISH.into())
}

#[get("/<locale>/production/users", rank = 10)]
fn production_locale(locale: SupportedLocale) -> Template {
    render_production(locale.0)
}

#[get("/<category>/<subject>", rank = 4)]
fn subject(category: Category, subject: String) -> Template {
    render_subject(category, subject, ENGLISH.into())
}

#[get("/<locale>/<category>/<subject>", rank = 14)]
fn subject_locale(category: Category, subject: String, locale: SupportedLocale) -> Template {
    render_subject(category, subject, locale.0)
}

fn load_users_data() -> Vec<Vec<User>> {
    let mut rng = rand::thread_rng();
    let mut users = production::get_info().expect("couldn't get production users data");
    users.shuffle(&mut rng);
    users.chunks(3).map(|s| s.to_owned()).collect()
}

#[get("/<dest>", rank = 19)]
fn redirect(dest: redirect::Destination) -> Redirect {
    Redirect::permanent(dest.uri)
}

#[get("/pdfs/<dest>")]
fn redirect_pdfs(dest: redirect::Destination) -> Redirect {
    Redirect::permanent("/static/pdfs/".to_owned() + dest.uri)
}
#[get("/en-US", rank = 1)]
fn redirect_bare_en_us() -> Redirect {
    Redirect::permanent("/")
}

#[get("/<_locale>", rank = 20)]
fn redirect_bare_locale(_locale: redirect::Locale) -> Redirect {
    Redirect::temporary("/")
}

#[get("/en-US/<dest>", rank = 1)]
fn redirect_en_us(dest: redirect::Destination) -> Redirect {
    Redirect::permanent(dest.uri)
}

#[get("/<_locale>/<dest>", rank = 20)]
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
        lang: ENGLISH.to_string(),
        baseurl: String::new(),
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

fn render_index(lang: String) -> Template {
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
            rust_version: rust_version::rust_version().unwrap_or(String::new()),
            rust_release_post: rust_version::rust_release_post().map_or(String::new(), |v| {
                format!("https://blog.rust-lang.org/{}", v)
            }),
        },
        baseurl: baseurl(&lang),
        lang,
    };
    Template::render(page, &context)
}

fn render_category(category: Category, lang: String) -> Template {
    let page = category.index();
    let title = get_title(&category.name());
    let context = Context {
        page: category.name().to_string(),
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: (),
        baseurl: baseurl(&lang),
        lang,
    };
    Template::render(page, &context)
}

fn render_production(lang: String) -> Template {
    let page = "production/users".to_string();
    let title = "Users - Rust programming language".to_string();
    let context = Context {
        page: page.clone(),
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: load_users_data(),
        baseurl: baseurl(&lang),
        lang,
    };
    Template::render(page, &context)
}

fn render_governance(lang: String) -> Result<Template, Status> {
    match teams::index_data() {
        Ok(data) => {
            let page = "governance/index".to_string();
            let title = "Governance - Rust programming language".to_string();
            let context = Context {
                page: page.clone(),
                title,
                parent: LAYOUT.to_string(),
                is_landing: false,
                data,
                baseurl: baseurl(&lang),
                lang,
            };
            Ok(Template::render(page, &context))
        }
        Err(err) => {
            eprintln!("error while loading the governance page: {}", err);
            Err(Status::InternalServerError)
        }
    }
}

fn render_team(
    section: String,
    team: String,
    lang: String,
) -> Result<Template, Result<Redirect, Status>> {
    match teams::page_data(&section, &team) {
        Ok(data) => {
            let page = "governance/group".to_string();
            let title = get_title(&data.team.website_data.as_ref().unwrap().name);
            let context = Context {
                page: page.clone(),
                title,
                parent: LAYOUT.to_string(),
                is_landing: false,
                data,
                baseurl: baseurl(&lang),
                lang,
            };
            Ok(Template::render(page, &context))
        }
        Err(err) => {
            if err.is::<teams::TeamNotFound>() {
                match (section.as_str(), team.as_str()) {
                    // Old teams URLs
                    ("teams", "language-and-compiler") => {
                        Err(Ok(Redirect::temporary("/governance")))
                    }
                    _ => Err(Err(Status::NotFound)),
                }
            } else {
                eprintln!("error while loading the team page: {}", err);
                Err(Err(Status::InternalServerError))
            }
        }
    }
}

fn render_subject(category: Category, subject: String, lang: String) -> Template {
    let page = format!("{}/{}", category.name(), subject.as_str()).to_string();
    let title = get_title(&subject);
    let context = Context {
        page: subject,
        title,
        parent: LAYOUT.to_string(),
        is_landing: false,
        data: (),
        baseurl: baseurl(&lang),
        lang,
    };
    Template::render(page, &context)
}

fn main() {
    compile_sass("app");
    compile_sass("fonts");
    concat_vendor_css(vec!["skeleton", "tachyons"]);

    let templating = Template::custom(|engine| {
        engine
            .handlebars
            .register_helper("text", Box::new(I18NHelper::new()));
        engine
            .handlebars
            .register_helper("team-text", Box::new(TeamHelper::new()));
    });

    rocket::ignite()
        .attach(templating)
        .attach(headers::InjectHeaders)
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
                index_locale,
                category_locale,
                governance_locale,
                team_locale,
                production_locale,
                subject_locale,
                redirect,
                redirect_pdfs,
                redirect_bare_en_us,
                redirect_bare_locale,
                redirect_en_us,
                redirect_locale
            ],
        )
        .register(catchers![not_found, catch_error])
        .launch();
}

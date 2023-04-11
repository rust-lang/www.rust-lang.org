#![cfg_attr(test, deny(warnings))]

#[macro_use]
extern crate lazy_static;
extern crate rand;
extern crate reqwest;
extern crate serde_json;
#[macro_use]
extern crate rocket;
extern crate rust_team_data;
extern crate sass_rs;
extern crate siphasher;
extern crate toml;

#[macro_use]
extern crate serde;

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

use cache::Cache;
use cache::Cached;
use production::User;
use rocket::tokio::sync::RwLock;
use rust_version::RustReleasePost;
use rust_version::RustVersion;
use teams::encode_zulip_stream;
use teams::RustTeams;

use std::collections::hash_map::DefaultHasher;
use std::env;
use std::fs;
use std::hash::Hasher;
use std::path::{Path, PathBuf};
use std::sync::Arc;

use rand::seq::SliceRandom;

use rocket::{
    fs::NamedFile,
    http::Status,
    request::{FromParam, Request},
    response::{content, Redirect},
};
use rocket_dyn_templates::Template;

use sass_rs::{compile_file, Options};

use category::Category;

use caching::CachedNamedFile;
use handlebars_fluent::{loader::Loader, FluentHelper};
use i18n::{create_loader, LocaleInfo, SupportedLocale, TeamHelper, EXPLICIT_LOCALE_INFO};

const ZULIP_DOMAIN: &str = "https://rust-lang.zulipchat.com";

lazy_static! {
    static ref ASSETS: AssetFiles = {
        let app_css_file = compile_sass("app");
        let fonts_css_file = compile_sass("fonts");
        let vendor_css_file = concat_vendor_css(vec!["tachyons"]);
        let app_js_file = concat_app_js(vec!["tools-install"]);

        AssetFiles {
            css: CSSFiles {
                app: app_css_file,
                fonts: fonts_css_file,
                vendor: vendor_css_file,
            },
            js: JSFiles { app: app_js_file },
        }
    };
    static ref PONTOON_ENABLED: bool = env::var("RUST_WWW_PONTOON").is_ok();
    static ref ROBOTS_TXT_DISALLOW_ALL: bool = env::var("ROBOTS_TXT_DISALLOW_ALL").is_ok();
}

#[derive(Serialize)]
struct Context<T: ::serde::Serialize> {
    page: String,
    title: String,
    parent: &'static str,
    is_landing: bool,
    data: T,
    lang: String,
    baseurl: String,
    pontoon_enabled: bool,
    assets: &'static AssetFiles,
    locales: &'static [LocaleInfo],
    is_translation: bool,
}

impl<T: ::serde::Serialize> Context<T> {
    fn new(page: String, title_id: &str, is_landing: bool, data: T, lang: String) -> Self {
        let helper = create_loader();
        let title = if title_id.is_empty() {
            "".into()
        } else {
            let lang = lang.parse().expect("lang should be valid");
            helper.lookup(&lang, title_id, None)
        };
        Self {
            page,
            title,
            parent: LAYOUT,
            is_landing,
            data,
            baseurl: baseurl(&lang),
            is_translation: lang != "en-US",
            lang,
            pontoon_enabled: *PONTOON_ENABLED,
            assets: &ASSETS,
            locales: EXPLICIT_LOCALE_INFO,
        }
    }
}

#[derive(Clone, Serialize)]
struct CSSFiles {
    app: String,
    fonts: String,
    vendor: String,
}
#[derive(Clone, Serialize)]
struct JSFiles {
    app: String,
}
#[derive(Clone, Serialize)]
struct AssetFiles {
    css: CSSFiles,
    js: JSFiles,
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

#[get("/components/<_file..>", rank = 1)]
fn components(_file: PathBuf) -> Template {
    not_found_locale(ENGLISH.into())
}

#[get("/<locale>/components/<_file..>", rank = 11)]
fn components_locale(locale: SupportedLocale, _file: PathBuf) -> Template {
    not_found_locale(locale.0)
}

#[get("/logos/<file..>", rank = 1)]
async fn logos(file: PathBuf) -> Option<CachedNamedFile> {
    NamedFile::open(Path::new("static/logos").join(file))
        .await
        .ok()
        .map(|file| CachedNamedFile::max_age(file, 3600))
}

#[get("/static/<file..>", rank = 1)]
async fn files(file: PathBuf) -> Option<CachedNamedFile> {
    NamedFile::open(Path::new("static/").join(file))
        .await
        .ok()
        .map(|file| CachedNamedFile::max_age(file, 3600))
}

#[get("/robots.txt", rank = 1)]
fn robots_txt() -> Option<content::RawText<&'static str>> {
    if *ROBOTS_TXT_DISALLOW_ALL {
        Some(content::RawText("User-agent: *\nDisallow: /"))
    } else {
        None
    }
}

#[get("/")]
async fn index(
    version_cache: &Cache<RustVersion>,
    release_post_cache: &Cache<RustReleasePost>,
) -> Template {
    render_index(ENGLISH.into(), version_cache, release_post_cache).await
}

#[get("/<locale>", rank = 3)]
async fn index_locale(
    locale: SupportedLocale,
    version_cache: &Cache<RustVersion>,
    release_post_cache: &Cache<RustReleasePost>,
) -> Template {
    render_index(locale.0, version_cache, release_post_cache).await
}

#[get("/<category>")]
fn category_en(category: Category) -> Template {
    render_category(category, ENGLISH.into())
}

#[get("/<locale>/<category>", rank = 9)]
fn category_locale(category: Category, locale: SupportedLocale) -> Template {
    render_category(category, locale.0)
}

#[get("/governance")]
async fn governance(teams_cache: &Cache<RustTeams>) -> Result<Template, Status> {
    render_governance(ENGLISH.into(), teams_cache).await
}

#[get("/governance/<section>/<team>", rank = 2)]
async fn team(
    section: String,
    team: String,
    teams_cache: &Cache<RustTeams>,
) -> Result<Template, Result<Redirect, Status>> {
    render_team(section, team, ENGLISH.into(), teams_cache).await
}

#[get("/<locale>/governance", rank = 8)]
async fn governance_locale(
    locale: SupportedLocale,
    teams_cache: &Cache<RustTeams>,
) -> Result<Template, Status> {
    render_governance(locale.0, teams_cache).await
}

#[get("/<locale>/governance/<section>/<team>", rank = 12)]
async fn team_locale(
    section: String,
    team: String,
    locale: SupportedLocale,
    teams_cache: &Cache<RustTeams>,
) -> Result<Template, Result<Redirect, Status>> {
    render_team(section, team, locale.0, teams_cache).await
}

#[get("/production/users")]
fn get_production() -> Template {
    render_production(ENGLISH.into())
}

#[get("/<locale>/production/users", rank = 10)]
fn production_locale(locale: SupportedLocale) -> Template {
    render_production(locale.0)
}

#[get("/<category>/<subject>", rank = 4)]
fn subject(category: Category, subject: String) -> Result<Template, Status> {
    render_subject(category, subject, ENGLISH.into())
}

#[get("/<locale>/<category>/<subject>", rank = 14)]
fn subject_locale(
    category: Category,
    subject: String,
    locale: SupportedLocale,
) -> Result<Template, Status> {
    render_subject(category, subject, locale.0)
}

fn load_users_data() -> Vec<Vec<User>> {
    let mut rng = rand::thread_rng();
    let mut users = production::get_info().expect("couldn't get production users data");
    users.shuffle(&mut rng);
    users.chunks(3).map(|s| s.to_owned()).collect()
}

#[get("/en-US", rank = 1)]
fn redirect_bare_en_us() -> Redirect {
    Redirect::permanent("/")
}

#[catch(404)]
fn not_found(req: &Request) -> Result<Template, Redirect> {
    if let Some(redirect) = crate::redirect::maybe_redirect(req.uri().path()) {
        return Err(redirect);
    }

    let lang = if let Some(next) = req.uri().path().segments().next() {
        if let Ok(lang) = SupportedLocale::from_param(next) {
            lang.0
        } else {
            ENGLISH.into()
        }
    } else {
        ENGLISH.into()
    };

    Ok(not_found_locale(lang))
}

fn not_found_locale(lang: String) -> Template {
    let page = "404";
    let context = Context::new("404".into(), "error404-page-title", false, (), lang);
    Template::render(page, context)
}

#[catch(500)]
fn catch_error() -> Template {
    not_found_locale(ENGLISH.into())
}

fn hash_css(css: &str) -> String {
    let mut hasher = DefaultHasher::new();
    hasher.write(css.as_bytes());
    hasher.finish().to_string()
}

fn compile_sass(filename: &str) -> String {
    let scss_file = format!("./src/styles/{}.scss", filename);

    let css = compile_file(&scss_file, Options::default())
        .unwrap_or_else(|_| panic!("couldn't compile sass: {}", &scss_file));

    let css_sha = format!("{}_{}", filename, hash_css(&css));
    let css_file = format!("./static/styles/{}.css", css_sha);

    fs::write(&css_file, css.into_bytes())
        .unwrap_or_else(|_| panic!("couldn't write css file: {}", &css_file));

    String::from(&css_file[1..])
}

fn concat_vendor_css(files: Vec<&str>) -> String {
    let mut concatted = String::new();
    for filestem in files {
        let vendor_path = format!("./static/styles/{}.css", filestem);
        let contents = fs::read_to_string(vendor_path).expect("couldn't read vendor css");
        concatted.push_str(&contents);
    }

    let css_sha = format!("vendor_{}", hash_css(&concatted));
    let css_path = format!("./static/styles/{}.css", &css_sha);

    fs::write(&css_path, &concatted).expect("couldn't write vendor css");

    String::from(&css_path[1..])
}

fn concat_app_js(files: Vec<&str>) -> String {
    let mut concatted = String::new();
    for filestem in files {
        let vendor_path = format!("./static/scripts/{}.js", filestem);
        let contents = fs::read_to_string(vendor_path).expect("couldn't read app js");
        concatted.push_str(&contents);
    }

    let js_sha = format!("app_{}", hash_css(&concatted));
    let js_path = format!("./static/scripts/{}.js", &js_sha);

    fs::write(&js_path, &concatted).expect("couldn't write app js");

    String::from(&js_path[1..])
}

async fn render_index(
    lang: String,
    version_cache: &Cache<RustVersion>,
    release_post_cache: &Cache<RustReleasePost>,
) -> Template {
    #[derive(Serialize)]
    struct IndexData {
        rust_version: String,
        rust_release_post: String,
    }

    let page = "index".to_string();
    let release_post = rust_version::rust_release_post(release_post_cache).await;
    let data = IndexData {
        rust_version: rust_version::rust_version(version_cache).await,
        rust_release_post: if !release_post.is_empty() {
            format!("https://blog.rust-lang.org/{}", release_post)
        } else {
            String::new()
        },
    };
    let context = Context::new(page.clone(), "", true, data, lang);
    Template::render(page, context)
}

fn render_category(category: Category, lang: String) -> Template {
    let page = category.index();
    let title_id = format!("{}-page-title", category.name());
    let context = Context::new(category.name().to_string(), &title_id, false, (), lang);

    Template::render(page, context)
}

fn render_production(lang: String) -> Template {
    let page = "production/users".to_string();
    let context = Context::new(
        page.clone(),
        "production-users-page-title",
        false,
        load_users_data(),
        lang,
    );

    Template::render(page, context)
}

async fn render_governance(
    lang: String,
    teams_cache: &Cache<RustTeams>,
) -> Result<Template, Status> {
    match teams::index_data(teams_cache).await {
        Ok(data) => {
            let page = "governance/index".to_string();
            let context = Context::new(page.clone(), "governance-page-title", false, data, lang);

            Ok(Template::render(page, context))
        }
        Err(err) => {
            eprintln!("error while loading the governance page: {}", err);
            Err(Status::InternalServerError)
        }
    }
}

async fn render_team(
    section: String,
    team: String,
    lang: String,
    teams_cache: &Cache<RustTeams>,
) -> Result<Template, Result<Redirect, Status>> {
    match teams::page_data(&section, &team, teams_cache).await {
        Ok(data) => {
            let page = "governance/group".to_string();
            let name = format!("governance-team-{}-name", data.team.name);
            let context = Context::new(page.clone(), &name, false, data, lang);
            Ok(Template::render(page, context))
        }
        Err(err) => {
            if err.is::<teams::TeamNotFound>() {
                match (section.as_str(), team.as_str()) {
                    // Old teams URLs
                    ("teams", "language-and-compiler") | ("teams", "operations") => {
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

fn render_subject(category: Category, subject: String, lang: String) -> Result<Template, Status> {
    // Rocket's Template::render method is not really designed to accept arbitrary templates: if a
    // template is missing, it just returns a Status::InternalServerError, without a way to
    // distinguish it from a syntax error in the template itself.
    //
    // To work around the problem we check whether the template exists beforehand.
    let path = Path::new("templates")
        .join(category.name())
        .join(format!("{}.html.hbs", subject));
    if !path.is_file() {
        return Err(Status::NotFound);
    }

    let page = format!("{}/{}", category.name(), subject.as_str());
    let title_id = format!("{}-{}-page-title", category.name(), subject);
    let context = Context::new(subject, &title_id, false, (), lang);

    Ok(Template::render(page, context))
}

#[launch]
async fn rocket() -> _ {
    let templating = Template::custom(|engine| {
        engine
            .handlebars
            .register_helper("fluent", Box::new(FluentHelper::new(create_loader())));
        engine
            .handlebars
            .register_helper("team-text", Box::new(TeamHelper::new()));
        engine
            .handlebars
            .register_helper("encode-zulip-stream", Box::new(encode_zulip_stream));
    });

    let rust_version = RustVersion::fetch().await.unwrap_or_default();
    let rust_release_post = RustReleasePost::fetch().await.unwrap_or_default();
    let teams = RustTeams::fetch().await.unwrap_or_default();

    rocket::build()
        .attach(templating)
        .attach(headers::InjectHeaders)
        .manage(Arc::new(RwLock::new(rust_version)))
        .manage(Arc::new(RwLock::new(rust_release_post)))
        .manage(Arc::new(RwLock::new(teams)))
        .mount(
            "/",
            routes![
                index,
                category_en,
                governance,
                team,
                get_production,
                subject,
                files,
                robots_txt,
                logos,
                components,
                index_locale,
                category_locale,
                governance_locale,
                team_locale,
                production_locale,
                subject_locale,
                components_locale,
                redirect_bare_en_us,
            ],
        )
        .register("/", catchers![not_found, catch_error])
}

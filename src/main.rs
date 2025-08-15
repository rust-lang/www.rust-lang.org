#![allow(unused)]

use crate::assets::compile_assets;
use crate::i18n::{TeamHelper, create_loader};
use crate::redirect::create_redirects;
use crate::render::{RenderCtx, render_directory, render_governance, render_index};
use crate::rust_version::fetch_rust_version;
use crate::teams::{encode_zulip_stream, load_rust_teams};
use anyhow::Context;
use handlebars::{DirectorySourceOptions, Handlebars};
use handlebars_fluent::FluentHelper;
use std::path::{Path, PathBuf};

mod assets;
mod fs;
mod i18n;
mod redirect;
mod render;
mod rust_version;
mod teams;

const ZULIP_DOMAIN: &str = "https://rust-lang.zulipchat.com";

static LAYOUT: &str = "components/layout";
static ENGLISH: &str = "en-US";

/// Relative base url from the root of the website
/// `url` can be e.g. `` or `/foo-bar`.
struct BaseUrl {
    url: String,
}

impl BaseUrl {
    fn new(url: &str) -> Self {
        let url = url.strip_suffix('/').unwrap_or(url).to_string();
        Self { url }
    }

    fn get(&self) -> &str {
        &self.url
    }

    fn resolve_translated(&self, lang: &str) -> String {
        if lang == ENGLISH {
            self.url.clone()
        } else {
            format!("{}/{lang}", self.url)
        }
    }
}

fn setup_handlebars() -> anyhow::Result<Handlebars<'static>> {
    let mut handlebars: Handlebars<'static> = Handlebars::new();
    handlebars.set_strict_mode(true);

    let mut options = DirectorySourceOptions::default();
    options.tpl_extension = ".html.hbs".to_string();
    handlebars
        .register_templates_directory("templates", options)
        .context("cannot register template directory")?;

    let loader = create_loader();
    let helper = FluentHelper::new(loader);
    handlebars.register_helper("fluent", Box::new(helper));
    handlebars.register_helper("team-text", Box::new(TeamHelper::new()));
    handlebars.register_helper("encode-zulip-stream", Box::new(encode_zulip_stream));
    Ok(handlebars)
}

fn main() -> anyhow::Result<()> {
    let base_url = std::env::var("BASE_URL").unwrap_or_else(|_| "".to_string());
    let base_url = BaseUrl::new(&base_url);

    let rust_version = fetch_rust_version()?;
    let teams = load_rust_teams()?;

    // Prepare build directory
    let output_dir = PathBuf::from("html");
    let _ = std::fs::remove_dir_all(&output_dir);
    std::fs::create_dir_all(&output_dir)?;

    let root_dir = Path::new(".");
    let assets = compile_assets(root_dir, &output_dir, &base_url.get())?;
    let handlebars = setup_handlebars()?;

    let ctx = RenderCtx {
        template_dir: root_dir.join("templates"),
        fluent_loader: create_loader(),
        assets,
        rust_version,
        teams,
        handlebars,
        output_dir,
        base_url,
    };
    ctx.copy_asset_dir("static", "static")?;
    ctx.copy_asset_file(
        "static/text/well_known_security.txt",
        ".well-known/security.txt",
    )?;

    render_index(&ctx)?;
    render_governance(&ctx)?;
    render_directory(&ctx, "community")?;
    render_directory(&ctx, "learn")?;
    render_directory(&ctx, "policies")?;
    render_directory(&ctx, "tools")?;
    render_directory(&ctx, "what")?;
    ctx.page("404", "", &(), ENGLISH).render("404.html")?;
    create_redirects(&ctx)?;

    Ok(())
}

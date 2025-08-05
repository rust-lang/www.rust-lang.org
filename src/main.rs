use crate::assets::{AssetFiles, compile_assets};
use crate::category::Category;
use crate::fs::ensure_directory;
use crate::i18n::{EXPLICIT_LOCALE_INFO, LocaleInfo, SUPPORTED_LOCALES, TeamHelper, create_loader};
use crate::rust_version::{RustVersion, fetch_rust_version};
use crate::teams::{RustTeams, load_rust_teams};
use anyhow::Context;
use handlebars::{DirectorySourceOptions, Handlebars};
use handlebars_fluent::{FluentHelper, Loader, SimpleLoader};
use serde::Serialize;
use std::fs::File;
use std::io::BufWriter;
use std::path::{Path, PathBuf};

mod assets;
mod category;
mod fs;
mod i18n;
mod rust_version;
mod teams;

static PONTOON_ENABLED: bool = false;

const ZULIP_DOMAIN: &str = "https://rust-lang.zulipchat.com";

static LAYOUT: &str = "components/layout";
static ENGLISH: &str = "en-US";

fn baseurl(lang: &str) -> String {
    if lang == "en-US" {
        String::new()
    } else {
        format!("/{lang}")
    }
}

#[derive(Serialize)]
struct TemplateCtx<'a, T: Serialize> {
    page: String,
    title: String,
    parent: &'static str,
    is_landing: bool,
    data: &'a T,
    lang: String,
    baseurl: String,
    pontoon_enabled: bool,
    assets: &'a AssetFiles,
    locales: &'static [LocaleInfo],
    is_translation: bool,
}

struct PageCtx<'a, T: Serialize> {
    template_ctx: TemplateCtx<'a, T>,
    output_dir: &'a Path,
    handlebars: &'a Handlebars<'a>,
}

impl<'a, T: Serialize> PageCtx<'a, T> {
    fn make_landing(mut self) -> Self {
        self.template_ctx.is_landing = true;
        self
    }

    fn render<P: AsRef<Path>>(self, dst_path: P) -> anyhow::Result<()> {
        let path = dst_path.as_ref();
        let template = &self.template_ctx.page;

        let out_path = self.output_dir.join(path);
        ensure_directory(&out_path)?;
        let mut output_file = BufWriter::new(File::create(&out_path)?);
        eprintln!("Rendering `{template}` into {}", out_path.display());

        self.handlebars
            .render_to_write(template, &self.template_ctx, &mut output_file)
            .with_context(|| {
                anyhow::anyhow!(
                    "cannot render template {template} into {}",
                    out_path.display()
                )
            })?;
        Ok(())
    }
}

struct RenderCtx<'a> {
    handlebars: Handlebars<'a>,
    fluent_loader: SimpleLoader,
    output_dir: PathBuf,
    rust_version: RustVersion,
    teams: RustTeams,
    assets: AssetFiles,
}

impl<'a> RenderCtx<'a> {
    fn page<T: Serialize>(
        &'a self,
        page: &str,
        title_id: &str,
        data: &'a T,
        lang: &str,
    ) -> PageCtx<'a, T> {
        let title = if title_id.is_empty() {
            "".into()
        } else {
            let lang = lang.parse().expect("lang should be valid");
            self.fluent_loader.lookup(&lang, title_id, None)
        };
        PageCtx {
            template_ctx: TemplateCtx {
                page: page.to_string(),
                title,
                parent: LAYOUT,
                is_landing: false,
                data,
                baseurl: baseurl(&lang),
                is_translation: lang != "en-US",
                lang: lang.to_string(),
                pontoon_enabled: PONTOON_ENABLED,
                assets: &self.assets,
                locales: EXPLICIT_LOCALE_INFO,
            },
            output_dir: &self.output_dir,
            handlebars: &self.handlebars,
        }
    }

    fn copy_static_assets<P: AsRef<Path>>(&self, src_dir: P, dst_dir: P) -> anyhow::Result<()> {
        let dst = self.output_dir.join(dst_dir.as_ref());
        println!(
            "Copying static assets from {} to {}",
            src_dir.as_ref().display(),
            dst.display()
        );
        copy_dir_all(src_dir.as_ref(), dst)?;
        Ok(())
    }
}

/// Calls `func` for all supported languages.
/// Passes it the destination path into which should a given page be rendered, and the language
/// in which it should be rendered.
fn all_langs<F>(dst_path: &str, func: F) -> anyhow::Result<()>
where
    F: Fn(&str, &str) -> anyhow::Result<()>,
{
    for lang in SUPPORTED_LOCALES.iter() {
        let path = match lang {
            l if *l == ENGLISH => dst_path.to_string(),
            l => format!("{l}/{dst_path}"),
        };
        func(&path, lang).with_context(|| anyhow::anyhow!("could not handle language {lang}"))?;
    }
    Ok(())
}

fn copy_dir_all(src: impl AsRef<Path>, dst: impl AsRef<Path>) -> std::io::Result<()> {
    std::fs::create_dir_all(&dst)?;
    for entry in std::fs::read_dir(src)? {
        let entry = entry?;
        let ty = entry.file_type()?;
        if ty.is_dir() {
            copy_dir_all(entry.path(), dst.as_ref().join(entry.file_name()))?;
        } else {
            std::fs::copy(entry.path(), dst.as_ref().join(entry.file_name()))?;
        }
    }
    Ok(())
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
    Ok(handlebars)
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let rust_version = fetch_rust_version().await?;
    let teams = load_rust_teams().await?;

    // Prepare build directory
    let output_dir = PathBuf::from("html");
    let _ = std::fs::remove_dir_all(&output_dir);
    std::fs::create_dir_all(&output_dir)?;

    let assets = compile_assets(Path::new("."), &output_dir, "/")?;
    let handlebars = setup_handlebars()?;

    let ctx = RenderCtx {
        fluent_loader: create_loader(),
        assets,
        rust_version,
        teams,
        handlebars,
        output_dir,
    };
    ctx.copy_static_assets("static", "static")?;

    render_index(&ctx)?;
    render_governance(&ctx)?;
    render_category(&ctx, "community")?;
    render_category(&ctx, "learn")?;
    render_category(&ctx, "policies")?;
    render_category(&ctx, "tools")?;
    render_category(&ctx, "what")?;

    // TODO: 404, redirects

    Ok(())
}

fn render_index(render_ctx: &RenderCtx) -> anyhow::Result<()> {
    #[derive(Serialize)]
    struct IndexData {
        rust_version: String,
    }
    let data = IndexData {
        rust_version: render_ctx.rust_version.0.clone(),
    };
    all_langs("index.html", |path, lang| {
        render_ctx
            .page("index", "", &data, lang)
            .make_landing()
            .render(path)
    })
}

fn render_governance(render_ctx: &RenderCtx) -> anyhow::Result<()> {
    let data = render_ctx.teams.index_data();

    all_langs("governance/index.html", |dst_path, lang| {
        render_ctx
            .page("governance/index", "governance-page-title", &data, lang)
            .render(dst_path)
    })
}

fn render_category(render_ctx: &RenderCtx, category: &str) -> anyhow::Result<()> {
    all_langs(&format!("{category}/index.html"), |dst_path, lang| {
        render_ctx
            .page(
                &format!("{category}/index"),
                &format!("{category}-page-title"),
                &(),
                lang,
            )
            .render(dst_path)
    })
}

mod assets;
mod fs;

use crate::i18n::{EXPLICIT_LOCALE_INFO, LocaleInfo, SUPPORTED_LOCALES, TeamHelper, create_loader};
use crate::render::assets::{AssetFiles, compile_assets};
use crate::render::fs::ensure_directory;
use crate::rust_version::RustVersion;
use crate::teams::RustTeams;
use crate::{ENGLISH, LAYOUT, PONTOON_ENABLED, baseurl};
use anyhow::Context;
use handlebars::{DirectorySourceOptions, Handlebars};
use handlebars_fluent::{FluentHelper, Loader, SimpleLoader};
use rust_team_data::v1::{Team, TeamKind};
use serde::Serialize;
use std::cmp::Reverse;
use std::fs::File;
use std::io::BufWriter;
use std::path::{Path, PathBuf};

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

    fn render<P: AsRef<Path>>(self, template: &str, path: P) -> anyhow::Result<()> {
        let path = path.as_ref();

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
    version: RustVersion,
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
                pontoon_enabled: *PONTOON_ENABLED,
                assets: &self.assets,
                locales: EXPLICIT_LOCALE_INFO,
            },
            output_dir: &self.output_dir,
            handlebars: &self.handlebars,
        }
    }

    fn copy_static_assets<P: AsRef<Path>>(&self, src_dir: P, dst_dir: P) -> anyhow::Result<()> {
        copy_dir_all(src_dir.as_ref(), self.output_dir.join(dst_dir.as_ref()))?;
        Ok(())
    }
}

fn all_langs<F>(path: &str, func: F) -> anyhow::Result<()>
where
    F: Fn(&str, &str) -> anyhow::Result<()>,
{
    for lang in SUPPORTED_LOCALES.iter() {
        let path = match lang {
            l if *l == ENGLISH => path.to_string(),
            l => format!("{l}/{path}"),
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

pub fn render(version: RustVersion, teams: RustTeams) -> anyhow::Result<()> {
    // Prepare build directory
    let output_dir = PathBuf::from("html");
    let _ = std::fs::remove_dir_all(&output_dir);
    std::fs::create_dir_all(&output_dir)?;

    // Compile assets
    let assets = compile_assets(Path::new("."), &output_dir, "/")?;

    // Setup handlebars
    let mut template_ctx: Handlebars<'static> = Handlebars::new();
    template_ctx.set_strict_mode(true);

    let mut options = DirectorySourceOptions::default();
    options.tpl_extension = ".html.hbs".to_string();
    template_ctx
        .register_templates_directory("templates", options)
        .context("cannot register template directory")?;

    let loader = create_loader();
    let helper = FluentHelper::new(loader);
    template_ctx.register_helper("fluent", Box::new(helper));
    template_ctx.register_helper("team-text", Box::new(TeamHelper::new()));

    let ctx = RenderCtx {
        fluent_loader: create_loader(),
        assets,
        version,
        teams,
        handlebars: template_ctx,
        output_dir,
    };
    ctx.copy_static_assets("static", "static")?;

    render_index(&ctx)?;
    render_governance(&ctx)?;

    Ok(())
}

fn render_index(render_ctx: &RenderCtx) -> anyhow::Result<()> {
    #[derive(Serialize)]
    struct IndexData {
        rust_version: String,
        foo: Vec<u32>,
    }
    let data = IndexData {
        rust_version: render_ctx.version.0.clone(),
        foo: vec![1, 2, 3],
    };
    all_langs("index.html", |path, lang| {
        render_ctx
            .page("index", "", &data, lang)
            .make_landing()
            .render("index", path)
    })
}

fn render_governance(render_ctx: &RenderCtx) -> anyhow::Result<()> {
    #[derive(Default, Serialize)]
    pub struct IndexData {
        teams: Vec<IndexTeam>,
    }

    #[derive(Serialize)]
    struct IndexTeam {
        #[serde(flatten)]
        team: Team,
        url: String,
    }

    let mut data = IndexData::default();

    render_ctx
        .teams
        .0
        .as_ref()
        .unwrap()
        .into_iter()
        .filter(|team| team.website_data.is_some())
        // On the main page, show the leadership-council and all top-level
        // teams.
        .filter(|team| team.kind == TeamKind::Team && team.subteam_of.is_none())
        .map(|team| IndexTeam {
            url: format!(
                "{}/{}",
                crate::teams::kind_to_str(team.kind),
                team.website_data.as_ref().unwrap().page
            ),
            team: team.clone(),
        })
        .for_each(|team| data.teams.push(team));

    data.teams
        .sort_by_key(|index_team| Reverse(index_team.team.website_data.as_ref().unwrap().weight));

    all_langs("governance/index.html", |path, lang| {
        render_ctx
            .page("governance/index", "governance-page-title", &data, lang)
            .render("governance/index", path)
    })
}

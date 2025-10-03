use crate::assets::AssetFiles;
use crate::fs::{copy_dir_all, ensure_directory};
use crate::i18n::{EXPLICIT_LOCALE_INFO, LocaleInfo, SUPPORTED_LOCALES};
use crate::rust_version::RustVersion;
use crate::teams::{PageData, RustTeams};
use crate::{BaseUrl, ENGLISH, LAYOUT};
use anyhow::Context;
use handlebars::Handlebars;
use handlebars_fluent::{Loader, SimpleLoader};
use serde::Serialize;
use std::ffi::OsStr;
use std::fs::File;
use std::io::BufWriter;
use std::path::{Path, PathBuf};

#[derive(Serialize)]
pub struct TemplateCtx<'a, T: Serialize> {
    page: String,
    title: String,
    parent: &'static str,
    is_landing: bool,
    data: &'a T,
    lang: String,
    /// Base URL for the current page, e.g. /foo/bar
    /// This includes translations, so it can be also /foo/bar/es
    baseurl: String,
    /// Base URL for the current page, e.g. /foo/bar
    /// This **does not** include translations, and is used for the <...>/static links.
    baseurl_assets: String,
    assets: &'a AssetFiles,
    locales: &'static [LocaleInfo],
    is_translation: bool,
}

pub struct PageCtx<'a, T: Serialize> {
    template_ctx: TemplateCtx<'a, T>,
    output_dir: &'a Path,
    handlebars: &'a Handlebars<'a>,
}

impl<'a, T: Serialize> PageCtx<'a, T> {
    fn make_landing(mut self) -> Self {
        self.template_ctx.is_landing = true;
        self
    }

    pub fn render<P: AsRef<Path>>(self, dst_path: P) -> anyhow::Result<()> {
        let path = dst_path.as_ref();
        let template = &self.template_ctx.page;

        let out_path = self.output_dir.join(path);
        ensure_directory(&out_path)?;

        if out_path.is_file() {
            return Err(anyhow::anyhow!(
                "Trying to render file {}, which already exists",
                out_path.display()
            ));
        }

        let mut output_file = BufWriter::new(
            File::create(&out_path)
                .with_context(|| anyhow::anyhow!("Cannot create file at {}", path.display()))?,
        );
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

pub struct RenderCtx<'a> {
    pub handlebars: Handlebars<'a>,
    pub template_dir: PathBuf,
    pub fluent_loader: SimpleLoader,
    pub output_dir: PathBuf,
    pub rust_version: RustVersion,
    pub teams: RustTeams,
    pub assets: AssetFiles,
    pub base_url: BaseUrl,
}

impl<'a> RenderCtx<'a> {
    pub fn page<T: Serialize>(
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
                baseurl: self.base_url.resolve_translated(lang),
                baseurl_assets: self.base_url.get().to_string(),
                is_translation: lang != ENGLISH,
                lang: lang.to_string(),
                assets: &self.assets,
                locales: EXPLICIT_LOCALE_INFO,
            },
            output_dir: &self.output_dir,
            handlebars: &self.handlebars,
        }
    }

    pub fn copy_asset_dir<P: AsRef<Path>>(&self, src_dir: P, dst_dir: P) -> anyhow::Result<()> {
        let dst = self.output_dir.join(dst_dir.as_ref());
        println!(
            "Copying static asset directory from {} to {}",
            src_dir.as_ref().display(),
            dst.display()
        );
        copy_dir_all(src_dir.as_ref(), dst)?;
        Ok(())
    }

    pub fn copy_asset_file<P: AsRef<Path>>(&self, src: P, dst: P) -> anyhow::Result<()> {
        let dst = self.output_dir.join(dst.as_ref());
        println!(
            "Copying static asset file from {} to {}",
            src.as_ref().display(),
            dst.display()
        );
        ensure_directory(&dst)?;
        std::fs::copy(src.as_ref(), dst)?;
        Ok(())
    }
}

/// Calls `func` for all supported languages.
/// Passes it the destination path into which should a given page be rendered, and the language
/// in which it should be rendered.
pub fn for_all_langs<F>(dst_path: &str, func: F) -> anyhow::Result<()>
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

pub fn render_index(render_ctx: &RenderCtx) -> anyhow::Result<()> {
    #[derive(Serialize)]
    struct IndexData {
        rust_version: String,
    }
    let data = IndexData {
        rust_version: render_ctx.rust_version.0.clone(),
    };
    for_all_langs("index.html", |path, lang| {
        render_ctx
            .page("index", "", &data, lang)
            .make_landing()
            .render(path)
    })
}

pub fn render_governance(render_ctx: &RenderCtx) -> anyhow::Result<()> {
    let data = render_ctx.teams.index_data();

    for_all_langs("governance/index.html", |dst_path, lang| {
        render_ctx
            .page("governance/index", "governance-page-title", &data, lang)
            .render(dst_path)
    })?;
    for team in data.teams {
        let data: PageData = render_ctx
            .teams
            .page_data(team.section, &team.page_name)
            .unwrap_or_else(|error| panic!("Page data for team {team:?} not found: {error:?}"));

        // We need to render into index.html to have an extensionless URL
        for_all_langs(
            &format!("governance/{}/index.html", team.url),
            |dst_path, lang| {
                render_ctx
                    .page(
                        "governance/group",
                        &format!("governance-team-{}-name", team.team.name),
                        &data,
                        lang,
                    )
                    .render(dst_path)
            },
        )?;
    }

    let archived_teams_data = render_ctx.teams.archived_teams();
    for_all_langs("governance/archived-teams.html", |dst_path, lang| {
        render_ctx
            .page(
                "governance/archived-teams",
                "governance-archived-teams-title",
                &archived_teams_data,
                lang,
            )
            .render(dst_path)
    })?;

    Ok(())
}

/// Render all templates found in the given directory.
pub fn render_directory(render_ctx: &RenderCtx, category: &str) -> anyhow::Result<()> {
    for dir in std::fs::read_dir(render_ctx.template_dir.join(category))? {
        let path = dir?.path();
        if path.is_file() && path.extension() == Some(OsStr::new("hbs")) {
            // foo.html.hbs => foo
            let subject = path
                .file_stem()
                .unwrap()
                .to_str()
                .unwrap()
                .split(".")
                .next()
                .unwrap();

            // The "root" page of a category
            if subject == "index" {
                for_all_langs(&format!("{category}/index.html"), |dst_path, lang| {
                    render_ctx
                        .page(
                            &format!("{category}/index"),
                            &format!("{category}-page-title"),
                            &(),
                            lang,
                        )
                        .render(dst_path)
                })?;
            } else {
                // A subpage (subject) of the category
                // We need to render the page into a subdirectory, so that /foo/bar works without
                // needing a HTML suffix.
                for_all_langs(
                    &format!("{category}/{subject}/index.html"),
                    |dst_path, lang| {
                        render_ctx
                            .page(
                                &format!("{category}/{subject}"),
                                &format!("{category}-{subject}-page-title"),
                                &(),
                                lang,
                            )
                            .render(dst_path)
                    },
                )?;
            }
        }
    }
    Ok(())
}

pub fn render_redirect(render_ctx: &RenderCtx, from: &str, to: &str) -> anyhow::Result<()> {
    if from == format!("{to}.html") || format!("{from}.html") == to {
        return Err(anyhow::anyhow!(
            "Trying to setup redirect from {from} to {to}, which would alias"
        ));
    }

    #[derive(Serialize)]
    struct Data {
        url: String,
    }

    let url = if !to.starts_with("http") {
        format!("{}/{to}", render_ctx.base_url.get())
    } else {
        to.to_string()
    };
    let data = Data { url };

    let from = if Path::new(from).extension().is_none() {
        // We need to add /index.html to make the extensionless URL work
        format!("{from}/index.html")
    } else {
        from.to_string()
    };

    println!("Redirecting {from} to {to}");
    render_ctx
        .page("redirect", "", &data, ENGLISH)
        .make_landing()
        .render(from)
}

use crate::fs::ensure_directory;
use anyhow::Context;
use sass_rs::{Options, compile_file};
use serde::Serialize;
use std::fs;
use std::hash::{DefaultHasher, Hasher};
use std::path::Path;

fn write_file(path: &Path, bytes: &[u8]) -> anyhow::Result<()> {
    ensure_directory(path)?;
    Ok(fs::write(path, bytes)?)
}

fn hash_string(content: &str) -> String {
    let mut hasher = DefaultHasher::new();
    hasher.write(content.as_bytes());
    hasher.finish().to_string()
}

fn relative_url(path: &Path, out_dir: &Path) -> anyhow::Result<String> {
    Ok(path.strip_prefix(out_dir)?.to_str().unwrap().to_string())
}

/// Compiles SASS file, stores it in `out_dir` and returns the relative URL to it.
fn compile_sass(root_dir: &Path, out_dir: &Path, filename: &str) -> anyhow::Result<String> {
    let scss_file = root_dir
        .join("src")
        .join("styles")
        .join(format!("{filename}.scss"));

    let css = compile_file(&scss_file, Options::default())
        .map_err(|e| anyhow::anyhow!("{e}"))
        .with_context(|| anyhow::anyhow!("couldn't compile sass: {}", scss_file.display()))?;

    let css_sha = format!("{filename}_{}", hash_string(&css));
    let out_css_path = out_dir
        .join("static")
        .join("styles")
        .join(format!("{css_sha}.css"));

    write_file(&out_css_path, &css.into_bytes())
        .with_context(|| anyhow::anyhow!("couldn't write css file: {}", out_css_path.display()))?;

    Ok(relative_url(&out_css_path, &out_dir)?)
}

fn concat_files(
    root_dir: &Path,
    out_dir: &Path,
    files: &[&str],
    directory: &str,
    extension: &str,
) -> anyhow::Result<String> {
    let mut concatted = String::new();
    for filestem in files {
        let vendor_path = root_dir
            .join("static")
            .join(directory)
            .join(format!("{filestem}.{extension}"));
        let contents = fs::read_to_string(vendor_path)
            .with_context(|| anyhow::anyhow!("couldn't read vendor {extension}"))?;
        concatted.push_str(&contents);
    }

    let file_sha = format!("vendor_{}", hash_string(&concatted));
    let out_file_path = out_dir
        .join("static")
        .join(directory)
        .join(format!("{file_sha}.{extension}"));

    write_file(Path::new(&out_file_path), concatted.as_bytes())
        .with_context(|| anyhow::anyhow!("couldn't write vendor {extension}"))?;

    Ok(relative_url(&out_file_path, &out_dir)?)
}

fn concat_vendor_css(root_dir: &Path, out_dir: &Path, files: Vec<&str>) -> anyhow::Result<String> {
    concat_files(root_dir, out_dir, &files, "styles", "css")
}

fn concat_app_js(root_dir: &Path, out_dir: &Path, files: Vec<&str>) -> anyhow::Result<String> {
    concat_files(root_dir, out_dir, &files, "scripts", "js")
}

#[derive(Serialize, Debug)]
pub struct CSSFiles {
    app: String,
    fonts: String,
    vendor: String,
}

#[derive(Serialize, Debug)]
pub struct JSFiles {
    app: String,
}

#[derive(Serialize, Debug)]
pub struct AssetFiles {
    css: CSSFiles,
    js: JSFiles,
}

/// Compile all statics JS/CSS assets into the `out_dir` directory and return a structure
/// that holds paths to them, based on the passed `baseurl`.
pub fn compile_assets(
    root_dir: &Path,
    out_dir: &Path,
    baseurl: &str,
) -> anyhow::Result<AssetFiles> {
    let app_css_file = compile_sass(root_dir, out_dir, "app")?;
    let fonts_css_file = compile_sass(root_dir, out_dir, "fonts")?;
    let vendor_css_file = concat_vendor_css(root_dir, out_dir, vec!["tachyons"])?;
    let app_js_file = concat_app_js(root_dir, out_dir, vec!["tools-install"])?;

    Ok(AssetFiles {
        css: CSSFiles {
            app: format!("{baseurl}{app_css_file}"),
            fonts: format!("{baseurl}{fonts_css_file}"),
            vendor: format!("{baseurl}{vendor_css_file}"),
        },
        js: JSFiles {
            app: format!("{baseurl}{app_js_file}"),
        },
    })
}

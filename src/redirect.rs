use crate::render::{RenderCtx, render_redirect};

pub static PAGE_REDIRECTS: &[(&str, &str)] = &[
    // Pre-2018 website pages
    ("conduct.html", "policies/code-of-conduct"),
    ("contribute-bugs.html", "community"),
    ("contribute-community.html", "community"),
    ("contribute-compiler.html", "governance/teams/compiler"),
    (
        "contribute-docs.html",
        "governance/teams/dev-tools#team-rustdoc",
    ),
    ("contribute-libs.html", "governance/teams/library"),
    ("contribute-tools.html", "governance/teams/dev-tools"),
    ("contribute.html", "community"),
    ("documentation.html", "learn"),
    ("downloads.html", "tools/install"),
    ("friends.html", "production"),
    ("install.html", "tools/install"),
    ("legal.html", "policies"),
    ("security.html", "policies/security"),
    ("team.html", "governance"),
    ("user-groups.html", "community"),
    // Team changes
    (
        "governance/teams/release",
        "governance/teams/infra#team-release",
    ),
    (
        "governance/teams/crates-io",
        "governance/teams/dev-tools#team-crates-io",
    ),
    ("governance/teams/language-and-compiler", "governance#teams"),
    ("governance/teams/operations", "governance#teams"),
    (
        "governance/wgs/wg-async",
        "governance/teams/lang#team-wg-async",
    ),
    // miscellaneous
    ("governance/teams", "governance#teams"),
    ("governance/wgs", "governance#working-groups"),
    ("governance/all-team-members.html", "governance/people"),
];

pub static STATIC_FILES_REDIRECTS: &[(&str, &str)] = &[
    // Pre-2018 whitepaper locations
    (
        "pdfs/Rust-npm-Whitepaper.pdf",
        "static/pdfs/Rust-npm-Whitepaper.pdf",
    ),
    (
        "pdfs/Rust-Tilde-Whitepaper.pdf",
        "static/pdfs/Rust-Tilde-Whitepaper.pdf",
    ),
];

static EXTERNAL_REDIRECTS: &[(&str, &str)] = &[
    // Pre-2018 website pages
    (
        "other-installers.html",
        "https://forge.rust-lang.org/infra/other-installation-methods.html",
    ),
    // Pre-foundation website pages
    (
        "policies/privacy",
        "https://foundation.rust-lang.org/policies/privacy-policy/",
    ),
    (
        "policies/media-guide",
        "https://foundation.rust-lang.org/policies/logo-policy-and-media-guide/",
    ),
    ("sponsors", "https://foundation.rust-lang.org/members/"),
];

pub fn create_redirects(ctx: &RenderCtx) -> anyhow::Result<()> {
    // Static file redirects, no need to support languages
    // We cannot really make non-HTML redirects easily, so we just duplicate the file contents
    // under both paths.
    for (src, dst) in STATIC_FILES_REDIRECTS {
        ctx.copy_asset_file(dst, src)?;
    }

    for (src, dst) in EXTERNAL_REDIRECTS {
        render_redirect(ctx, src, dst)?;
    }

    for (src, dst) in PAGE_REDIRECTS {
        render_redirect(ctx, src, dst)?;
    }

    Ok(())
}

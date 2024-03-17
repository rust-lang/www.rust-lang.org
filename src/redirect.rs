use crate::i18n::SUPPORTED_LOCALES;
use rocket::http::uri::Path;
use rocket::response::Redirect;

static PAGE_REDIRECTS: &[(&str, &str)] = &[
    // Migrate pre-2018 locale for the index page
    ("", ""),
    // Pre-2018 website pages
    ("community.html", "community"),
    ("conduct.html", "policies/code-of-conduct"),
    ("contribute-bugs.html", "community"),
    ("contribute-community.html", "governance/teams/community"),
    ("contribute-compiler.html", "governance/teams/compiler"),
    ("contribute-docs.html", "governance/teams/documentation"),
    ("contribute-libs.html", "governance/teams/library"),
    ("contribute-tools.html", "governance/teams/dev-tools"),
    ("contribute.html", "community"),
    ("documentation.html", "learn"),
    ("downloads.html", "tools/install"),
    ("friends.html", "production"),
    ("index.html", ""),
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
];

static STATIC_FILES_REDIRECTS: &[(&str, &str)] = &[
    // Pre-2018 whitepaper locations
    (
        "pdfs/Rust-npm-Whitepaper.pdf",
        "/static/pdfs/Rust-npm-Whitepaper.pdf",
    ),
    (
        "pdfs/Rust-Chucklefish-Whitepaper.pdf",
        "/static/pdfs/Rust-Chucklefish-Whitepaper.pdf",
    ),
    (
        "pdfs/Rust-Tilde-Whitepaper.pdf",
        "/static/pdfs/Rust-Tilde-Whitepaper.pdf",
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

// Translations present on www.rust-lang.org before the 2018 redesign. If an equivalent translation
// is present in the current codebase it will be migrated automatically.
static PRE_2018_LOCALES: &[&str] = &[
    "de-DE", "en-US", "es-ES", "fr-FR", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR",
    "ru-RU", "sv-SE", "vi-VN",
];

pub(crate) fn maybe_redirect(path: Path) -> Option<Redirect> {
    let path = path.segments().collect::<Vec<_>>().join("/");

    if let Some((_, dest)) = STATIC_FILES_REDIRECTS.iter().find(|(src, _)| src == &path) {
        return Some(Redirect::permanent(*dest));
    }

    let (locale, path) = if let Some((first, rest)) = path.split_once('/') {
        if SUPPORTED_LOCALES.contains(&first) {
            (Locale::Present(first), rest)
        // After the 2018 website redesign some of the locales were removed and some were
        // renamed (removing the country code). This handles both cases, either calculating the
        // renamed locale or marking the locale as "specified but missing", which triggers a
        // temporary redirect instead of a permanent redirect.
        } else if PRE_2018_LOCALES.contains(&first) {
            if let Some(locale) = convert_locale_from_pre_2018(first) {
                (Locale::Present(locale), rest)
            } else {
                (Locale::SpecifiedButMissing, rest)
            }
        } else {
            (Locale::NotSpecified, path.as_str())
        }
    } else if PRE_2018_LOCALES.contains(&path.as_str()) {
        // If the whole path is a pre-2018 locale handle it as a localized index page.
        if let Some(locale) = convert_locale_from_pre_2018(&path) {
            (Locale::Present(locale), "")
        } else {
            (Locale::SpecifiedButMissing, "")
        }
    } else {
        (Locale::NotSpecified, path.as_str())
    };

    if let Some((_, dest)) = EXTERNAL_REDIRECTS.iter().find(|(src, _)| *src == path) {
        Some(Redirect::permanent(*dest))
    } else if let Some((_, dest)) = PAGE_REDIRECTS.iter().find(|(src, _)| *src == path) {
        let dest = format!("/{}", dest);
        match locale {
            Locale::Present("en-US") | Locale::NotSpecified => Some(Redirect::permanent(dest)),
            Locale::Present(locale) => Some(Redirect::permanent(format!("/{}{}", locale, dest))),
            Locale::SpecifiedButMissing => Some(Redirect::temporary(dest)),
        }
    } else {
        None
    }
}

fn convert_locale_from_pre_2018(pre_2018: &str) -> Option<&str> {
    if let Some(language) = pre_2018.split('-').next() {
        if SUPPORTED_LOCALES.contains(&language) {
            return Some(language);
        }
    }
    None
}

enum Locale<'a> {
    Present(&'a str),
    SpecifiedButMissing,
    NotSpecified,
}

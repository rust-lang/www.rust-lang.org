use std::str::Utf8Error;

use rocket::{http::RawStr, request::FromParam};

pub struct Destination {
    pub uri: &'static str,
}

impl<'r> FromParam<'r> for Destination {
    type Error = NoRedirectFound;

    fn from_param(param: &'r RawStr) -> Result<Self, Self::Error> {
        let uri = match param.percent_decode()?.as_ref() {
            "Rust-npm-Whitepaper.pdf" => "Rust-npm-Whitepaper.pdf",
            "Rust-Chucklefish-Whitepaper.pdf" => "Rust-Chucklefish-Whitepaper.pdf",
            "Rust-Tilde-Whitepaper.pdf" => "Rust-Tilde-Whitepaper.pdf",
            "community.html" => "/community",
            "conduct.html" => "/policies/code-of-conduct",
            "contribute-bugs.html" => "/community",
            "contribute-community.html" => "/governance/teams/community",
            "contribute-compiler.html" => "/governance/teams/language-and-compiler",
            "contribute-docs.html" => "/governance/teams/documentation",
            "contribute-libs.html" => "/governance/teams/library",
            "contribute-tools.html" => "/governance/teams/dev-tools",
            "contribute.html" => "/community",
            "documentation.html" => "/learn",
            "downloads.html" => "/tools/install",
            "friends.html" => "/production",
            "index.html" => "/",
            "install.html" => "/tools/install",
            "legal.html" => "/policies",
            "other-installers.html" => {
                "https://forge.rust-lang.org/infra/other-installation-methods.html"
            }
            "policies/privacy" => "https://foundation.rust-lang.org/policies/privacy-policy/",
            "security.html" => "/policies/security",
            "team.html" => "/governance",
            "user-groups.html" => "/community",
            _ => return Err(NoRedirectFound),
        };
        Ok(Destination { uri })
    }
}

pub struct Locale(&'static str);

impl<'r> FromParam<'r> for Locale {
    type Error = NoRedirectFound;

    fn from_param(param: &'r RawStr) -> Result<Self, Self::Error> {
        match param.percent_decode()?.as_ref() {
            "de-DE" => Ok(Locale("de-DE")),
            "en-US" => Ok(Locale("en-US")),
            "es-ES" => Ok(Locale("es-ES")),
            "fr-FR" => Ok(Locale("fr-FR")),
            "id-ID" => Ok(Locale("id-ID")),
            "it-IT" => Ok(Locale("it-IT")),
            "ja-JP" => Ok(Locale("ja-JP")),
            "ko-KR" => Ok(Locale("ko-KR")),
            "pl-PL" => Ok(Locale("pl-PL")),
            "pt-BR" => Ok(Locale("pt-BR")),
            "ru-RU" => Ok(Locale("ru-RU")),
            "sv-SE" => Ok(Locale("sv-SE")),
            "vi-VN" => Ok(Locale("vi-VN")),
            _ => Err(NoRedirectFound),
        }
    }
}

#[derive(Debug)]
pub struct NoRedirectFound;

impl From<Utf8Error> for NoRedirectFound {
    fn from(_: Utf8Error) -> Self {
        Self
    }
}

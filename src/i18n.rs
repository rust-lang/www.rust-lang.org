use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderError,
};

use rocket::http::RawStr;
use rocket::request::FromParam;
use std::collections::HashSet;

use fluent_bundle::{FluentBundle, FluentValue};
use handlebars_fluent::{loader::SimpleLoader, simple_loader};

simple_loader!(create_loader, "./locales/", "en-US", core: "./locales/core.ftl",
               customizer: add_bundle_functions);

fn add_bundle_functions(bundle: &mut FluentBundle<'static>) {
    bundle
        .add_function("EMAIL", |values, _named| {
            let email = match *values.get(0)?.as_ref()? {
                FluentValue::String(ref s) => s,
                _ => return None,
            };
            Some(FluentValue::String(format!(
                "<a href='mailto:{0}' lang='en-US'>{0}</a>",
                email
            )))
        })
        .expect("could not add function");

    bundle
        .add_function("ENGLISH", |values, _named| {
            let text = match *values.get(0)?.as_ref()? {
                FluentValue::String(ref s) => s,
                _ => return None,
            };
            Some(FluentValue::String(format!(
                "<span lang='en-US'>{0}</span>",
                text
            )))
        })
        .expect("could not add function");
}

#[derive(Serialize)]
pub struct LocaleInfo {
    pub lang: &'static str,
    pub text: &'static str,
}

pub const EXPLICIT_LOCALE_INFO: &[LocaleInfo] = &[
    LocaleInfo {
        lang: "en-US",
        text: "English",
    },
    LocaleInfo {
        lang: "it",
        text: "Italiano",
    },
    LocaleInfo {
        lang: "pt-BR",
        text: "Português",
    },
    LocaleInfo {
        lang: "tr",
        text: "Türkçe",
    },
    LocaleInfo {
        lang: "zh-CN",
        text: "简体中文",
    },
    LocaleInfo {
        lang: "zh-TW",
        text: "正體中文",
    },
    LocaleInfo {
        lang: "ru",
        text: "Русский",
    },
];

lazy_static! {
    static ref SUPPORTED_LOCALES: HashSet<&'static str> =
        EXPLICIT_LOCALE_INFO.iter().map(|x| x.lang).collect();
}
pub struct TeamHelper {
    i18n: SimpleLoader,
}

impl TeamHelper {
    pub fn new() -> Self {
        Self::default()
    }
}

impl Default for TeamHelper {
    fn default() -> Self {
        Self {
            i18n: create_loader(),
        }
    }
}

impl HelperDef for TeamHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'reg, 'rc>,
        _: &'reg Handlebars,
        context: &'rc Context,
        rcx: &mut RenderContext<'reg>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let name = if let Some(name) = h.param(0) {
            name
        } else {
            return Err(RenderError::new(
                "{{team-text}} must have at least two parameters",
            ));
        };
        let name = if let Some(name) = name.path() {
            name
        } else {
            return Err(RenderError::new(
                "{{team-text}} takes only identifier parameters",
            ));
        };

        let id = if let Some(id) = h.param(1) {
            id
        } else {
            return Err(RenderError::new(
                "{{team-text}} must have at least two parameters",
            ));
        };
        let id = if let Some(id) = id.path() {
            id
        } else {
            return Err(RenderError::new(
                "{{team-text}} takes only identifier parameters",
            ));
        };
        let team = rcx
            .evaluate_in_block_context(name)?
            .ok_or_else(|| RenderError::new(format!("Cannot find team {}", name)))?;
        let lang = context
            .data()
            .get("lang")
            .expect("Language not set in context")
            .as_str()
            .expect("Language must be string");
        let team_name = team["name"].as_str().unwrap();

        let fluent_id = format!("governance-team-{}-{}", team_name, id);

        // English uses the team data directly, so that it gets autoupdated
        if lang == "en-US" {
            let english = team["website_data"][id].as_str().unwrap();
            out.write(&english).map_err(RenderError::with)?;
        } else if let Some(value) = self.i18n.lookup_no_default_fallback(lang, &fluent_id, None) {
            out.write(&value).map_err(RenderError::with)?;
        } else {
            let english = team["website_data"][id].as_str().unwrap();
            out.write(&english).map_err(RenderError::with)?;
        }
        Ok(())
    }
}

pub struct SupportedLocale(pub String);

impl<'r> FromParam<'r> for SupportedLocale {
    type Error = ();

    fn from_param(param: &'r RawStr) -> Result<Self, Self::Error> {
        let param = param.percent_decode().map_err(|_| ())?;
        if SUPPORTED_LOCALES.contains(param.as_ref()) {
            Ok(SupportedLocale(param.into()))
        } else {
            Err(())
        }
    }
}

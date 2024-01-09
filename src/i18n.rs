use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderError,
};

use rocket::request::FromParam;
use std::collections::HashSet;

use handlebars_fluent::{
    fluent_bundle::{concurrent::FluentBundle, FluentResource, FluentValue},
    loader::SimpleLoader,
    simple_loader,
};

simple_loader!(create_loader, "./locales/", "en-US", core: "./locales/core.ftl",
               customizer: add_bundle_functions);

fn add_bundle_functions(bundle: &mut FluentBundle<&'static FluentResource>) {
    bundle
        .add_function("EMAIL", |values, _named| {
            let email = match values.first() {
                Some(FluentValue::String(ref s)) => s,
                _ => return FluentValue::None,
            };
            FluentValue::String(format!("<a href='mailto:{0}' lang='en-US'>{0}</a>", email).into())
        })
        .expect("could not add function");

    bundle
        .add_function("ENGLISH", |values, _named| {
            let text = match values.first() {
                Some(FluentValue::String(ref s)) => s,
                _ => return FluentValue::None,
            };
            FluentValue::String(format!("<span lang='en-US'>{0}</span>", text).into())
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
        lang: "es",
        text: "Español",
    },
    LocaleInfo {
        lang: "fr",
        text: "Français",
    },
    LocaleInfo {
        lang: "it",
        text: "Italiano",
    },
    LocaleInfo {
        lang: "ja",
        text: "日本語",
    },
    LocaleInfo {
        lang: "pt-BR",
        text: "Português",
    },
    LocaleInfo {
        lang: "ru",
        text: "Русский",
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
];

lazy_static! {
    pub static ref SUPPORTED_LOCALES: HashSet<&'static str> =
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
        rcx: &mut RenderContext<'reg, 'rc>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let Some(name) = h.param(0) else {
            return Err(RenderError::new(
                "{{team-text}} must have at least two parameters",
            ));
        };
        let Some(name) = name.relative_path() else {
            return Err(RenderError::new(
                "{{team-text}} takes only identifier parameters",
            ));
        };

        let Some(id) = h.param(1) else {
            return Err(RenderError::new(
                "{{team-text}} must have at least two parameters",
            ));
        };
        let Some(id) = id.relative_path() else {
            return Err(RenderError::new(
                "{{team-text}} takes only identifier parameters",
            ));
        };
        let team = rcx
            .evaluate(context, name)
            .map_err(|e| RenderError::from_error(&format!("Cannot find team {}", name), e))?;
        let lang = context
            .data()
            .get("lang")
            .expect("Language not set in context")
            .as_str()
            .expect("Language must be string");
        let team_name = team.as_json()["name"].as_str().unwrap();

        let fluent_id = format!("governance-team-{}-{}", team_name, id);

        // English uses the team data directly, so that it gets autoupdated
        if lang == "en-US" {
            let english = team.as_json()["website_data"][id].as_str().unwrap();
            out.write(english)
                .map_err(|e| RenderError::from_error("failed to render English team data", e))?;
        } else if let Some(value) = self.i18n.lookup_no_default_fallback(
            &lang.parse().expect("language must be valid"),
            &fluent_id,
            None,
        ) {
            out.write(&value)
                .map_err(|e| RenderError::from_error("failed to render translated team data", e))?;
        } else {
            let english = team.as_json()["website_data"][id].as_str().unwrap();
            out.write(english)
                .map_err(|e| RenderError::from_error("failed to render", e))?;
        }
        Ok(())
    }
}

pub struct SupportedLocale(pub String);

impl<'r> FromParam<'r> for SupportedLocale {
    type Error = ();

    fn from_param(param: &'r str) -> Result<Self, Self::Error> {
        if SUPPORTED_LOCALES.contains(param) {
            Ok(SupportedLocale(param.parse().map_err(|_| ())?))
        } else {
            Err(())
        }
    }
}

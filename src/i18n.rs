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
    LocaleInfo {
        lang: "hy",
        text: "հայերեն",
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

enum TeamHelperParam {
    /// `{{team-text team name}}`
    Name,

    /// `{{team-text team description}}`
    Description,

    /// `{{team-text team role (lookup member.roles 0)}}`
    Role(String),
}

impl TeamHelperParam {
    fn fluent_id(&self, team_name: &str) -> String {
        match self {
            TeamHelperParam::Name => format!("governance-team-{team_name}-name"),
            TeamHelperParam::Description => format!("governance-team-{team_name}-description"),
            TeamHelperParam::Role(role_id) => format!("governance-role-{role_id}"),
        }
    }

    fn english<'a>(&'a self, team: &'a serde_json::Value) -> &'a str {
        match self {
            TeamHelperParam::Name => team["website_data"]["name"].as_str().unwrap(),
            TeamHelperParam::Description => team["website_data"]["description"].as_str().unwrap(),
            TeamHelperParam::Role(role_id) => {
                for role in team["roles"].as_array().unwrap() {
                    if role["id"] == *role_id {
                        return role["description"].as_str().unwrap();
                    }
                }
                // This should never happen. The `validate_member_roles` test in
                // the team repo enforces that `.members.*.roles.*` lines up
                // with exactly one `.roles.*.id`.
                role_id
            }
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

        let param = match id.as_str() {
            "name" => TeamHelperParam::Name,
            "description" => TeamHelperParam::Description,
            "role" => {
                let Some(role_id) = h.param(2) else {
                    return Err(RenderError::new(
                        "{{team-text}} requires a third parameter for the role id",
                    ));
                };
                TeamHelperParam::Role(role_id.value().as_str().unwrap().to_owned())
            }
            unrecognized => {
                return Err(RenderError::new(format!(
                    "unrecognized {{{{team-text}}}} param {unrecognized:?}",
                )));
            }
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

        // English uses the team data directly, so that it gets autoupdated
        if lang == "en-US" {
            let english = param.english(team.as_json());
            out.write(english)
                .map_err(|e| RenderError::from_error("failed to render English team data", e))?;
        } else if let Some(value) = self.i18n.lookup_no_default_fallback(
            &lang.parse().expect("language must be valid"),
            &param.fluent_id(team_name),
            None,
        ) {
            out.write(&value)
                .map_err(|e| RenderError::from_error("failed to render translated team data", e))?;
        } else {
            let english = param.english(team.as_json());
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

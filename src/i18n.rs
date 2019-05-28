use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderError,
    Renderable,
};

use handlebars::template::{Parameter, TemplateElement};
use rocket::http::RawStr;
use rocket::request::FromParam;
use serde_json::Value as Json;
use std::collections::HashMap;
use std::fs::read_dir;
use std::fs::File;
use std::io;
use std::io::prelude::*;
use std::path::Path;

use fluent_bundle::{FluentBundle, FluentResource, FluentValue};
use fluent_locale::negotiate_languages;

lazy_static! {
    static ref CORE_RESOURCE: FluentResource =
        read_from_file("./locales/core.ftl").expect("cannot find core.ftl");
    static ref RESOURCES: HashMap<String, Vec<FluentResource>> = build_resources();
    static ref BUNDLES: HashMap<String, FluentBundle<'static>> = build_bundles();
    static ref LOCALES: Vec<String> = build_locale_list();
}

pub struct Fallback<'res> {
    default: Option<&'res str>,
    availables: &'res Vec<String>,
}

impl<'res> Fallback<'res> {
    pub fn new(available_locales: &'res Vec<String>) -> Self {
        Self {
            default: Some("en-US"),
            availables: available_locales,
        }
    }

    pub fn order<'t, T: AsRef<str>>(&'t self, targets: &'t [T]) -> Vec<&'t str> {
        negotiate_languages(
            targets,
            &self.availables,
            self.default,
            &fluent_locale::NegotiationStrategy::Filtering,
        )
    }
}

pub struct I18NHelper {
    bundles: &'static HashMap<String, FluentBundle<'static>>,
    fallback: Fallback<'static>,
}

impl I18NHelper {
    pub fn new() -> Self {
        Self {
            bundles: &*BUNDLES,
            fallback: Fallback::new(&*LOCALES),
        }
    }

    pub fn lookup(
        &self,
        lang: &str,
        text_id: &str,
        args: Option<&HashMap<&str, FluentValue>>,
    ) -> Option<String> {
        if let Some(bundle) = self.bundles.get(lang) {
            if bundle.has_message(text_id) {
                let (value, _errors) = bundle.format(text_id, args).unwrap_or_else(|| {
                    panic!(
                        "Failed to format a message for locale {} and id {}",
                        lang, text_id
                    )
                });
                Some(value)
            } else {
                None
            }
        } else {
            panic!("Unknown language {}", lang)
        }
    }
    pub fn lookup_with_fallback(
        &self,
        lang: &str,
        text_id: &str,
        args: Option<&HashMap<&str, FluentValue>>,
    ) -> String {
        for l in self.fallback.order(&[lang]) {
            if let Some(val) = self.lookup(l, text_id, args) {
                return val;
            }
        }
        format!("Unknown localization {}", text_id)
    }
}

#[derive(Default)]
struct StringOutput {
    pub s: String,
}

impl Output for StringOutput {
    fn write(&mut self, seg: &str) -> Result<(), io::Error> {
        self.s.push_str(seg);
        Ok(())
    }
}

impl HelperDef for I18NHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'reg, 'rc>,
        reg: &'reg Handlebars,
        context: &'rc Context,
        rcx: &mut RenderContext<'reg>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let id = if let Some(id) = h.param(0) {
            id
        } else {
            return Err(RenderError::new(
                "{{text}} must have at least one parameter",
            ));
        };

        let id = if let Some(id) = id.path() {
            id
        } else {
            return Err(RenderError::new("{{text}} takes an identifier parameter"));
        };

        let mut args = if h.hash().is_empty() {
            None
        } else {
            let map = h
                .hash()
                .iter()
                .filter_map(|(k, v)| {
                    let json = v.value();
                    let val = match *json {
                        Json::Number(ref n) => FluentValue::Number(n.to_string()),
                        Json::String(ref s) => FluentValue::String(s.to_string()),
                        _ => return None,
                    };
                    Some((&**k, val))
                })
                .collect();
            Some(map)
        };

        if let Some(tpl) = h.template() {
            if args.is_none() {
                args = Some(HashMap::new());
            }
            let args = args.as_mut().unwrap();
            for element in &tpl.elements {
                if let TemplateElement::HelperBlock(ref block) = element {
                    if block.name != "textparam" {
                        return Err(RenderError::new(format!(
                            "{{{{text}}}} can only contain {{{{textparam}}}} elements, not {}",
                            block.name
                        )));
                    }
                    let id = if let Some(el) = block.params.get(0) {
                        if let Parameter::Name(ref s) = *el {
                            s
                        } else {
                            return Err(RenderError::new(
                                "{{textparam}} takes an identifier parameter",
                            ));
                        }
                    } else {
                        return Err(RenderError::new("{{textparam}} must have one parameter"));
                    };
                    if let Some(ref tpl) = block.template {
                        let mut s = StringOutput::default();
                        tpl.render(reg, context, rcx, &mut s)?;
                        args.insert(&*id, FluentValue::String(s.s));
                    }
                }
            }
        }
        let lang = context
            .data()
            .get("lang")
            .expect("Language not set in context")
            .as_str()
            .expect("Language must be string");
        let pontoon = context
            .data()
            .get("pontoon_enabled")
            .expect("Pontoon not set in context")
            .as_bool()
            .expect("Pontoon must be boolean");

        let response = self.lookup_with_fallback(lang, &id, args.as_ref());
        if pontoon {
            out.write(&format!("<span data-l10n-id='{}'>", id))
                .map_err(RenderError::with)?;
        }
        out.write(&response).map_err(RenderError::with)?;
        if pontoon {
            out.write("</span>").map_err(RenderError::with)?;
        }
        Ok(())
    }
}

pub struct TeamHelper {
    i18n: I18NHelper,
}

impl TeamHelper {
    pub fn new() -> Self {
        Self {
            i18n: I18NHelper::new(),
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
        let pontoon = context
            .data()
            .get("pontoon_enabled")
            .expect("Pontoon not set in context")
            .as_bool()
            .expect("Pontoon must be boolean");
        let team_name = team["name"].as_str().unwrap();

        let fluent_id = format!("governance-team-{}-{}", team_name, id);

        if pontoon {
            out.write(&format!("<span data-l10n-id='{}'>", fluent_id))
                .map_err(RenderError::with)?;
        }

        // English uses the team data directly, so that it gets autoupdated
        if lang == "en-US" {
            let english = team["website_data"][id].as_str().unwrap();
            out.write(&english).map_err(RenderError::with)?;
        } else if let Some(value) = self.i18n.lookup(lang, &fluent_id, None) {
            out.write(&value).map_err(RenderError::with)?;
        } else {
            let english = team["website_data"][id].as_str().unwrap();
            out.write(&english).map_err(RenderError::with)?;
        }
        if pontoon {
            out.write("</span>").map_err(RenderError::with)?;
        }
        Ok(())
    }
}

pub fn read_from_file<P: AsRef<Path>>(filename: P) -> io::Result<FluentResource> {
    let mut file = File::open(filename)?;
    let mut string = String::new();

    file.read_to_string(&mut string)?;

    Ok(FluentResource::try_new(string).expect("File did not parse!"))
}

pub fn read_from_dir<P: AsRef<Path>>(dirname: P) -> io::Result<Vec<FluentResource>> {
    let mut result = Vec::new();
    for dir_entry in read_dir(dirname)? {
        let entry = dir_entry?;
        let resource = read_from_file(entry.path())?;
        result.push(resource);
    }
    Ok(result)
}

pub fn create_bundle(lang: &str, resources: &'static Vec<FluentResource>) -> FluentBundle<'static> {
    let mut bundle = FluentBundle::new(&[lang]);
    bundle
        .add_resource(&CORE_RESOURCE)
        .expect("Failed to add core resource to bundle");
    for res in resources {
        bundle
            .add_resource(res)
            .expect("Failed to add FTL resources to the bundle.");
    }

    bundle
}

fn build_locale_list() -> Vec<String> {
    let mut locale_list = Vec::new();
    for key in RESOURCES.keys() {
        locale_list.push(key.clone());
    }
    locale_list
}

fn build_resources() -> HashMap<String, Vec<FluentResource>> {
    let mut all_resources = HashMap::new();
    let entries = read_dir("./locales").unwrap();
    for entry in entries {
        let entry = entry.unwrap();
        if entry.file_type().unwrap().is_dir() {
            if let Ok(lang) = entry.file_name().into_string() {
                let resources = read_from_dir(entry.path()).unwrap();
                all_resources.insert(lang, resources);
            }
        }
    }
    all_resources
}

fn build_bundles() -> HashMap<String, FluentBundle<'static>> {
    let mut bundles = HashMap::new();
    for (ref k, ref v) in &*RESOURCES {
        bundles.insert(k.to_string(), create_bundle(&k, &v));
    }
    bundles
}

pub struct SupportedLocale(pub String);

impl<'r> FromParam<'r> for SupportedLocale {
    type Error = ();

    fn from_param(param: &'r RawStr) -> Result<Self, Self::Error> {
        let param = param.percent_decode().map_err(|_| ())?;
        if BUNDLES.get(param.as_ref()).is_some() {
            Ok(SupportedLocale(param.into()))
        } else {
            Err(())
        }
    }
}

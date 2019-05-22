use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderError,
};

use rocket::http::RawStr;
use rocket::request::FromParam;
use std::collections::HashMap;
use std::fs::read_dir;
use std::fs::File;
use std::io;
use std::io::prelude::*;
use std::path::Path;

use fluent_bundle::{FluentBundle, FluentResource};

lazy_static! {
    static ref RESOURCES: HashMap<String, Vec<FluentResource>> = build_resources();
    static ref BUNDLES: HashMap<String, FluentBundle<'static>> = build_bundles();
}

pub struct I18NHelper {
    bundles: &'static HashMap<String, FluentBundle<'static>>,
}

impl I18NHelper {
    pub fn new() -> Self {
        Self { bundles: &*BUNDLES }
    }
    pub fn i18n_token(&self, lang: &str, text_id: &str) -> String {
        if let Some(bundle) = self.bundles.get(lang) {
            let (value, _errors) = bundle
                .format(text_id, None)
                .expect("Failed to format a message.");
            return value;
        }
        String::from(text_id)
    }
}

impl HelperDef for I18NHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'reg, 'rc>,
        _r: &'reg Handlebars,
        context: &'rc Context,
        _rc: &mut RenderContext<'reg>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let arg = if let Some(arg) = h.param(0) {
            arg
        } else {
            return Err(RenderError::new(
                "{{text}} must have at least one parameter",
            ));
        };

        let arg = if let Some(arg) = arg.path() {
            arg
        } else {
            return Err(RenderError::new("{{text}} takes an identifier parameter"));
        };

        let lang = context
            .data()
            .get("lang")
            .expect("Language not set in context")
            .as_str()
            .expect("Language must be string");
        let response = self.i18n_token(lang, &arg);
        out.write(&response).map_err(RenderError::with)
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

pub fn create_bundle(resources: &'static Vec<FluentResource>) -> FluentBundle<'static> {
    let mut bundle = FluentBundle::new(&["en-US"]);

    for res in resources {
        bundle
            .add_resource(res)
            .expect("Failed to add FTL resources to the bundle.");
    }

    bundle
}

fn build_resources() -> HashMap<String, Vec<FluentResource>> {
    let mut all_resources = HashMap::new();
    let entries = read_dir("./templates/fluent-resource").unwrap();
    for entry in entries {
        let entry = entry.unwrap();
        if let Ok(lang) = entry.file_name().into_string() {
            let resources = read_from_dir(entry.path()).unwrap();
            all_resources.insert(lang, resources);
        }
    }
    all_resources
}

fn build_bundles() -> HashMap<String, FluentBundle<'static>> {
    let mut bundles = HashMap::new();
    for (ref k, ref v) in &*RESOURCES {
        bundles.insert(k.to_string(), create_bundle(&v));
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

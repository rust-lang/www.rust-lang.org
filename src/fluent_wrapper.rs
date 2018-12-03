use std::collections::HashMap;
use std::fs::File;
use std::fs::read_dir;
use std::io::prelude::*;
use std::io::Result;
use std::path::Path;

use fluent_bundle::{FluentBundle, FluentResource};

use i18n::I18NProvider;

pub fn read_from_file<P: AsRef<Path>>(filename: P) -> Result<FluentResource> {
    let mut file = try!(File::open(filename));
    let mut string = String::new();

    file.read_to_string(&mut string)?;

    Ok(FluentResource::try_new(string).expect("File did not parse!"))
}

pub fn read_from_dir<P: AsRef<Path>>(dirname: P) -> Result<Vec<FluentResource>> {
    let mut result = Vec::new();
    for dir_entry in try!(read_dir(dirname)) {
        let entry = try!(dir_entry);
        let resource = try!(read_from_file(entry.path()));
        result.push(resource);
    }
    Ok(result)
}

pub fn create_bundle(resources: &'static Vec<FluentResource>) -> FluentBundle<'static> {
    let mut bundle = FluentBundle::new(&["en-US"]);

    for res in resources {
        bundle.add_resource(res)
            .expect("Failed to add FTL resources to the bundle.");
    }

    bundle
}

lazy_static! {
    static ref RESOURCES: HashMap<String, Vec<FluentResource>> = build_resources();
    static ref BUNDLES: HashMap<String, FluentBundle<'static>> = build_bundles();
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

pub struct FluentI18nProvider {
    bundles: &'static HashMap<String, FluentBundle<'static>>,
}

impl FluentI18nProvider {
    pub fn new() -> FluentI18nProvider {
        FluentI18nProvider {
            bundles: &*BUNDLES
        }
    }
}

impl I18NProvider for FluentI18nProvider {
    fn i18n_token(&self, lang: &str, text_id: &str) -> String {
        if let Some(bundle) = self.bundles.get(lang) {
            let (value, _errors) = bundle.format(text_id, None)
                .expect("Failed to format a message.");
            return value
        }
        String::from(text_id)
    }
}

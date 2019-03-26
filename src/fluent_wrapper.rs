use std::collections::HashMap;
use std::fs::read_dir;
use std::fs::File;
use std::io::prelude::*;
use std::io::Result;
use std::path::Path;

use fluent_bundle::{FluentBundle, FluentResource};

use crate::i18n::I18NProvider;

pub fn read_from_file<P: AsRef<Path>>(filename: P) -> Result<FluentResource> {
    let mut file = File::open(filename)?;
    let mut string = String::new();

    file.read_to_string(&mut string)?;

    Ok(FluentResource::try_new(string).expect("File did not parse!"))
}

pub fn read_from_dir<P: AsRef<Path>>(dirname: P) -> Result<Vec<FluentResource>> {
    let mut result = Vec::new();
    for dir_entry in read_dir(dirname)? {
        let entry = dir_entry?;
        let resource = read_from_file(entry.path())?;
        result.push(resource);
    }
    Ok(result)
}

pub fn load_fluent_resources(resources_dir: &str) -> HashMap<String, Vec<FluentResource>> {
    let mut all_resources = HashMap::new();
    let entries = read_dir(resources_dir).unwrap();
    for entry in entries {
        let entry = entry.unwrap();
        if let Ok(lang) = entry.file_name().into_string() {
            let resources = read_from_dir(entry.path()).unwrap();
            all_resources.insert(lang, resources);
        }
    }
    all_resources
}

fn create_bundle(resources: &Vec<FluentResource>) -> FluentBundle {
    let mut bundle = FluentBundle::new(&["en-US"]);

    for res in resources {
        bundle
            .add_resource(res)
            .expect("Failed to add FTL resources to the bundle.");
    }

    bundle
}

fn build_bundles(
    resources: &HashMap<String, Vec<FluentResource>>,
) -> HashMap<String, FluentBundle> {
    let mut bundles = HashMap::new();
    for (ref k, ref v) in resources {
        bundles.insert(k.to_string(), create_bundle(&v));
    }
    bundles
}

pub struct FluentI18nProvider<'res> {
    fallback_lang: String,
    bundles: HashMap<String, FluentBundle<'res>>,
}

impl<'res> FluentI18nProvider<'res> {
    pub fn new(
        fallback_lang: String,
        resources: &HashMap<String, Vec<FluentResource>>,
    ) -> FluentI18nProvider {
        let bundles = build_bundles(resources);
        FluentI18nProvider {
            fallback_lang: fallback_lang,
            bundles: bundles,
        }
    }

    fn tr(&self, lang: &str, text_id: &str) -> Option<String> {
        if let Some(bundle) = self.bundles.get(lang) {
            if let Some((value, _errors)) = bundle.format(text_id, None) {
                return Some(value);
            }
        }
        None
    }
}

impl<'res> I18NProvider for FluentI18nProvider<'res> {
    fn i18n_token(&self, lang: &str, text_id: &str) -> String {
        self.tr(lang, text_id)
            .or(self.tr(&self.fallback_lang, text_id))
            .unwrap_or(String::from(text_id))
    }
}

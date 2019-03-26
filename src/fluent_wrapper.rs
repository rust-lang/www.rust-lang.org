use std::collections::HashMap;
use std::error::Error;
use std::fs::File;
use std::fs::read_dir;
use std::io::BufReader;
use std::io::prelude::*;
use std::io::Result;
use std::path::Path;

use fluent_bundle::{FluentBundle, FluentResource};

use i18n::I18NProvider;

pub fn read_from_file<P: AsRef<Path>>(filename: P) -> Result<Vec<FluentResource>> {
    let mut file = try!(File::open(filename));
    let reader = BufReader::new(file);

    let mut fluent_resources = Vec::new();
    let mut continuing: bool = false;
    let mut new_seg: bool = true;
    let mut segment: String = String::new();
    for (i, line) in reader.lines().enumerate() {
        let l = line.unwrap();
        if new_seg {
            segment.push_str(&l);
            new_seg = false;
            continuing = true;
        } else if continuing {
            if l.trim().is_empty() {
                continuing = false;
                new_seg = true;
                fluent_resources.push(FluentResource::try_new(segment).unwrap());
                segment = String::new();
            } else {
                segment.push_str(&l);
            }
        }
    }
    Ok(fluent_resources)
}

pub fn read_from_dir<P: AsRef<Path>>(dirname: P) -> Result<Vec<FluentResource>> {
    let mut result = Vec::new();
    for dir_entry in try!(read_dir(dirname)) {
        let entry = try!(dir_entry);
        let mut resources = try!(read_from_file(entry.path()));
        result.append(&mut resources);
    }
    Ok(result)
}

pub fn create_bundle<'a>(resources: &'a Vec<FluentResource>) -> FluentBundle<'a> {
    let mut bundle = FluentBundle::new(&["en-US"]);

    for res in resources {
        bundle.add_resource(res)
            .expect("Failed to add FTL resources to the bundle.");
    }

    bundle
}

pub type FluentCollection<'a> = HashMap<String, FluentBundle<'a>>;

pub struct FluentI18nProvider<'a> {
    collection: &'a FluentCollection<'a>,
}

impl <'a> FluentI18nProvider<'a> {
    pub fn new(collection: &'a FluentCollection<'a>) -> FluentI18nProvider<'a> {
        FluentI18nProvider {
            collection: collection
        }
    }
}

impl <'a> I18NProvider for FluentI18nProvider<'a> {
    fn i18n_token(&self, lang: &str, text_id: &str) -> String {
        if let Some(bundle) = self.collection.get(lang) {
            let (value, errors) = bundle.format(text_id, None)
                .expect("Failed to format a message.");
            return value
        }
        String::from(text_id)
    }
}

use rocket::{Request, Response};

use regex::Regex;
use rocket::fairing::{Fairing, Info, Kind};
use std::io::Cursor;

pub trait I18NProvider {
    fn should_i18n(&self, request: &Request) -> bool {
        let nots = ["static"];
        let possibles = ["governance", "learn", "production", "tools"];
        let mut ret = true; // frontpage
        for (i, ref s) in request.uri().segments().enumerate() {
            match i {
                0 => ret = !nots.iter().any(|v| v == s) && possibles.iter().any(|v| v == s),
                _ => (),
            }
        }
        ret
    }

    fn get_language(&self, request: &Request) -> String {
        request
            .get_query_value("lang")
            .and_then(|r| r.ok())
            .unwrap_or("en".into())
    }

    fn do_i18n(&self, lang: &str, text: &str) -> String {
        let re = Regex::new(r"::[^ ]+?::").unwrap();
        let mut new_text: String = String::from(text.clone());
        let mut diff: isize = 0;
        for mat in re.find_iter(&text) {
            let old_length: usize = mat.end() - mat.start();
            let id = &mat.as_str()[2..old_length - 2];
            let ltext = self.i18n_token(lang, id);
            let new_length: usize = ltext.len();
            let replaced_start: usize = (mat.start() as isize + diff) as usize;
            let replaced_end: usize = replaced_start + old_length;
            diff = diff + new_length as isize - old_length as isize;
            new_text.replace_range(replaced_start..replaced_end, ltext.as_str());
        }
        new_text
    }

    fn i18n_token(&self, lang: &str, text_id: &str) -> String;
}

struct DummyProvider;

impl I18NProvider for DummyProvider {
    fn i18n_token(&self, lang: &str, text_id: &str) -> String {
        format!("::localized text for {} from {}::", text_id, lang)
    }
}

pub struct I18N {
    provider: Box<I18NProvider + Send + Sync>,
}

impl I18N {
    pub fn dummy() -> I18N {
        I18N {
            provider: Box::new(DummyProvider {}),
        }
    }

    pub fn from(provider: Box<I18NProvider + Send + Sync>) -> I18N {
        I18N { provider: provider }
    }
}

impl Fairing for I18N {
    fn info(&self) -> Info {
        Info {
            name: "I18N/L10N",
            kind: Kind::Response,
        }
    }

    fn on_response(&self, request: &Request, response: &mut Response) {
        if self.provider.should_i18n(request) {
            let lang = self.provider.get_language(request);
            let body_original = response.body_string().unwrap();
            let body_new = self.provider.do_i18n(&lang, &body_original);
            response.set_sized_body(Cursor::new(body_new));
        }
    }
}

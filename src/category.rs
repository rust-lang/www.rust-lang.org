use std::path::PathBuf;

use rocket::http::RawStr;
use rocket::request::FromParam;

fn is_category(name: &str) -> bool {
    let mut path = PathBuf::from("templates");
    path.push(name);
    path.push("index.hbs");
    path.exists()
}

pub struct Category {
    name: String,
}

impl Category {
    pub fn name(&self) -> &str {
        self.name.as_str()
    }

    pub fn index(&self) -> String {
        format!("{}/index", self.name())
    }
}

impl<'r> FromParam<'r> for Category {
    type Error = &'r RawStr;

    fn from_param(param: &'r RawStr) -> Result<Self, Self::Error> {
        let res = param.url_decode();
        match res {
            Ok(url) => {
                if is_category(&url) {
                    Ok(Category { name: url })
                } else {
                    Err(RawStr::from_str("no such category"))
                }
            }
            Err(e) => Err(RawStr::from_str("url illegal in utf-8")),
        }
    }
}

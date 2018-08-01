use rocket::http::RawStr;
use rocket::request::FromParam;

const CATEGORIES: [&str; 8] = [
    "community",
    "contribute",
    "governance",
    "learn",
    "policies",
    "production",
    "tools",
    "what",
];

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
                if CATEGORIES.contains(&url.as_str()) {
                    Ok(Category { name: url })
                } else {
                    Err(RawStr::from_str("no such category"))
                }
            }
            Err(e) => Err(RawStr::from_str("url illegal in utf-8")),
        }
    }
}

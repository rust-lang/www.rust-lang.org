use std::error::Error;
use rocket::http::Status;
use regex::Regex;
use rocket::response::Redirect;

static REDIRECTS_YML_PATH: &str = "src/data/redirects.yml";

lazy_static! {
    static ref REDIRECTS: Vec<InnerRedirect> = load_redirects(REDIRECTS_YML_PATH).unwrap();
}

#[derive(Deserialize, Clone)]
pub struct InnerRedirect {
    pub from: String,
    pub to: String,
    pub status: Option<u16>
}

impl InnerRedirect {
    pub fn status(&self) -> Status {
        Status::from_code(self.status.unwrap_or(302)).unwrap_or(Status::Found)
    }
    pub fn redirect(&self, to: String) -> Redirect {
        match self.status() {
            Status::MovedPermanently => Redirect::permanent(to),
            Status::Found => Redirect::found(to),
            Status::SeeOther => Redirect::to(to),
            Status::TemporaryRedirect => Redirect::temporary(to),
            Status::PermanentRedirect => Redirect::permanent(to),
            _ => Redirect::found(to)
        }
    }
}

#[derive(Debug)]
pub struct NoRedirectFound;

fn load_redirects(path: &str) -> Result<Vec<InnerRedirect>, Box<dyn Error>> {
    Ok(serde_yaml::from_str(&std::fs::read_to_string(path)?)?)
}

pub fn find_redirect(from: String) -> Result<Redirect, NoRedirectFound> {
    for inner_redirect in REDIRECTS.iter() {
        let rex = Regex::new(&inner_redirect.from).unwrap();
        if rex.is_match(&from) {
            let mut redirect_to = String::from("");
            rex.captures(&from).unwrap().expand(inner_redirect.to.as_str(), &mut redirect_to);
            return Ok(inner_redirect.redirect(redirect_to))
        }
    }
    return Err(NoRedirectFound)
}
use rocket::fs::NamedFile;
use rocket::http::{hyper, Header};
use rocket::response::Responder;

#[derive(Responder)]
pub struct CachedNamedFile {
    file: NamedFile,
    header: Header<'static>,
}

impl CachedNamedFile {
    pub fn max_age(file: NamedFile, max_age: u32) -> Self {
        Self {
            file,
            header: Header::new(
                hyper::header::CACHE_CONTROL.as_str(),
                format!("max-age={max_age}"),
            ),
        }
    }
}

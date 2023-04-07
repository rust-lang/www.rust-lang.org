use rocket::fs::NamedFile;
use rocket::http::uncased::Uncased;
use rocket::http::Header;
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
            header: Header {
                name: Uncased {
                    string: "CacheControl".into(),
                },
                value: format!("max-age={max_age}").into(),
            },
        }
    }
}

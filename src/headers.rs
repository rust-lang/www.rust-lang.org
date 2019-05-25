use rocket::fairing::{Fairing, Info, Kind};
use rocket::http::Header;
use rocket::{Request, Response};

static HEADERS: &[(&str, &str)] = &[
    ("x-xss-protection", "1; mode=block"),
    ("strict-transport-security", "max-age=63072000"),
    ("x-content-type-options", "nosniff"),
    ("referrer-policy", "no-referrer, strict-origin-when-cross-origin"),
    ("content-security-policy", "default-src 'self' pontoon.rust-lang.org pontoon.mozilla.org; connect-src 'self' pontoon.rust-lang.org ; frame-ancestors 'self' pontoon.rust-lang.org rust-pontoon.herokuapp.com; script-src 'self' pontoon.rust-lang.org pontoon.mozilla.org; style-src 'self' pontoon.rust-lang.org pontoon.mozilla.org; img-src 'self' avatars.githubusercontent.com pontoon.rust-lang.org pontoon.mozilla.org; font-src 'self'; manifest-src 'self'; frame-src pontoon.rust-lang.org player.vimeo.com"),
];

pub(crate) struct InjectHeaders;

impl Fairing for InjectHeaders {
    fn info(&self) -> Info {
        Info {
            name: "HTTP headers injector",
            kind: Kind::Response,
        }
    }

    fn on_response(&self, _request: &Request, response: &mut Response) {
        for (key, value) in HEADERS {
            response.set_header(Header::new(*key, *value));
        }
    }
}

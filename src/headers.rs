use rocket::fairing::{Fairing, Info, Kind};
use rocket::http::Header;
use rocket::{Request, Response};

static HEADERS: &[(&str, &str)] = &[
    ("x-xss-protection", "1; mode=block"),
    ("strict-transport-security", "max-age=63072000"),
    ("x-content-type-options", "nosniff"),
    (
        "referrer-policy",
        "no-referrer, strict-origin-when-cross-origin",
    ),
];

static HEADER_CSP_NORMAL: &str = "default-src 'self'; frame-ancestors 'self'; img-src 'self' avatars.githubusercontent.com; frame-src 'self' player.vimeo.com";
static HEADER_CSP_PONTOON: &str = "default-src 'self' pontoon.rust-lang.org pontoon.mozilla.org; frame-ancestors 'self' pontoon.rust-lang.org; img-src 'self' avatars.githubusercontent.com pontoon.rust-lang.org pontoon.mozilla.org; frame-src 'self' pontoon.rust-lang.org player.vimeo.com";

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
        let csp = if super::pontoon_enabled() {
            HEADER_CSP_PONTOON
        } else {
            HEADER_CSP_NORMAL
        };
        response.set_header(Header::new("content-security-policy", csp));
    }
}

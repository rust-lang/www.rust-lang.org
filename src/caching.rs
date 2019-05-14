use rocket::http::hyper::header::{CacheControl, CacheDirective};
use rocket::request::Request;
use rocket::response::{self, Responder};

pub struct Cached<R> {
    inner: R,
    directives: Vec<CacheDirective>,
}

impl<'r, R> Responder<'r> for Cached<R>
where
    R: Responder<'r>,
{
    fn respond_to(self, req: &Request) -> response::Result<'r> {
        let Cached { inner, directives } = self;
        inner.respond_to(req).map(|mut res| {
            res.set_header(CacheControl(directives));
            res
        })
    }
}

pub trait Caching
where
    Self: Sized,
{
    fn cached(self, directives: Vec<CacheDirective>) -> Cached<Self>;
}

impl<'r, R> Caching for R
where
    R: Responder<'r>,
{
    fn cached(self, directives: Vec<CacheDirective>) -> Cached<Self> {
        Cached {
            inner: self,
            directives: directives,
        }
    }
}

use rocket::Request;

use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderError,
};

pub struct I18NHelper {
    provider: Box<I18NProvider + Send + Sync>,
}

impl I18NHelper {
    pub fn new(provider: Box<I18NProvider + Send + Sync>) -> Self {
        Self { provider }
    }
}

impl HelperDef for I18NHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'reg, 'rc>,
        _r: &'reg Handlebars,
        _ctx: &'rc Context,
        _rc: &mut RenderContext<'reg>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let arg = if let Some(arg) = h.param(0) {
            arg
        } else {
            return Err(RenderError::new("{{text}} must have at least one parameter"));
        };

        let arg = if let Some(arg) = arg.value().as_str() {
            arg
        } else {
            return Err(RenderError::new("{{text}} takes a string parameter"));
        };

        let response = self.provider.i18n_token("en", arg);
        out.write(&response);
        Ok(())
    }
}

pub trait I18NProvider {
    fn get_language(&self, request: &Request) -> String {
        request
            .get_query_value("lang")
            .and_then(|r| r.ok())
            .unwrap_or("en".into())
    }

    fn i18n_token(&self, lang: &str, text_id: &str) -> String;
}

struct DummyProvider;

impl I18NProvider for DummyProvider {
    fn i18n_token(&self, lang: &str, text_id: &str) -> String {
        format!("::localized text for {} from {}::", text_id, lang)
    }
}

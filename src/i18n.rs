use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderError,
};

use crate::fluent_wrapper::FluentProvider;

pub struct I18NHelper {
    provider: FluentProvider,
}

impl I18NHelper {
    pub fn new() -> Self {
        Self {
            provider: FluentProvider::new(),
        }
    }
}

impl HelperDef for I18NHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'reg, 'rc>,
        _r: &'reg Handlebars,
        context: &'rc Context,
        _rc: &mut RenderContext<'reg>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let arg = if let Some(arg) = h.param(0) {
            arg
        } else {
            return Err(RenderError::new(
                "{{text}} must have at least one parameter",
            ));
        };

        let arg = if let Some(arg) = arg.value().as_str() {
            arg
        } else {
            return Err(RenderError::new("{{text}} takes a string parameter"));
        };

        let lang = context
            .data()
            .get("lang")
            .expect("Language not set in context")
            .as_str()
            .expect("Language must be string");
        let response = self.provider.i18n_token(lang, arg);
        out.write(&response).map_err(RenderError::with)
    }
}

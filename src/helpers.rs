use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderErrorReason,
};
use rust_team_data::v1::Team;

pub struct TeamAnchorHelper;

impl HelperDef for TeamAnchorHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'rc>,
        _: &'reg Handlebars,
        _context: &'rc Context,
        _rcx: &mut RenderContext<'reg, 'rc>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let Some(team) = h.param(0) else {
            return Err(RenderErrorReason::ParamNotFoundForIndex(
                "{{team-anchor}} must have a single parameter",
                0,
            )
            .into());
        };
        let team: Team = serde_json::from_value(team.value().clone())
            .map_err(|e| RenderErrorReason::SerdeError(e))?;

        out.write(&format!("#team-{}", team.name))
            .map_err(|e| RenderErrorReason::NestedError(Box::new(e)))?;
        Ok(())
    }
}

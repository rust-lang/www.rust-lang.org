use handlebars::{
    Context, Handlebars, Helper, HelperDef, HelperResult, Output, RenderContext, RenderErrorReason,
};
use rust_team_data::v1::Team;

/// Renders the anchor link of a team displayed on the governance page.
/// team-anchor team => #team-{team-name}
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
        let team: Team =
            serde_json::from_value(team.value().clone()).map_err(RenderErrorReason::SerdeError)?;

        out.write(&format!("#team-{}", team.name))
            .map_err(|e| RenderErrorReason::NestedError(Box::new(e)))?;
        Ok(())
    }
}

/// Renders a relative link to a page that displays the information about a specific team member.
/// person-link github => ...
pub struct PersonLinkHelper;

impl HelperDef for PersonLinkHelper {
    fn call<'reg: 'rc, 'rc>(
        &self,
        h: &Helper<'rc>,
        _: &'reg Handlebars,
        _context: &'rc Context,
        _rcx: &mut RenderContext<'reg, 'rc>,
        out: &mut dyn Output,
    ) -> HelperResult {
        let Some(github_username) = h.param(0) else {
            return Err(RenderErrorReason::ParamNotFoundForIndex(
                "{{person-link}} must have a single parameter",
                0,
            )
            .into());
        };

        out.write(&format!(
            "/governance/people/{}",
            github_username.render().to_lowercase()
        ))
        .map_err(|e| RenderErrorReason::NestedError(Box::new(e)))?;
        Ok(())
    }
}

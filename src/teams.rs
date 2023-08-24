use handlebars::{Context, Handlebars, Helper, HelperResult, Output, RenderContext, RenderError};
use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};
use rust_team_data::v1::{Team, TeamKind, Teams, BASE_URL};
use std::cmp::Reverse;
use std::collections::HashMap;
use std::error::Error;
use std::fmt;
use std::time::Instant;

use crate::cache::{Cache, Cached};

#[derive(Default, Serialize)]
pub struct IndexData {
    teams: Vec<IndexTeam>,
    wgs: Vec<IndexTeam>,
}

#[derive(Serialize)]
struct IndexTeam {
    #[serde(flatten)]
    team: Team,
    url: String,
}

#[derive(Serialize)]
pub struct PageData {
    pub team: Team,
    zulip_domain: &'static str,
    subteams: Vec<Team>,
    wgs: Vec<Team>,
    project_groups: Vec<Team>,
}

#[derive(Clone)]
struct Data {
    teams: Vec<Team>,
}

const ENCODING_SET: AsciiSet = NON_ALPHANUMERIC.remove(b'-').remove(b'_');

impl Data {
    async fn load(teams_cache: &Cache<RustTeams>) -> Result<Self, Box<dyn Error + Send + Sync>> {
        Ok(Data {
            teams: RustTeams::get(teams_cache)
                .await
                .0
                .ok_or_else(|| Box::<dyn Error + Send + Sync>::from("failed to load teams"))?,
        })
    }

    #[cfg(test)]
    fn dummy(teams: Vec<Team>) -> Self {
        Data { teams }
    }

    fn index_data(self) -> Result<IndexData, Box<dyn Error + Send + Sync>> {
        let mut data = IndexData::default();

        self.teams
            .into_iter()
            .filter(|team| team.website_data.is_some())
            .filter(|team| team.subteam_of.is_none())
            .map(|team| IndexTeam {
                url: format!(
                    "{}/{}",
                    kind_to_str(team.kind),
                    team.website_data.as_ref().unwrap().page
                ),
                team,
            })
            .for_each(|team| match team.team.kind {
                TeamKind::Team => data.teams.push(team),
                TeamKind::WorkingGroup => data.wgs.push(team),
                _ => {}
            });

        data.teams.sort_by_key(|index_team| {
            Reverse(index_team.team.website_data.as_ref().unwrap().weight)
        });
        data.wgs.sort_by_key(|index_team| {
            Reverse(index_team.team.website_data.as_ref().unwrap().weight)
        });
        Ok(data)
    }

    pub fn page_data(
        self,
        section: &str,
        team_name: &str,
    ) -> Result<PageData, Box<dyn Error + Send + Sync>> {
        // Find the main team first
        let main_team = self
            .teams
            .iter()
            .filter(|team| team.website_data.as_ref().map(|ws| ws.page.as_str()) == Some(team_name))
            .find(|team| kind_to_str(team.kind) == section)
            .cloned()
            .ok_or(TeamNotFound)?;

        // Don't show pages for subteams
        if main_team.subteam_of.is_some() {
            return Err(TeamNotFound.into());
        }

        // Then find all the subteams, working groups and project groups.
        let mut raw_subteams = Vec::new();
        let mut wgs = Vec::new();
        let mut project_groups = Vec::new();

        let superteams: HashMap<_, _> = self
            .teams
            .iter()
            .filter(|team| matches!(team.kind, TeamKind::Team))
            .filter_map(|team| Some((team.name.clone(), team.subteam_of.clone()?)))
            .collect();

        self.teams
            .into_iter()
            .filter(|team| team.website_data.is_some())
            .filter(|team| {
                // For teams find not only direct subteams but also transitive ones.
                if let TeamKind::Team = team.kind {
                    let mut team = &team.name;

                    // The graph of teams is guaranteed to be acyclic by the CI script of
                    // the team repository. Therefore this loop has to terminate eventually.
                    while let Some(superteam) = superteams.get(team) {
                        if superteam == &main_team.name {
                            return true;
                        }

                        team = superteam;
                    }

                    return false;
                }

                team.subteam_of.as_ref() == Some(&main_team.name)
            })
            .for_each(|team| match team.kind {
                TeamKind::Team => raw_subteams.push(team),
                TeamKind::WorkingGroup => wgs.push(team),
                TeamKind::ProjectGroup => project_groups.push(team),
                _ => {}
            });

        raw_subteams.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));
        wgs.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));
        project_groups.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));

        // Lay out subteams according to their hierarchy.
        // Superteams come first and subteams come after, recursively.
        // The ordering of sibling teams is unaffected, they remain sorted first by weight, then
        // alphabetically if we assume that the Team API serves the teams alphabetically.
        let mut subteams = Vec::with_capacity(raw_subteams.len());
        lay_out_subteams_hierarchically(&mut subteams, None, &main_team.name, &raw_subteams);

        fn lay_out_subteams_hierarchically<'a>(
            result: &mut Vec<Team>,
            team: Option<&Team>,
            main_team: &str,
            subteams: &[Team],
        ) {
            let name = team.map(|team| team.name.as_str()).or(Some(main_team));

            if let Some(team) = team {
                result.push(team.clone());
            }

            for subteam in subteams {
                if subteam.subteam_of.as_deref() == name {
                    lay_out_subteams_hierarchically(result, Some(subteam), main_team, subteams);
                }
            }
        }

        Ok(PageData {
            team: main_team,
            zulip_domain: crate::ZULIP_DOMAIN,
            subteams,
            wgs,
            project_groups,
        })
    }
}

pub fn encode_zulip_stream(
    h: &Helper,
    _: &Handlebars,
    _: &Context,
    _: &mut RenderContext,
    out: &mut dyn Output,
) -> HelperResult {
    let zulip_stream = if let Some(p) = h.param(0) {
        p.value()
    } else {
        return Err(RenderError::new(
            "{{encode-zulip-stream takes 1 parameter}}",
        ));
    };
    let zulip_stream = if let Some(s) = zulip_stream.as_str() {
        s
    } else {
        return Err(RenderError::new(
            "{{encode-zulip-stream takes a string parameter}}",
        ));
    };

    // https://github.com/zulip/zulip/blob/159641bab8c248f5b72a4e736462fb0b48e7fa24/static/js/hash_util.js#L20-L25
    let stream_encoded = utf8_percent_encode(zulip_stream, &ENCODING_SET)
        .to_string()
        .replace('%', ".");

    out.write(&stream_encoded)?;
    Ok(())
}

pub async fn index_data(
    teams_cache: &Cache<RustTeams>,
) -> Result<IndexData, Box<dyn Error + Send + Sync>> {
    Data::load(teams_cache).await?.index_data()
}

pub async fn page_data(
    section: &str,
    team_name: &str,
    teams_cache: &Cache<RustTeams>,
) -> Result<PageData, Box<dyn Error + Send + Sync>> {
    Data::load(teams_cache).await?.page_data(section, team_name)
}

#[derive(Debug, Clone)]
pub struct RustTeams(pub Option<Vec<Team>>, pub Instant);

impl Default for RustTeams {
    fn default() -> Self {
        Self(Default::default(), Instant::now())
    }
}

#[async_trait]
impl Cached for RustTeams {
    fn get_timestamp(&self) -> Instant {
        self.1
    }
    async fn fetch() -> Result<Self, Box<dyn Error + Send + Sync>> {
        let resp: Teams = reqwest::get(format!("{}/teams.json", BASE_URL))
            .await?
            .error_for_status()?
            .json()
            .await?;

        Ok(RustTeams(
            Some(
                resp.teams
                    .into_iter()
                    .map(|(_key, value)| value)
                    .collect::<Vec<Team>>(),
            ),
            Instant::now(),
        ))
    }
}

fn kind_to_str(kind: TeamKind) -> &'static str {
    match kind {
        TeamKind::Team => "teams",
        TeamKind::WorkingGroup => "wgs",
        TeamKind::ProjectGroup => "project-groups",
        _ => "UNSUPPORTED",
    }
}

pub struct TeamNotFound;

impl Error for TeamNotFound {}

impl fmt::Debug for TeamNotFound {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "team not found")
    }
}

impl fmt::Display for TeamNotFound {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "team not found")
    }
}

#[cfg(test)]
mod tests {
    use super::{Data, TeamNotFound};
    use rust_team_data::v1::{Team, TeamKind, TeamMember, TeamWebsite};

    fn dummy_team(name: &str) -> Team {
        Team {
            name: name.into(),
            kind: TeamKind::Team,
            subteam_of: None,
            members: vec![
                TeamMember {
                    name: "John Doe".into(),
                    github: "johnd".into(),
                    is_lead: false,
                    github_id: 1234,
                },
                TeamMember {
                    name: "Jane Doe".into(),
                    github: "janed".into(),
                    is_lead: true,
                    github_id: 1234,
                },
            ],
            alumni: Vec::new(),
            website_data: Some(TeamWebsite {
                name: format!("Team {}", name),
                description: format!("Description of {}", name),
                page: name.into(),
                email: None,
                repo: None,
                discord: None,
                zulip_stream: None,
                weight: 0,
            }),
            github: None,
            discord: vec![],
        }
    }

    #[test]
    fn test_index_data() {
        let mut foo = dummy_team("foo");
        foo.kind = TeamKind::WorkingGroup;
        let data = Data::dummy(vec![foo, dummy_team("bar")]);

        let res = data.index_data().unwrap();
        assert_eq!(res.teams.len(), 1);
        assert_eq!(res.teams[0].url, "teams/bar");
        assert_eq!(res.teams[0].team.name, "bar");
        assert_eq!(res.wgs.len(), 1);
        assert_eq!(res.wgs[0].url, "wgs/foo");
        assert_eq!(res.wgs[0].team.name, "foo");
    }

    #[test]
    fn test_index_subteams_are_hidden() {
        let mut foo = dummy_team("foo");
        foo.subteam_of = Some(String::new());
        let data = Data::dummy(vec![foo]);

        assert_eq!(data.index_data().unwrap().teams.len(), 0);
    }

    #[test]
    fn test_page_data() {
        let main = dummy_team("main");
        let mut subteam = dummy_team("subteam");
        subteam.subteam_of = Some("main".into());
        let mut subteam2 = dummy_team("subteam2");
        subteam2.subteam_of = Some("main".into());
        subteam2.website_data.as_mut().unwrap().weight = 5;
        let mut wg = dummy_team("wg");
        wg.subteam_of = Some("main".into());
        wg.kind = TeamKind::WorkingGroup;
        wg.website_data.as_mut().unwrap().zulip_stream = Some("t-compiler/wg-rls-2.0".to_string());

        let other = dummy_team("other");
        let mut other_subteam = dummy_team("other-subteam");
        other_subteam.subteam_of = Some("other".into());
        let mut other_wg = dummy_team("other-wg");
        other_wg.subteam_of = Some("other".into());
        other_wg.kind = TeamKind::WorkingGroup;

        let data = Data::dummy(vec![
            main,
            subteam,
            subteam2,
            wg,
            other,
            other_subteam,
            other_wg,
        ]);
        let page = data.page_data("teams", "main").unwrap();

        assert_eq!(page.team.name, "main");
        assert_eq!(page.subteams.len(), 2);
        assert_eq!(page.subteams[0].name, "subteam2");
        assert_eq!(page.subteams[1].name, "subteam");
        assert_eq!(page.wgs.len(), 1);
        assert_eq!(page.wgs[0].name, "wg");
        let zulip_stream = page.wgs[0]
            .website_data
            .as_ref()
            .and_then(|site| site.zulip_stream.as_deref());
        assert_eq!(zulip_stream, Some("t-compiler/wg-rls-2.0"));
    }

    #[test]
    fn test_missing_pages() {
        let foo = dummy_team("foo");
        let mut bar = dummy_team("bar");
        bar.kind = TeamKind::WorkingGroup;
        let data = Data::dummy(vec![foo, bar]);

        assert!(data
            .clone()
            .page_data("teams", "unknown")
            .err()
            .unwrap()
            .is::<TeamNotFound>());
        assert!(data
            .clone()
            .page_data("wgs", "foo")
            .err()
            .unwrap()
            .is::<TeamNotFound>());
        assert!(data
            .page_data("teams", "bar")
            .err()
            .unwrap()
            .is::<TeamNotFound>());
    }

    #[test]
    fn test_subteams_cant_be_loaded() {
        let mut foo = dummy_team("foo");
        foo.subteam_of = Some("bar".into());
        let data = Data::dummy(vec![foo, dummy_team("bar")]);

        assert!(data
            .page_data("teams", "foo")
            .err()
            .unwrap()
            .is::<TeamNotFound>());
    }
}

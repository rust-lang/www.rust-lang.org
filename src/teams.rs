use crate::utils::fetch;
use handlebars::{
    Context, Handlebars, Helper, HelperResult, Output, RenderContext, RenderErrorReason,
};
use percent_encoding::{AsciiSet, NON_ALPHANUMERIC, utf8_percent_encode};
use rust_team_data::v1::{BASE_URL, People, Person, Team, TeamKind, TeamMember, Teams};
use serde::Serialize;
use std::cmp::Reverse;
use std::collections::HashMap;
use std::error::Error;
use std::fmt;

const ENCODING_SET: AsciiSet = NON_ALPHANUMERIC.remove(b'-').remove(b'_');

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
        return Err(RenderErrorReason::ParamNotFoundForIndex(
            "{{encode-zulip-stream takes 1 parameter}}",
            0,
        )
        .into());
    };
    let zulip_stream = if let Some(s) = zulip_stream.as_str() {
        s
    } else {
        return Err(RenderErrorReason::ParamTypeMismatchForName(
            "encode-zulip-stream",
            "0".into(),
            "string".into(),
        )
        .into());
    };

    // https://github.com/zulip/zulip/blob/159641bab8c248f5b72a4e736462fb0b48e7fa24/static/js/hash_util.js#L20-L25
    let stream_encoded = utf8_percent_encode(zulip_stream, &ENCODING_SET)
        .to_string()
        .replace('%', ".");

    out.write(&stream_encoded)?;
    Ok(())
}

#[derive(Debug, Clone)]
pub struct RustTeamData {
    pub teams: Vec<Team>,
    pub archived_teams: Vec<Team>,
    // GitHub username => person data
    pub people: HashMap<String, Person>,
}

impl RustTeamData {
    #[cfg(test)]
    fn dummy(teams: Vec<Team>) -> Self {
        RustTeamData {
            teams,
            archived_teams: vec![],
            people: HashMap::new(),
        }
    }

    pub fn index_data(&self) -> IndexData {
        let mut teams = self
            .teams
            .clone()
            .into_iter()
            .filter(|team| team.website_data.is_some())
            // On the main page, show the leadership-council and all top-level
            // teams.
            .filter(is_toplevel_team)
            .map(|team| IndexTeam {
                section: kind_to_str(team.kind),
                page_name: team.website_data.clone().unwrap().page,
                url: get_team_relative_url(&team),
                team,
            })
            .collect::<Vec<IndexTeam>>();

        teams.sort_by_key(|index_team| {
            Reverse(index_team.team.website_data.as_ref().unwrap().weight)
        });
        IndexData { teams }
    }

    pub fn page_data(&self, section: &str, team_page_name: &str) -> anyhow::Result<PageData> {
        let teams = self.teams.clone();

        // Find the main team first
        let mut main_team = teams
            .iter()
            .filter(|team| {
                team.website_data.as_ref().map(|ws| ws.page.as_str()) == Some(team_page_name)
            })
            .find(|team| kind_to_str(team.kind) == section)
            .cloned()
            .ok_or(TeamNotFound)?;

        // Don't show pages for subteams
        if let Some(subteam) = &main_team.subteam_of {
            // In the past we gave working groups their own dedicated pages linked
            // from the front page. We have now moved those working groups under
            // launching-pad, and the groups are listed as subteams of the launching
            // pad. To avoid breaking external links to things like
            // https://www.rust-lang.org/governance/wgs/wg-secure-code,
            // we still generate dedicated pages for these launching-pad teams,
            // but they are not linked from the main site.
            if !matches!(subteam.as_ref(), "launching-pad") {
                return Err(TeamNotFound.into());
            }
        }

        // Then find all the subteams, working groups and project groups.
        let mut raw_subteams = Vec::new();
        let mut wgs = Vec::new();
        let mut project_groups = Vec::new();
        let mut other_teams = Vec::new();

        let superteams: HashMap<_, _> = teams
            .iter()
            .filter_map(|team| Some((team.name.clone(), team.subteam_of.clone()?)))
            .collect();

        teams
            .into_iter()
            .filter(|team| team.website_data.is_some())
            .filter(|team| {
                // For teams find not only direct subteams but also transitive ones.
                let mut team = &team.name;

                // The graph of teams is guaranteed to be acyclic by the CI script of
                // the team repository. Therefore this loop has to terminate eventually.
                while let Some(superteam) = superteams.get(team) {
                    if superteam == &main_team.name {
                        return true;
                    }

                    team = superteam;
                }

                false
            })
            .for_each(|team| match team.kind {
                TeamKind::Team => raw_subteams.push(team),
                TeamKind::WorkingGroup => wgs.push(team),
                TeamKind::ProjectGroup => project_groups.push(team),
                TeamKind::MarkerTeam | TeamKind::Unknown => other_teams.push(team),
            });

        raw_subteams.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));
        wgs.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));
        project_groups.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));
        other_teams.sort_by_key(|team| Reverse(team.website_data.as_ref().unwrap().weight));

        // Lay out subteams according to their hierarchy.
        // Superteams come first and subteams come after, recursively.
        // The ordering of sibling teams is unaffected, they remain sorted first by weight, then
        // alphabetically if we assume that the Team API serves the teams alphabetically.
        let mut subteams = Vec::with_capacity(raw_subteams.len());
        lay_out_subteams_hierarchically(&mut subteams, None, &main_team.name, &raw_subteams);

        fn lay_out_subteams_hierarchically(
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

        fn sort_members(members: &mut [TeamMember]) {
            members.sort_by_key(|member| member.github.to_lowercase());
            members.sort_by(|a, b| {
                // First, sort by lead status (lead before non-lead)
                if a.is_lead != b.is_lead {
                    b.is_lead.cmp(&a.is_lead)
                } else if a.roles.len() != b.roles.len() {
                    // Then by role count (more roles before less roles)
                    b.roles.len().cmp(&a.roles.len())
                } else {
                    // Then by the role contents
                    // If there is no role, will return equal, and thus use the original GitHub username
                    // ordering
                    a.roles.cmp(&b.roles)
                }
            });
        }

        fn sort_team_members(team: &mut Team) {
            sort_members(&mut team.members);
            sort_members(&mut team.alumni);
        }

        fn sort_teams(teams: &mut [Team]) {
            for team in teams {
                sort_team_members(team);
            }
        }

        sort_team_members(&mut main_team);
        sort_teams(&mut subteams);
        sort_teams(&mut wgs);
        sort_teams(&mut project_groups);
        sort_teams(&mut other_teams);

        Ok(PageData {
            team: main_team,
            zulip_domain: crate::ZULIP_DOMAIN,
            subteams,
            wgs,
            project_groups,
            other_teams,
        })
    }

    pub fn archived_teams(&self) -> ArchivedTeams {
        let mut teams: Vec<Team> = self.archived_teams.clone();
        teams.sort_by_key(|t| {
            let weight = t.website_data.as_ref().map(|d| d.weight).unwrap_or(0);
            (Reverse(weight), t.name.clone())
        });

        ArchivedTeams { teams }
    }

    pub fn all_team_members(&self) -> AllTeamMembers {
        let mut alumni = HashMap::new();
        let mut active = HashMap::new();
        for team in &self.archived_teams {
            alumni.extend(team.members.iter().map(|m| (m.github_id, m)));
            alumni.extend(team.alumni.iter().map(|m| (m.github_id, m)));
        }
        for team in &self.teams {
            if is_active_team(team) {
                alumni.extend(team.alumni.iter().map(|m| (m.github_id, m)));
                active.extend(team.members.iter().map(|m| (m.github_id, m)));
            }
        }

        alumni.retain(|id, _| !active.contains_key(id));

        let alumni = {
            let mut alumni = alumni.into_values().cloned().collect::<Vec<TeamMember>>();
            alumni.sort_by_key(|m| m.name.clone());
            alumni
        };
        let active = {
            let mut active = active.into_values().cloned().collect::<Vec<TeamMember>>();
            active.sort_by_key(|m| m.name.clone());
            active
        };

        AllTeamMembers { active, alumni }
    }

    pub fn all_person_data(&self) -> Vec<PersonData> {
        let mut people: HashMap<String, PersonData> = HashMap::new();

        enum TeamMode {
            Member,
            Alumni,
            MemberOfArchivedTeam,
        }

        fn add_team(
            people: &mut HashMap<String, PersonData>,
            ctx: &RustTeamData,
            member: &TeamMember,
            team: &Team,
            mode: TeamMode,
        ) {
            let person_team_data = ctx
                .people
                .get(&member.github)
                .unwrap_or_else(|| panic!("Person {} not found in people.json", member.github));
            let person = people
                .entry(member.github.clone())
                .or_insert_with(move || PersonData {
                    name: member.name.clone(),
                    github: member.github.clone(),
                    github_sponsors: person_team_data.github_sponsors,
                    active_teams: vec![],
                    alumni_teams: vec![],
                });
            let teams = match mode {
                TeamMode::Member => &mut person.active_teams,
                TeamMode::Alumni | TeamMode::MemberOfArchivedTeam => &mut person.alumni_teams,
            };
            let url = match mode {
                TeamMode::Member | TeamMode::Alumni => ctx.get_toplevel_team_url(team),
                TeamMode::MemberOfArchivedTeam => Some("archived-teams.html".to_string()),
            };
            teams.push(PersonTeam::new(team, member, url));
        }

        for team in &self.archived_teams {
            for member in team.members.iter().chain(&team.alumni) {
                add_team(
                    &mut people,
                    self,
                    member,
                    team,
                    TeamMode::MemberOfArchivedTeam,
                );
            }
        }
        for team in &self.teams {
            if is_active_team(team) {
                for member in &team.members {
                    add_team(&mut people, self, member, team, TeamMode::Member);
                }
                for member in &team.alumni {
                    add_team(&mut people, self, member, team, TeamMode::Alumni);
                }
            }
        }

        let mut people: Vec<PersonData> = people.into_values().collect();
        people.sort_by(|a, b| a.github.cmp(&b.github));

        for person in &mut people {
            person
                .active_teams
                .sort_by(|a, b| a.webpage_name.cmp(&b.webpage_name));
            person
                .alumni_teams
                .sort_by(|a, b| a.webpage_name.cmp(&b.webpage_name));
        }

        people
    }

    pub fn funding_data(&self, all_team_members: &AllTeamMembers) -> FundingData {
        let people_with_sponsors = all_team_members
            .active
            .iter()
            .filter_map(|member| {
                let person = self.people.get(&member.github)?;
                if person.github_sponsors {
                    Some(FundablePerson {
                        name: member.name.clone(),
                        github: member.github.to_string(),
                    })
                } else {
                    None
                }
            })
            .collect();
        FundingData {
            people: people_with_sponsors,
        }
    }

    fn get_toplevel_team_url<'a>(&'a self, mut team: &'a Team) -> Option<String> {
        while !is_toplevel_team(team) {
            let Some(parent) = &team.subteam_of else {
                return None;
            };
            let parent = self.teams.iter().find(|t| t.name == *parent)?;
            team = parent;
        }

        if team.website_data.is_some() {
            Some(get_team_relative_url(team))
        } else {
            None
        }
    }
}

/// Is this a team for which we should display its members on the "All Project Members" page,
/// and whose members should receive a separate person page?
fn is_active_team(team: &Team) -> bool {
    if team.kind == TeamKind::MarkerTeam && team.website_data.is_none() {
        return false;
    }
    true
}

/// Get a relative URL of a team that should be appended to
/// Should only be used for top-level teams.
fn get_team_relative_url(team: &Team) -> String {
    assert!(is_toplevel_team(team));
    format!(
        "{}/{}",
        kind_to_str(team.kind),
        team.website_data.as_ref().unwrap().page
    )
}

fn is_toplevel_team(team: &Team) -> bool {
    team.kind == TeamKind::Team && team.subteam_of.is_none()
}

#[derive(Serialize)]
pub struct IndexData {
    pub teams: Vec<IndexTeam>,
}

#[derive(Serialize, Debug)]
pub struct IndexTeam {
    #[serde(flatten)]
    pub team: Team,
    pub url: String,
    pub section: &'static str,
    pub page_name: String,
}

#[derive(Serialize)]
pub struct PageData {
    team: Team,
    zulip_domain: &'static str,
    subteams: Vec<Team>,
    wgs: Vec<Team>,
    project_groups: Vec<Team>,
    // Marker teams and other kinds of groups that have a website entry
    other_teams: Vec<Team>,
}

#[derive(Serialize)]
pub struct ArchivedTeams {
    teams: Vec<Team>,
}

#[derive(Serialize)]
pub struct AllTeamMembers {
    active: Vec<TeamMember>,
    alumni: Vec<TeamMember>,
}

#[derive(Serialize)]
pub struct PersonTeam {
    team: Team,
    toplevel_url: Option<String>,
    webpage_name: String,
    roles: Vec<String>,
}

impl PersonTeam {
    fn new(team: &Team, member: &TeamMember, toplevel_url: Option<String>) -> Self {
        // Turn inside-rust-reviewers into Inside Rust Reviewers
        let normalize_name = |name: &str| {
            name.split("-")
                .map(|p| {
                    p.chars()
                        .take(1)
                        .flat_map(|c| c.to_uppercase())
                        .chain(p.chars().skip(1))
                        .collect::<String>()
                })
                .collect::<Vec<String>>()
                .join(" ")
        };

        let webpage_name = team
            .website_data
            .as_ref()
            .map(|w| w.name.clone())
            .unwrap_or_else(|| normalize_name(&team.name));

        let mut roles = vec![];
        if member.is_lead {
            roles.push("Lead".to_string());
        }
        roles.extend(member.roles.iter().map(|r| normalize_name(r)));
        Self {
            team: team.clone(),
            toplevel_url,
            webpage_name,
            roles,
        }
    }
}

#[derive(Serialize)]
pub struct PersonData {
    name: String,
    pub github: String,
    github_sponsors: bool,
    active_teams: Vec<PersonTeam>,
    alumni_teams: Vec<PersonTeam>,
}

#[derive(Serialize)]
pub struct FundablePerson {
    name: String,
    github: String,
}

#[derive(Serialize)]
pub struct FundingData {
    pub people: Vec<FundablePerson>,
}

pub fn load_rust_teams() -> anyhow::Result<RustTeamData> {
    println!("Downloading Team API data");

    // Parallelize the download to make website build faster
    let (teams, archived_teams, people) = std::thread::scope(|scope| {
        let teams = scope.spawn(|| -> anyhow::Result<Teams> {
            let response = fetch(&format!("{BASE_URL}/teams.json"))?;
            Ok(serde_json::from_str(&response)?)
        });
        let archived_teams = scope.spawn(|| -> anyhow::Result<Teams> {
            let response = fetch(&format!("{BASE_URL}/archived-teams.json"))?;
            Ok(serde_json::from_str(&response)?)
        });
        let people = scope.spawn(|| -> anyhow::Result<People> {
            let response = fetch(&format!("{BASE_URL}/people.json"))?;
            Ok(serde_json::from_str(&response)?)
        });
        (
            teams.join().unwrap(),
            archived_teams.join().unwrap(),
            people.join().unwrap(),
        )
    });
    let (teams, archived_teams, people) = (teams?, archived_teams?, people?);

    Ok(RustTeamData {
        teams: teams.teams.into_values().collect(),
        archived_teams: archived_teams.teams.into_values().collect(),
        people: people.people.into_iter().collect(),
    })
}

pub(crate) fn kind_to_str(kind: TeamKind) -> &'static str {
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
    use super::{RustTeamData, TeamNotFound};
    use rust_team_data::v1::{Team, TeamKind, TeamMember, TeamWebsite};

    fn dummy_team(name: &str) -> Team {
        Team {
            name: name.into(),
            kind: TeamKind::Team,
            subteam_of: None,
            members: vec![
                TeamMember {
                    name: "Jupiter Doe".into(),
                    github: "jupiterd".into(),
                    github_id: 123,
                    is_lead: false,
                    roles: vec!["convener".to_owned()],
                },
                TeamMember {
                    name: "John Doe".into(),
                    github: "johnd".into(),
                    github_id: 456,
                    is_lead: false,
                    roles: Vec::new(),
                },
                TeamMember {
                    name: "Jane Doe".into(),
                    github: "janed".into(),
                    github_id: 789,
                    is_lead: true,
                    roles: Vec::new(),
                },
            ],
            alumni: Vec::new(),
            website_data: Some(TeamWebsite {
                name: format!("Team {name}"),
                description: format!("Description of {name}"),
                page: name.into(),
                email: None,
                repo: None,
                zulip_stream: None,
                weight: 0,
                matrix_room: None,
            }),
            roles: Vec::new(),
            github: None,
            top_level: None,
        }
    }

    #[test]
    fn test_index_data() {
        let mut foo = dummy_team("foo");
        foo.kind = TeamKind::WorkingGroup;
        let data = RustTeamData::dummy(vec![foo, dummy_team("bar")]);

        let res = data.index_data();
        assert_eq!(res.teams.len(), 1);
        assert_eq!(res.teams[0].url, "teams/bar");
        assert_eq!(res.teams[0].team.name, "bar");
    }

    #[test]
    fn test_index_subteams_are_hidden() {
        let mut foo = dummy_team("foo");
        foo.subteam_of = Some(String::new());
        let data = RustTeamData::dummy(vec![foo]);

        assert_eq!(data.index_data().teams.len(), 0);
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

        let data = RustTeamData::dummy(vec![
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
        let data = RustTeamData::dummy(vec![foo, bar]);

        assert!(
            data.clone()
                .page_data("teams", "unknown")
                .err()
                .unwrap()
                .is::<TeamNotFound>()
        );
        assert!(
            data.clone()
                .page_data("wgs", "foo")
                .err()
                .unwrap()
                .is::<TeamNotFound>()
        );
        assert!(
            data.page_data("teams", "bar")
                .err()
                .unwrap()
                .is::<TeamNotFound>()
        );
    }

    #[test]
    fn test_subteams_cant_be_loaded() {
        let mut foo = dummy_team("foo");
        foo.subteam_of = Some("bar".into());
        let data = RustTeamData::dummy(vec![foo, dummy_team("bar")]);

        assert!(
            data.page_data("teams", "foo")
                .err()
                .unwrap()
                .is::<TeamNotFound>()
        );
    }
}

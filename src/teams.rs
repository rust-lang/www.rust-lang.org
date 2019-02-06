use reqwest;
use rust_team_data::v1::{Team, TeamKind, Teams, BASE_URL};
use std::any::Any;
use std::error::Error;
use std::fmt;

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
    subteams: Vec<Team>,
    wgs: Vec<Team>,
}

struct Data {
    teams: Vec<Team>,
}

impl Data {
    fn load() -> Result<Self, Box<Error>> {
        Ok(Data {
            teams: crate::cache::get::<Vec<Team>>(get_teams)?,
        })
    }

    #[cfg(test)]
    fn dummy(teams: Vec<Team>) -> Self {
        Data { teams }
    }

    fn index_data(self) -> Result<IndexData, Box<Error>> {
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
            });

        data.teams
            .sort_by_key(|team| -team.team.website_data.as_ref().unwrap().weight);
        data.wgs
            .sort_by_key(|team| -team.team.website_data.as_ref().unwrap().weight);
        Ok(data)
    }

    pub fn page_data(self, section: &str, team_name: &str) -> Result<PageData, Box<Error>> {
        // Find the main team first
        let main_team = self.teams
            .iter()
            .filter(|team| team.website_data.as_ref().map(|ws| ws.page.as_str()) == Some(team_name))
            .filter(|team| kind_to_str(team.kind) == section)
            .next()
            .cloned()
            .ok_or(TeamNotFound)?;

        // Don't show pages for subteams
        if main_team.subteam_of.is_some() {
            return Err(TeamNotFound.into());
        }

        // Then find all the subteams and wgs
        let mut subteams = Vec::new();
        let mut wgs = Vec::new();
        self.teams
            .into_iter()
            .filter(|team| team.website_data.is_some())
            .filter(|team| team.subteam_of.as_ref() == Some(&main_team.name))
            .for_each(|team| match team.kind {
                TeamKind::Team => subteams.push(team),
                TeamKind::WorkingGroup => wgs.push(team),
            });

        Ok(PageData {
            team: main_team,
            subteams,
            wgs,
        })
    }
}

pub fn index_data() -> Result<IndexData, Box<Error>> {
    Data::load()?.index_data()
}

pub fn page_data(section: &str, team_name: &str) -> Result<PageData, Box<Error>> {
    Data::load()?.page_data(section, team_name)
}

fn get_teams() -> Result<Box<Any>, Box<Error>> {
    let resp: Teams = reqwest::get(&format!("{}/teams.json", BASE_URL))?
        .error_for_status()?
        .json()?;

    Ok(Box::new(
        resp.teams
            .into_iter()
            .map(|(_key, value)| value)
            .collect::<Vec<Team>>(),
    ))
}

fn kind_to_str(kind: TeamKind) -> &'static str {
    match kind {
        TeamKind::Team => "teams",
        TeamKind::WorkingGroup => "wgs",
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
    use rust_team_data::v1::{Team, TeamKind, TeamMember, TeamWebsite};
    use super::{Data, TeamNotFound};

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
                },
                TeamMember {
                    name: "Jane Doe".into(),
                    github: "janed".into(),
                    is_lead: true,
                },
            ],
            website_data: Some(TeamWebsite {
                name: format!("Team {}", name),
                description: format!("Description of {}", name),
                page: name.into(),
                email: None,
                repo: None,
                discord: None,
                weight: 0,
            }),
        }
    }

    #[test]
    fn test_subteams_cant_be_loaded() {
        let mut foo = dummy_team("foo");
        foo.subteam_of = Some("bar".into());
        let data = Data::dummy(vec![foo, dummy_team("bar")]);

        assert!(data.page_data("teams", "foo").err().unwrap().is::<TeamNotFound>());
    }
}

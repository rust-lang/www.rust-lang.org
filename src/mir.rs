use crate::teams::RustTeamData;
use serde::Serialize;

#[derive(Serialize)]
#[serde(rename_all = "kebab-case")]
#[allow(unused)]
pub enum MirRole {
    FullTime,
    PartTime,
    Grant,
}

#[derive(Serialize)]
pub struct FundedMaintainer<'a> {
    name: String,
    login: &'a str,
    teams: String,
    note: String,
    role: String,
    // UI variables
    login_differs_from_name: bool,
}

impl<'a> FundedMaintainer<'a> {
    fn new(
        team_data: &'a RustTeamData,
        login: &'a str,
        teams: &[&'a str],
        role: MirRole,
        note: &str,
    ) -> Self {
        let person = team_data
            .people
            .get(login)
            .unwrap_or_else(|| panic!("MiR {login} not found in the team DB"));
        for team in teams {
            assert!(
                team_data.teams.iter().any(|t| t.name == *team),
                "Team {team} not found"
            );
        }

        let login_differs_from_name = person.name != login;
        Self {
            login,
            name: person.name.clone(),
            teams: teams.join(", "),
            role: match role {
                MirRole::FullTime => "Full-time Maintainer in Residence",
                MirRole::PartTime => "Part-time Maintainer in Residence",
                MirRole::Grant => "Maintainer grant",
            }
            .to_string(),
            note: note.to_string(),
            login_differs_from_name,
        }
    }
}

#[derive(Serialize)]
pub struct MirPageData<'a> {
    pub mirs: Vec<FundedMaintainer<'a>>,
    pub grants: Vec<FundedMaintainer<'a>>,
}

impl<'a> MirPageData<'a> {
    /// This function defines the current cohort of Maintainers in Residence
    /// and Maintainer grants.
    pub fn build(team_data: &'a RustTeamData) -> Self {
        let mirs = vec![FundedMaintainer::new(
            team_data,
            "LoriLorusso",
            &["all"],
            MirRole::FullTime,
            r#"
Lori Lorusso works as a full-time Rust Foundation employee.
"#,
        )];
        Self {
            mirs,
            grants: vec![FundedMaintainer::new(
                team_data,
                "LoriLorusso",
                &["all"],
                MirRole::Grant,
                r#"
Lori Lorusso works as a full-time Rust Foundation maintainer grantee.
"#,
            )],
        }
    }
}

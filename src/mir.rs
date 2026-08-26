use crate::teams::RustTeamData;
use serde::Serialize;

#[derive(Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum MirRole {
    FullTime,
    HalfTime,
    Grant,
}

#[derive(Serialize)]
pub struct FundedMaintainer<'a> {
    name: String,
    login: &'a str,
    teams: Vec<&'a str>,
    note: String,
    role: String,
    role_typed: MirRole,
    photo: Option<String>,
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

        Self {
            login,
            name: person.name.clone(),
            teams: teams.to_vec(),
            role: match role {
                MirRole::FullTime => "Full-time Maintainer in Residence",
                MirRole::HalfTime => "Half-time Maintainer in Residence",
                MirRole::Grant => "Maintainer grant",
            }
            .to_string(),
            role_typed: role,
            photo: None,
            note: note.to_string(),
        }
    }

    /// Use a custom photo (rather than the GitHub profile picture) for this maintainer.
    /// The photo should be stored in `static/images/mir/<path>`.
    fn with_photo(self, path: &str) -> Self {
        Self {
            photo: Some(path.to_string()),
            ..self
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
        // MiRs
        let rami3l = FundedMaintainer::new(
            team_data,
            "rami3l",
            &["rustup"],
            MirRole::FullTime,
            r#"
rami3l has been a member of the Rustup team since 2023, and its lead since 2025. He deeply cares about developer tooling, and the facets of Rust that many might take for granted. In addition to maintaining the Rustup tool, he also introduces new contributors to the Rustup team, and has mentored two Google Summer of Code projects, in 2025 and 2026.
"#,
        );
        let chris = FundedMaintainer::new(
            team_data,
            "ChrisDenton",
            &["libs", "compiler", "rustup"],
            MirRole::HalfTime,
            r#"
Chris has deep knowledge of Windows, and provides his expertise while maintaining the standard library, the Rust compiler, and also the Rustup tool.
        "#,
        );
        let alejandra = FundedMaintainer::new(
            team_data,
            "blyxyas",
            &["clippy"],
            MirRole::HalfTime,
            r#"
Alejandra has been a member of the Clippy team since 2023. She focuses on improving the performance of the Clippy linter and the Rust compiler, and also reviewing pull requests in the Clippy repository. In addition, she mentors Clippy contributors.
        "#,
        )
        .with_photo("alejandra-gonzalez.jpg");
        let fmease = FundedMaintainer::new(
            team_data,
            "fmease",
            &["rustdoc", "compiler"],
            MirRole::HalfTime,
            r#"
León has been a member of the rustdoc team since 2023. He works on several complex long-term refactors and improvements to the Rust type system, and he is also helping out with general maintenance of the Rust compiler and the rustdoc documentation generator.
        "#,
        )
        .with_photo("leon-liehr.jpg");

        // Grants
        let joboet = FundedMaintainer::new(
            team_data,
            "joboet",
            &["libs"],
            MirRole::Grant,
            r#"
Jonas has been a member of the libs-contributors team since 2024. He reviews changes to the Rust standard library, in areas such as data structures, synchronization primitives or platform-specific code.
"#,
        ).with_photo("jonas-boettiger.jpg");
        let jarcho = FundedMaintainer::new(
            team_data,
            "Jarcho",
            &["clippy"],
            MirRole::Grant,
            r#"
Jason has been a member of the Clippy team since 2022. He is performing general maintenance of the Clippy linter.
"#,
        ).with_photo("jason-newcomb.jpg");

        let mut mirs = vec![rami3l, chris, alejandra, fmease];
        mirs.sort_by_key(|mir| match mir.role_typed {
            MirRole::FullTime => 0,
            MirRole::HalfTime => 1,
            MirRole::Grant => 2,
        });
        let grants = vec![joboet, jarcho];
        Self { mirs, grants }
    }
}

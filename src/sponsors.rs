use crate::i18n::create_loader;
use handlebars_fluent::loader::Loader;
use rand::seq::SliceRandom;
use std::error::Error;

static SPONSORS_YML_PATH: &str = "src/data/sponsors.yml";

lazy_static! {
    static ref SPONSORS: Vec<Sponsor> = load_sponsors(SPONSORS_YML_PATH).unwrap();
}

#[derive(Deserialize)]
#[serde(rename_all = "kebab-case")]
struct Sponsor {
    id: String,
    name: String,
    logo_format: Option<String>,
    #[serde(default)]
    vertical_logo: bool,
}

fn load_sponsors(path: &str) -> Result<Vec<Sponsor>, Box<dyn Error>> {
    Ok(serde_yaml::from_str(&std::fs::read_to_string(path)?)?)
}

#[derive(Serialize)]
pub(crate) struct RenderSponsor {
    name: &'static str,
    is_not_first: bool,
    logo_path: String,
    logo_alt_i18n: String,
    description_i18n: String,
    vertical_logo: bool,
}

pub(crate) fn render_data(lang: &str) -> Vec<RenderSponsor> {
    let i18n = create_loader();

    let mut sponsors = SPONSORS
        .iter()
        .map(|s| RenderSponsor {
            name: &s.name,
            is_not_first: true, // Will be changed later
            logo_path: format!(
                "/static/images/sponsor-logos/{}.{}",
                s.id,
                s.logo_format.as_ref().map(|s| s.as_str()).unwrap_or("svg")
            ),
            logo_alt_i18n: i18n.lookup(lang, &format!("sponsors-{}-alt", s.id), None),
            description_i18n: i18n.lookup(lang, &format!("sponsors-{}", s.id), None),
            vertical_logo: s.vertical_logo,
        })
        .collect::<Vec<_>>();

    sponsors.shuffle(&mut rand::thread_rng());

    sponsors
        .iter_mut()
        .enumerate()
        .for_each(|(i, s)| s.is_not_first = i != 0);

    sponsors
}

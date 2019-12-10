use crate::i18n::I18NHelper;
use rand::seq::SliceRandom;
use std::error::Error;

static SPONSORS_YML_PATH: &str = "src/data/sponsors.yml";

lazy_static! {
    static ref SPONSORS: Vec<Sponsor> = load_sponsors(SPONSORS_YML_PATH).unwrap();
}

#[derive(Deserialize)]
struct Sponsor {
    id: String,
    name: String,
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
}

pub(crate) fn render_data(lang: &str) -> Vec<RenderSponsor> {
    let i18n = I18NHelper::new();

    let mut sponsors = SPONSORS
        .iter()
        .map(|s| RenderSponsor {
            name: &s.name,
            is_not_first: true, // Will be changed later
            logo_path: format!("/static/images/sponsor-logos/{}.png", s.id),
            logo_alt_i18n: i18n.lookup(lang, &format!("sponsors-{}-alt", s.id), None),
            description_i18n: i18n.lookup(lang, &format!("sponsors-{}", s.id), None),
        })
        .collect::<Vec<_>>();

    sponsors.shuffle(&mut rand::thread_rng());

    sponsors
        .iter_mut()
        .enumerate()
        .for_each(|(i, s)| s.is_not_first = i != 0);

    sponsors
}

use time::{OffsetDateTime, format_description::well_known::Rfc3339};

static TEXT: &str = include_str!("../static/text/well_known_security.txt");

#[test]
fn well_known_security_is_not_about_to_expire() {
    let expires = TEXT.split("Expires:").nth(1).unwrap().trim();
    let expires = OffsetDateTime::parse(expires, &Rfc3339).unwrap();
    let one_month_from_now = OffsetDateTime::now_utc() + time::Duration::days(30);
    assert!(
        one_month_from_now < expires,
        "
        ┌────────────────────────────────────────────────────────────────┐
        │                                                                │
        │  I looks like the expiration date of the security policy needs │
        │  updating. Before blindly updating it, please make sure the    │
        │  pointed-to URL still refers to the source of truth of the     │
        │  security policy of the Rust project. If all is well, you can  │
        │  update the expiration date in the relevant file:              │
        │                                                                │
        │  static/text/well_known_security.txt                           │
        │                                                                │
        └────────────────────────────────────────────────────────────────┘
        "
    );
}

#[test]
fn well_known_security_expires_within_a_year() {
    let expires = TEXT.split("Expires:").nth(1).unwrap().trim();
    let expires = OffsetDateTime::parse(expires, &Rfc3339).unwrap();
    let one_year_from_now = OffsetDateTime::now_utc() + time::Duration::days(370);
    assert!(
        expires < one_year_from_now,
        "The security policy should be checked once a year, please reduce the expiration date."
    );
}

use time::{format_description::well_known::Rfc3339, OffsetDateTime};

#[test]
fn well_known_security_is_not_expired() {
    let text = include_str!("../static/text/well_known_security.txt");
    let expires = text.split("Expires:").nth(1).unwrap().trim();
    let expires = OffsetDateTime::parse(expires, &Rfc3339).unwrap();
    let now = OffsetDateTime::now_utc();
    assert!(
        now < expires,
        "
        ┌────────────────────────────────────────────────────────────────┐
        │                                                                │
        │  I looks like the expiration date of the security policy has   │
        │  passed. Before blindly updating it, please make sure the      │
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

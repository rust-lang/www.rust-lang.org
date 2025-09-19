# Contributing

A large open source website is a difficult thing to manage. This document
explains much of the process that we use to contribute. Thank you for your
interest in contributing to Rust!

**tl;dr: Always file an issue first.**

## Design and Content

Design and content are complicated thing, and many folks have lots of polarizing
feels about it. For the moment, large design changes are made exclusively by the
team (listed above). If you have concerns or thoughts for small changes, please
file an issue so that we can discuss it first!

### Content

The content is largely owned by the associated team or working group. If you
have thoughts, it can be useful to discuss those with the lead(s) of those
groups. You can learn more about the teams and working groups on the Governance
page of the site.

We are currently pausing new company listings for the 'Production' page while
we figure out a better process for it.

## Development

Before filing a PR to the site, please file an issue. This way we can ensure
that the work you are doing meets the requirements of the site and will be very
likely merged. If you file a PR before an issue, you will likely be asked to
file an issue, or your PR may be closed outright.

## Manual testing checklist

Sometimes changes are made which could potentially affect any page, e.g. updating the templating library.
In that case it's necessary to manually check (almost) every page for obvious regressions before deploying the update.
To facilitate that, here's a list of links.
Note that like all documentation, this list may become outdated over time.
So stay vigilant and update it if you notice something missing.

<!-- index -->
- https://www.rust-lang.org/
<!-- category_en -->
- https://www.rust-lang.org/community
- https://www.rust-lang.org/learn
- https://www.rust-lang.org/policies
- https://www.rust-lang.org/production
- https://www.rust-lang.org/tools
- https://www.rust-lang.org/what
<!-- governance -->
- https://www.rust-lang.org/governance
<!-- team -->
- https://www.rust-lang.org/governance/teams/leadership-council
- https://www.rust-lang.org/governance/wgs/wg-async
<!-- subject -->
- https://www.rust-lang.org/learn/get-started
- https://www.rust-lang.org/policies/code-of-conduct
- https://www.rust-lang.org/policies/licenses
- https://www.rust-lang.org/policies/security
- https://www.rust-lang.org/tools/install
- https://www.rust-lang.org/what/cli
- https://www.rust-lang.org/what/embedded
- https://www.rust-lang.org/what/networking
- https://www.rust-lang.org/what/wasm
<!-- files -->
- https://www.rust-lang.org/static/images/rust-logo-blk.png
<!-- robots_txt -->
- https://www.rust-lang.org/robots.txt
<!-- logos -->
- https://www.rust-lang.org/static/logos/cargo.png
<!-- index_locale -->
- https://www.rust-lang.org/es
<!-- category_locale -->
- https://www.rust-lang.org/es/community
- https://www.rust-lang.org/es/learn
- https://www.rust-lang.org/es/policies
- https://www.rust-lang.org/es/production
- https://www.rust-lang.org/es/tools
- https://www.rust-lang.org/es/what
<!-- governance_locale -->
- https://www.rust-lang.org/es/governance
<!-- team_locale -->
- https://www.rust-lang.org/es/governance/teams/leadership-council
- https://www.rust-lang.org/es/governance/wgs/wg-async
<!-- subject_locale -->
- https://www.rust-lang.org/es/learn/get-started
- https://www.rust-lang.org/es/policies/code-of-conduct
- https://www.rust-lang.org/es/policies/licenses
- https://www.rust-lang.org/es/policies/security
- https://www.rust-lang.org/es/tools/install
- https://www.rust-lang.org/es/what/cli
- https://www.rust-lang.org/es/what/embedded
- https://www.rust-lang.org/es/what/networking
- https://www.rust-lang.org/es/what/wasm
<!-- redirect_bare_en_us -->
- https://www.rust-lang.org/en-US
<!-- not_found catcher, see redirect::maybe_redirect -->
<!-- static file redirects -->
- https://www.rust-lang.org/pdfs/Rust-npm-Whitepaper.pdf
- https://www.rust-lang.org/pdfs/Rust-Tilde-Whitepaper.pdf
<!-- external redirects -->
- https://www.rust-lang.org/other-installers.html
- https://www.rust-lang.org/policies/privacy
- https://www.rust-lang.org/policies/media-guide
- https://www.rust-lang.org/sponsors
<!-- page redirects -->
- https://www.rust-lang.org/community.html
- https://www.rust-lang.org/conduct.html
- https://www.rust-lang.org/contribute-bugs.html
- https://www.rust-lang.org/contribute-community.html
- https://www.rust-lang.org/contribute-compiler.html
- https://www.rust-lang.org/contribute-docs.html
- https://www.rust-lang.org/contribute-libs.html
- https://www.rust-lang.org/contribute-tools.html
- https://www.rust-lang.org/contribute.html
- https://www.rust-lang.org/documentation.html
- https://www.rust-lang.org/downloads.html
- https://www.rust-lang.org/friends.html
- https://www.rust-lang.org/index.html
- https://www.rust-lang.org/install.html
- https://www.rust-lang.org/legal.html
- https://www.rust-lang.org/security.html
- https://www.rust-lang.org/team.html
- https://www.rust-lang.org/user-groups.html
- https://www.rust-lang.org/governance/teams/release
- https://www.rust-lang.org/governance/teams/crates-io
- https://www.rust-lang.org/governance/teams
- https://www.rust-lang.org/governance/wgs
<!-- a couple localized redirects -->
- https://www.rust-lang.org/es-ES
- https://www.rust-lang.org/es-ES/contribute-compiler.html
- https://www.rust-lang.org/es-ES/governance/teams

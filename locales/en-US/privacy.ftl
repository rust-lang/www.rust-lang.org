### Translation file for page: https://www.rust-lang.org/policies/privacy

## templates/policies/privacy.hbs

policies-privacy-page-title = Rust Privacy Notice

policies-privacy-page-version =
    <p>Version { $version }, dated <time datetime="{ $date }">{ $date }</time></p>

policies-privacy-page-intro =
    <p>
      The Rust Project oversees a number of projects, including the
      <a href="{ $baseurl }/">Rust website</a>,
      <a href="https://crates.io">crates.io</a>, and
      <a href="https://docs.rs">docs.rs</a>. This privacy notice explains what
      we do with personal information.
    </p>

policies-privacy-page-rust-lang-org-desc =
    <p>
      The Rust website at <a href="{ $baseurl }/">rust-lang.org</a> is a project
      of the <a href="{ $baseurl }/governance/teams/core">Core team</a> and the
      <a href="{ $baseurl }/governance/teams/community">Community team.</a>
    </p>

    <dl>
      <dt>Visitor logs:</dt>
      <dd>
        When you visit rust-lang.org, we receive your IP address as part of
        our standard server logs. We store these logs for 1 year.
      </dd>
    </dl>

policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      <a href="https://crates.io">Crates.io</a> is managed by members of the
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a> and
      <a href="{ $baseurl }/governance/teams/core">Rust core</a> teams.
    </p>

    <dl>
      <dt>Logging in with GitHub:</dt>
      <dd>
        <p>
          Crates.io requires users to have a
          <a href="https://github.com">GitHub account</a>
          in order to log in and use the service. When you log in to Crates.io
          using a GitHub account, we receive your GitHub username and avatar. If
          you share a display name or public email address in your GitHub public
          profile, we also receive that information.
        </p>
      </dd>

      <dt>Email addresses:</dt>
      <dd>
        <p>
          You must have a verified email address to publish a crate. We receive
          any public email address associated with your GitHub account. You can
          also choose to submit a different address to associate with your
          Crates.io activity. We will only use your email address to contact you
          about your account.
        </p>
      </dd>

      <dt>Visitor logs:</dt>
      <dd>
        <p>
          When you visit Crates.io, we receive your IP address and user-agent
          header as part of our standard server logs. We store these logs for 1
          year.
        </p>
      </dd>

      <dt>Information uploaded to crates:</dt>
      <dd>
        <p>
          All crates on Crates.io are public, including the list of crate owners’
          user names and the crate upload date. Anyone may view or download a
          crate’s contents. Because of the public nature of Crates.io, any
          personal data you might include in a Cargo.toml file uploaded to
          a crate will be publicly available. For example, if an email address
          is in the `authors` field in the Cargo.toml file, that email address
          will also be public.
        </p>
        <p>
          Due to its public nature, be aware if you include any private
          information in a crate, that information may be indexed by search
          engines or used by third parties. Sensitive information should not be
          included in a crate file.
        </p>
      </dd>

      <dt>Publication of site-related data: </dt>
      <dd>
        <p>
          Crates.io uses the Google Visualization API to create graphs for each
          crate showing downloads over the last 90 days. Those graphs can be seen
          at the bottom of each crate’s page.
        </p>
      </dd>

      <dt>Error monitoring:</dt>
      <dd>
        <p>
          Crates.io uses Sentry, an error monitoring service, to help the Rust
          team discover and fix the performance of the code. When there is an
          error, Sentry receives basic information about how you interacted
          with the website and the actions that led to the error. Additionally,
          your IP address may be disclosed to Sentry as part of the error
          reporting process but we’ve configured Sentry to delete it as soon as
          it’s received. Read <a href="https://sentry.io/privacy/">Sentry’s
          Privacy Policy here</a>.
        </p>
      </dd>
    </dl>

policies-privacy-page-docs-rs-desc--2020-09 =
    <p>
      <a href="https://docs.rs">Docs.rs</a> is managed by the members of the
      <a href="{ $baseurl }/governance/teams/dev-tools#docs-rs">docs.rs team</a>
      and <a href="{ $baseurl }/governance/teams/core">Rust core team</a>.
    </p>

    <dl>
      <dt>Visitor logs:</dt>
      <dd>
        <p>
          When you visit docs.rs, we receive your IP address and user-agent
          header as part of our standard server logs. We store these logs for 1
          year.
        </p>
      </dd>
    </dl>

policies-privacy-page-forums-title = Forums
policies-privacy-page-forums-desc =
    <p>
      <a href="{ $baseurl }/governance/teams/community">The Rust Community team</a>
      administers the
      <a href="https://users.rust-lang.org">Users Forum</a> and the
      <a href="https://internals.rust-lang.org">Internals Forum</a>. Posts on
      these forums are public. If you sign up to participate in these forums, we
      collect your email address and name. As administrators of the forum, we
      have access to usage information regarding your interactions with it, such
      as posts published and read, and time spent on the site.
    </p>

policies-privacy-page-third-parties-title = Third-party Services
policies-privacy-page-third-parties-desc =
    <p>
      The Users Forum and Internals Forum on rust-lang.org are hosted by
      <a href="https://www.discourse.org/">Discourse</a> and use its open source
      discussion platform. Discourse’s privacy policy is available
      <a href="https://www.discourse.org/privacy">here</a>.
    </p>

    <p>
      We use Mailgun to send email. Mailgun’s privacy policy is available
      <a href="https://www.mailgun.com/privacy-policy">here</a>.
    </p>

    <p>
      GitHub login is used for authentication in Crates.io and (optionally) in
      the forums. GitHub’s Privacy Statement can be found
      <a href="https://help.github.com/en/articles/github-privacy-statement">here</a>.
    </p>

    <p>
      Some Rust team members use the Zulip and Discord platforms for
      community collaboration. Zulip’s privacy notice is available
      <a href="https://zulipchat.com/privacy/">here</a>.
      Discord’s privacy notice is available
      <a href="https://discordapp.com/privacy">here</a>.
    </p>

policies-privacy-page-contact-title = Contact
policies-privacy-page-contact-desc =
    <p>
      For data subject access requests, or any questions about this privacy
      notice, please email support at
      <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>
    </p>

    <p>Alternatively, you may contact us at:</p>

    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Security policy

security-reporting-heading = Reporting
security-reporting-link = email { ENGLISH("security@rust-lang.org") }
security-reporting-description--2022-01 =
        <p>Safety is one of the core principles of Rust, and to that end, we would like to ensure that Rust has a secure implementation. Thank you for taking the time to responsibly disclose any issues you find.</p>
        <p>All security bugs in the Rust distribution should be reported by email to { -security-at-rust-lang-org-anchor }. This list is delivered to a small security team. Your email will be acknowledged within 24 hours, and you’ll receive a more detailed response to your email within 48 hours indicating the next steps in handling your report. If you would like, you can encrypt your report using <a href="{ -rust-security-team-key-href }">our public key</a>. This key is also <a href="{ -rust-pgp-key-mit-keyserver-href }">On MIT’s keyserver</a> and <a href="#security-pgp-key">reproduced below</a>.</p>
        <p>This email address receives a large amount of spam, so be sure to use a descriptive subject line to avoid having your report be missed. After the initial reply to your report, the security team will endeavor to keep you informed of the progress being made towards a fix and full announcement. As recommended by <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>, these updates will be sent at least every five days. In reality, this is more likely to be every 24-48 hours.</p>
        <p>If you have not received a reply to your email within 48 hours, or have not heard from the security team for the past five days, there are a few steps you can take (in order):</p>
        <ul>
          <li>
            Contact both the security coordinators directly:
            <ul>
                <li>{ -security-coordinator-1-email-anchor }</li>
                <li>{ -security-coordinator-2-email-anchor }</li>
            </ul>
          </li>
          <li>Post on the <a href="{ -internals-rust-lang-org-href }">internals forums</a></li>
        </ul>
        <p>Please note that the discussion forums are public areas. When escalating in these venues, please do not discuss your issue. Simply say that you’re trying to get a hold of someone from the security team.</p>

security-scope-heading = Scope
security-scope--2025-04 =
        <p>The Rust Security Response WG handles vulnerability reports for everything maintained and published by the Rust Project:</p>
        <ul>
            <li>
                The following GitHub organizations, and all repositories and CI pipelines hosted in them:
                <ul>
                    <li><a href="https://github.com/rust-lang"><code>rust-lang</code></a></li>
                    <li><a href="https://github.com/rust-lang-ci"><code>rust-lang-ci</code></a></li>
                    <li><a href="https://github.com/rust-lang-nursery"><code>rust-lang-nursery</code></a></li>
                    <li><a href="https://github.com/rust-analyzer"><code>rust-analyzer</code></a></li>
                </ul>
            </li>
            <li>
                The following domain names, all their subdomains, and all applications hosted within:
                <ul>
                    <li><a href="http://rust-lang.org">rust-lang.org</a> (see exceptions below)</li>
                    <li><a href="http://rustup.rs">rustup.rs</a></li>
                    <li><a href="http://crates.io">crates.io</a> (see exceptions below)</li>
                    <li><a href="http://docs.rs">docs.rs</a></li>
                    <li><a href="http://rfcbot.rs">rfcbot.rs</a></li>
                </ul>
            </li>
            <li>All crates owned by <a href="https://crates.io/users/rust-lang-owner">@rust-lang-owner</a> on <a href="http://crates.io">crates.io</a>.</li>
            <li>All extensions in the Visual Studio Marketplace published by <a href="https://marketplace.visualstudio.com/publishers/rust-lang"><code>rust-lang</code></a>.</li>
            <li>All extensions in the Open VSX registry published by <a href="https://open-vsx.org/namespace/rust-lang"><code>rust-lang</code></a>.</li>
        </ul>
        <p>The following things are <strong>outside our scope</strong>:</p>
        <ul>
            <li>The <a href="http://internals.rust-lang.org">internals.rust-lang.org</a> and <a href="http://users.rust-lang.org">users.rust-lang.org</a> domains. Please follow <a href="https://github.com/discourse/discourse/blob/main/docs/SECURITY.md">Discourse's Security Policy</a> for it.</li>
            <li>Third-party packages published on <a href="http://crates.io">crates.io</a>. Please follow <a href="https://crates.io/security">crates.io's Security Policy</a> for them.</li>
        </ul>
        <p>When reporting vulnerabilities, keep in mind that:</p>
        <ul>
            <li>Unless otherwise noted, all components of the Rust toolchain (rustc, Cargo, rust-analyzer, or any other tool shipped through rustup) assume that the user's source code and dependencies are fully trusted, reviewed and contain no malicious code. We do not consider attacks caused by compiling or analyzing malicious projects or dependencies a security vulnerability.</li>
            <li>Soundness issues in the Rust compiler or language are not automatically classified as a security vulnerability, but will be analyzed on a case-by-case basis if reported.</li>
            <li>The <code>regex</code> crate <a href="https://docs.rs/regex/latest/regex/#untrusted-input">provides guarantees about untrusted patterns</a>. We consider denial of service with untrusted patterns a security vulnerability only if the time spent inside of the <code>regex</code> crate is not linear, and none of the <a href="https://docs.rs/regex/latest/regex/struct.RegexBuilder.html">limit methods in <code>RegexBuilder</code></a> are able to prevent the attack.</li>
        </ul>
        <p>If you have doubts on whether something falls within our scope, <a href="mailto:security@rust-lang.org">please reach out</a> and we will provide guidance.</p>

security-disclosure-heading = Disclosure policy
security-disclosure-description--2025-07 =
        <p>The Rust project has a 5 step disclosure process.</p>
        <ol>
          <li>The security report is received and is assigned a primary handler. This person will coordinate the fix and release process.</li>
          <li>The problem is confirmed and a list of all affected versions is determined.</li>
          <li>Code is audited to find any potential similar problems.</li>
          <li>Fixes are prepared for all supported release branches. These fixes are not committed to the public repository but rather held locally pending the announcement.</li>
          <li>On the embargo date, the <a href="{ -rustlang-security-announcements-google-groups-forum-href }"> Rust security mailing list</a> is sent a copy of the announcement. The changes are pushed to the public repository and the release process is started. Within 6 hours of the mailing list being notified, a copy of the advisory will be published on the Rust blog.</li>
        </ol>
        <p>This process can take some time, especially when coordination is required with maintainers of other projects. Every effort will be made to handle the bug in as timely a manner as possible, however it’s important that we follow the release process above to ensure that the disclosure is handled in a consistent manner.</p>

security-receiving-heading = Receiving security updates
security-receiving-description--2025-07 =
        <p>The best way to receive all the security announcements is to subscribe to the <a href="{ -rust-security-announcements-mailing-list-href }">Rust security announcements mailing list</a> (alternatively by sending an email to { -rustlang-security-announcements-subscribe-anchor }). The mailing list is very low traffic, and it receives the public notifications the moment the embargo is lifted.</p>
        <p>The Rust project only provides support and security updates for the most recent stable release and the latest releases in our <a href="{ -rust-security-supported-channels-href }">beta and nightly channels</a>. As Rust releases must be built in the public, we will begin the release process as soon as the embargo lifts, and a release blog post will be published once updated binaries are available for download.</p>
        <p>We will announce vulnerabilities 72 hours before the embargo is lifted to { -distros-openwall-email-anchor }, so that Linux distributions can update their packages.</p>

security-pgp-key-heading = Plaintext PGP key

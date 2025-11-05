### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = 安全政策
security-reporting-heading = 报告漏洞
security-reporting-link = 给 { ENGLISH("security@rust-lang.org") } 发邮件
security-reporting-description--2025-07 =
        <p>Safety is one of the core principles of Rust, and to that end, we would like to ensure that Rust has a secure implementation. Thank you for taking the time to responsibly disclose any issues you find.</p>
        <p>All security bugs in the Rust distribution should be reported by email to { -security-at-rust-lang-org-anchor }. This list is delivered to a small security team. Your email will be acknowledged within 24 hours, and you’ll receive a more detailed response to your email within 48 hours indicating the next steps in handling your report.</p>
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

security-disclosure-heading = 信息披露政策
security-disclosure-description =
    <p>Rust 项目有 5 步披露流程：</p>
    <ol>
      <li>收到安全报告后，将其分配给一位主要处理人。此人将协调修复和发布过程。</li>
      <li>确认问题并确定所有受影响版本。</li>
      <li>审核代码以发现任何潜在的类似问题。</li>
      <li>对所有仍在维护的版本准备修复程序。这些修复程序将不会推送到公共仓库，而是保留在本地，等待发布。</li>
      <li>过封锁期后，<a href="{ -rustlang-security-announcements-google-groups-forum-href }">Rust 安全邮件列表</a>将发布一份公告副本。这些更改会提交至公共仓库，更新后的程序将部署至 rust-lang.org。在收到通知邮件列表的 6 小时内，Rust 博客将发布该通报的副本。</li>
    </ol>
    <p>此过程可能需要一些时间，尤其是在需要与其他项目的维护人员进行协调时。我们将尽一切努力及时处理错误。但是，我们必须遵循上述发布流程，确保能够以一致的方式处理披露。</p>
security-receiving-heading = 接收安全更新
security-receiving-description =
    <p>接收所有安全公告的最佳方式是订阅 <a href="{ -rust-security-announcements-mailing-list-href }">Rust 安全公告邮件列表</a>（或发送电子邮件至 { -rustlang-security-announcements-subscribe-anchor }）。邮件列表的业务量很少，在封禁期过后它会马上收到公共通知。</p>
    <p>我们会在封禁期解除前的 72 小时内向 { -distros-openwall-email-anchor } 公布漏洞，以便于 Linux 发行版更新其软件包。</p>
security-pgp-key-heading = 明文 PGP 公钥

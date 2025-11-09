### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = 安全政策
security-reporting-heading = 报告漏洞
security-reporting-link = 给 { ENGLISH("security@rust-lang.org") } 发邮件
security-reporting-description--2025-07 =
        <p>安全性是 Rust 的核心原则之一，为此，我们希望确保 Rust 的实现是安全的。感谢您花时间负责任地披露您发现的任何问题。</p>
        <p>Rust 发行版中的所有安全漏洞都应通过电子邮件报告至 { -security-at-rust-lang-org-anchor }。此邮件列表会发送给一个小型安全团队。您的邮件将在 24 小时内收到确认回复，并在 48 小时内收到更详细的回复，说明处理您的报告的下一步措施。</p>
        <p>由于此电子邮件地址会收到大量垃圾邮件，请务必使用描述性主题行，以免您的报告被遗漏。在对您的报告进行初步回复后，安全团队将努力让您了解修复和完整公告的进展情况。根据 <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a> 的建议，这些更新至少每五天发送一次。实际上，这更可能是每 24-48 小时一次。</p>
        <p>如果您在 48 小时内未收到电子邮件回复，或者在过去五天内未收到安全团队的消息，您可以采取以下步骤（按顺序）：</p>
        <ul>
          <li>
            直接联系两位安全协调员：
            <ul>
                <li>{ -security-coordinator-1-email-anchor }</li>
                <li>{ -security-coordinator-2-email-anchor }</li>
            </ul>
          </li>
          <li>在 <a href="{ -internals-rust-lang-org-href }">internals 论坛</a> 上发帖</li>
        </ul>
        <p>请注意，讨论论坛是公共区域。在这些场所升级时，请勿讨论您的问题。只需说明您正在尝试联系安全团队的某人即可。</p>

security-scope-heading = 范围
security-scope--2025-04 =
        <p>Rust 安全响应工作组处理 Rust 项目维护和发布的所有内容的漏洞报告：</p>
        <ul>
            <li>
                以下 GitHub 组织及其所有仓库和 CI 管道：
                <ul>
                    <li><a href="https://github.com/rust-lang"><code>rust-lang</code></a></li>
                    <li><a href="https://github.com/rust-lang-ci"><code>rust-lang-ci</code></a></li>
                    <li><a href="https://github.com/rust-lang-nursery"><code>rust-lang-nursery</code></a></li>
                    <li><a href="https://github.com/rust-analyzer"><code>rust-analyzer</code></a></li>
                </ul>
            </li>
            <li>
                以下域名及其所有子域名，以及其中托管的所有应用程序：
                <ul>
                    <li><a href="http://rust-lang.org">rust-lang.org</a>（见下文例外情况）</li>
                    <li><a href="http://rustup.rs">rustup.rs</a></li>
                    <li><a href="http://crates.io">crates.io</a>（见下文例外情况）</li>
                    <li><a href="http://docs.rs">docs.rs</a></li>
                    <li><a href="http://rfcbot.rs">rfcbot.rs</a></li>
                </ul>
            </li>
            <li>在 <a href="https://crates.io">crates.io</a> 上由 <a href="https://crates.io/users/rust-lang-owner">@rust-lang-owner</a> 拥有的所有 crate。</li>
            <li>在 Visual Studio Marketplace 上由 <a href="https://marketplace.visualstudio.com/publishers/rust-lang"><code>rust-lang</code></a> 发布的所有扩展。</li>
            <li>在 Open VSX 注册表中由 <a href="https://open-vsx.org/namespace/rust-lang"><code>rust-lang</code></a> 发布的所有扩展。</li>
        </ul>
        <p>以下内容<strong>不在我们的范围内</strong>：</p>
        <ul>
            <li><a href="http://internals.rust-lang.org">internals.rust-lang.org</a> 和 <a href="http://users.rust-lang.org">users.rust-lang.org</a> 域名。请遵循 <a href="https://github.com/discourse/discourse/blob/main/docs/SECURITY.md">Discourse 的安全政策</a>。</li>
            <li>在 <a href="http://crates.io">crates.io</a> 上发布的第三方包。请遵循 <a href="https://crates.io/security">crates.io 的安全政策</a>。</li>
        </ul>
        <p>报告漏洞时，请记住：</p>
        <ul>
            <li>除非另有说明，Rust 工具链的所有组件（rustc、Cargo、rust-analyzer 或通过 rustup 提供的任何其他工具）假定用户的源代码和依赖项是完全可信的、经过审查且不包含恶意代码。因编译或分析恶意项目或依赖项而导致的攻击不属于我们考虑范围内的安全漏洞。</li>
            <li>Rust 编译器或语言中的健全性问题不会自动归类为安全漏洞，但如果报告，将根据具体情况进行分析。</li>
            <li><code>regex</code> crate <a href="https://docs.rs/regex/latest/regex/#untrusted-input">对不受信任的模式提供保证</a>。我们仅在 <code>regex</code> crate 内的时间不是线性时，且 <a href="https://docs.rs/regex/latest/regex/struct.RegexBuilder.html"><code>RegexBuilder</code> 中的限制方法</a>均无法防止攻击时，才将使用不受信任模式导致的拒绝服务视为安全漏洞。</li>
        </ul>
        <p>如果您对某些内容是否属于我们的范围有疑问，请<a href="mailto:security@rust-lang.org">联系我们</a>，我们将提供指导。</p>

security-disclosure-heading = 信息披露政策
security-disclosure-description--2025-07 =
        <p>Rust 项目有 5 步披露流程：</p>
        <ol>
          <li>收到安全报告后，将其分配给一位主要处理人。此人将协调修复和发布过程。</li>
          <li>确认问题并确定所有受影响的版本，并邀请相关 Rust 团队的领域专家参与。</li>
          <li>审核代码以发现任何潜在的类似问题。</li>
          <li>为所有受支持的发布分支准备修复程序，并保留 CVE 编号。这些修复程序不会提交到公共仓库，而是保存在私有仓库中，等待公告发布。这些修复程序会使用与公共更改相同的审查流程进行私下审查。</li>
          <li>在封禁日期，公告的副本会发送到 <a href="{ -rustlang-security-announcements-google-groups-forum-href }">Rust 安全邮件列表</a> 并发布在 Rust 博客上。这些更改会推送到公共仓库，并启动发布流程。在一小时内，CVE 数据库中会发布完整的详细信息。</li>
        </ol>
    <p>此过程可能需要一些时间，尤其是在需要与其他项目的维护人员进行协调时。我们将尽一切努力及时处理错误。但是，我们必须遵循上述发布流程，确保能够以一致的方式处理披露。</p>
security-receiving-heading = 接收安全更新
security-receiving-description--2025-07 =
        <p>接收所有安全公告的最佳方式是订阅 <a href="{ -rust-security-announcements-mailing-list-href }">Rust 安全公告邮件列表</a>（或发送电子邮件至 { -rustlang-security-announcements-subscribe-anchor }）。邮件列表的业务量很少，在封禁期过后它会马上收到公共通知。邮件列表上的公告由 <a href="{{ -rust-security-team-key-href }}">Rust 的安全密钥</a> 签名。</p>
        <p>Rust 项目仅为最新的稳定版本以及 <a href="{ -rust-security-supported-channels-href }">beta 和 nightly 渠道</a> 的最新版本提供支持和安全更新。由于 Rust 版本必须在公开环境中构建，我们将在封禁期解除后立即开始发布流程，并在更新的二进制文件可供下载后发布博客文章。</p>
        <p>当漏洞影响软件发行版时，我们将在封禁期解除前 72 小时向 { -distros-openwall-email-anchor } 宣布漏洞，以便发行版在封禁期解除时更新其软件包。</p>
security-pgp-key-heading = 明文 PGP 公钥

### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = 安全政策
security-reporting-heading = 报告漏洞
security-reporting-link = 给 { ENGLISH("security@rust-lang.org") } 发邮件
security-reporting-description--2022-01 =
        <p>安全是 Rust 的核心原则之一，为此，我们希望确保 Rust 有一个安全的实施。感谢您花时间负责任地披露您发现的任何问题。</p>
        <p>Rust 发行版中的所有安全漏洞都应通过电子邮件报告给 { -security-at-rust-lang-org-anchor }。 此列表已交付给一个小型安全团队。您的电子邮件将在 24 小时内得到确认，您将在 48 小时内收到更详细的电子邮件回复，指示处理报告的下一步行动。 如果您愿意，您可以加密您的报告通过使用 <a href="{ -rust-security-team-key-href }">我们的公钥</a>。 这个密钥也在 <a href="{ -rust-pgp-key-mit-keyserver-href }">MIT 的密钥服务器上</a> 或者 <a href="#security-pgp-key">在下面复制</a>.</p>
        <p>此电子邮件地址收到大量垃圾邮件，因此请务必使用描述性主题行，以避免错过您的报告。 在对您的报告进行初步答复后，安全团队将努力让您了解修复和全面公告的进展情况。 根据 <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a> 的建议, 这些更新将至少每五天发送一次。事实上，这更有可能是每 24-48 小时发生一次。</p>
        <p>如果您在 48 小时内没有收到电子邮件回复，或者在过去五天内没有收到安全团队的消息，您可以采取以下步骤（按顺序）：</p>
        <ul>
          <li>
            直接联系两位安全协调员：
            <ul>
                <li>{ -security-coordinator-1-email-anchor }</li>
                <li>{ -security-coordinator-2-email-anchor }</li>
            </ul>
          </li>
          <li>在 <a href="{ -internals-rust-lang-org-href }">内部论坛</a> 上发帖</li>
        </ul>
        <p>请注意，论坛是公共区域。在这些场所升级时，请不要讨论您的问题。只需说您正试图联系安全团队的人员即可。</p>

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

### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = 安全政策
security-reporting-heading = 报告漏洞
security-reporting-link = 给 { ENGLISH("security@rust-lang.org") } 发邮件
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

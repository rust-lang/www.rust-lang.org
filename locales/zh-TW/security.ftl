### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = 安全政策
security-reporting-heading = 回報漏洞
security-reporting-link = 寄送 Email 給 { ENGLISH("security@rust-lang.org") }
security-disclosure-heading = 資訊揭露政策
security-disclosure-description =
    <p>Rust 專案有五步處理漏洞的流程</p>
    <ol>
      <li>收到一個安全報告後會指派一個主要處理者，由此人負責協調修復漏洞與發怖安全版本的流程</li>
      <li>確認問題並列出所有受其影響的版本</li>
      <li>審核程式碼以找出任何潛在問題</li>
      <li>對所有仍在維護的發行版本進行修復，這些修復不會推送到公共 repository，而是保留在本地，等待發怖</li>
      <li>過封鎖期後<a href="{ -rustlang-security-announcements-google-groups-forum-href }">Rust 安全公告郵件列表</a>將發布一份公告副本。這些更改會提交至公共 repository，新的程序會部署至 rust-lang.org。在收到郵件列表通知的 6 小時內，Rust blog 將發怖該通報的副本。</li>
    </ol>
    <p>這些流程可能會花費不少時間，特別是需要和其他專案的維護者協調的時候。我们將進一切努力即時處理錯誤，但我們仍要遵照以上的流程來確保以一致的方式處理漏洞</p>
security-receiving-heading = 接受安全更新
security-receiving-description =
    <p>接收所有安全公告的最好方式是訂閱 <a href="{ -rust-security-announcements-mailing-list-href }">Rust 安全公告郵件列表</a>（或是發送電子郵件至 { -rustlang-security-announcements-subscribe-anchor } ）。郵件列表的信件量很少，在解禁後會立即收到公眾通知。</p>
    <p>我們會在解禁前 72 小時內向 { -distros-openwall-email-anchor } 公佈漏洞，以便 Linux 發行版去更新套件。</p>
security-pgp-key-heading = 明文 PGP 公鑰

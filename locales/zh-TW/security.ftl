### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = 安全政策
security-reporting-heading = 回報漏洞
security-reporting-link = 寄送 Email 給 { ENGLISH("security@rust-lang.org") }
security-reporting-description =
    <p>安全性是 Rust 的核心原則之一，為此，我們想確保 Rust 都可以安全實作所有應用。感謝您負責任地花時間報告任何問題。</p>
    <p>Rust 發行版中，所有的安全漏洞都該藉由電子郵件報告給 { -security-at-rust-lang-org-anchor }。漏洞清單會被提交給一個小型的安全團隊。您的電子郵件會在 24 小時內得到確認，隨後在 48 小時內您會收到更詳細的回覆信件，通知您該錯誤報告處理的後續步驟。如果您願意，也可以使用<a href="{ -rust-security-team-key-href }">我們的公鑰</a>來加密您的錯誤報告。這個公鑰也可以在<a href="{ -rust-pgp-key-mit-keyserver-href }">MIT 的密鑰伺服器</a>上或<a href="#security-pgp-key">本頁下方</a>獲得。</p>
    <p>這電子信箱經常收到大量的垃圾郵件，因此請務必使用描述性的主旨，以避免我們錯過您的報告。在初步回覆您的報告後，安全團隊會即時通知您該漏洞的修復進展。根據<a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>的建議，這些更新應該只少每五天發送一次。實際上，更有可能每 24 ~ 48 小時發送一次。</p>
    <p>如果您在 48 小時內未收到回覆信件，或者在未來的五天內未收到安全團隊的回覆，您可以按下面步驟採取行動：</p>
    <ul>
      <li>直接聯繫當前的安全協調員({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">公鑰</a>))</li>
      <li>直接聯繫後備聯繫人。 ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">公鑰</a>))</li>
      <li>在<a href="{ -internals-rust-lang-org-href }">內部論壇</a>上發文</li>
    </ul>
    <p>請注意，論壇是公共區域，在這些場所交流時，請勿討論關於您的安全漏洞的問題，簡而言之，請盡力並快速的找到安全團隊人員。</p>
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

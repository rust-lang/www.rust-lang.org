### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Rust 的隱私權注意事項
policies-privacy-page-version = <p>版本 { $version }，更新日期 <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro = <p>Rust 專案管理著數個專案，包括 <a href="{ $baseurl }/">Rust 網站</a>、<a href="https://crates.io">crates.io</a> 和 <a href="https://docs.rs">docs.rs</a>。這份隱私權聲明解釋我們如何處理個人資訊。
policies-privacy-page-rust-lang-org-desc =
    <p>
      Rust 於  <a href="{ $baseurl }/">rust-lang.org</a> 的網站是由 <a href="{ $baseurl }/governance/teams/core">核心團隊</a> 與
      <a href="{ $baseurl }/governance/teams/community">社群團隊</a> 管理的專案
    </p>
    
    <dl>
      <dt>訪問紀錄:</dt>
      <dd>
        當你開啟 rust-lang.org 時我們會取得你的 IP 位址，並作為我們伺服器的紀錄的一部份儲存，我們會保留這些紀錄一年
      </dd>
    </dl>
policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      <a href="https://crates.io">Crates.io</a> 由
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io 團隊</a> 與
      <a href="{ $baseurl }/governance/teams/core">Rust 核心團隊</a> 的成員共同管理。
    </p>
    
    <dl>
      <dt>以 GitHub 登入：</dt>
      <dd>
        <p>
          Crates.io 要求使用者有
          <a href="https://github.com">GitHub 帳號</a>，以便登入與使用該服務。當你登入使用 GitHub
          帳號登入 Crates.io 時，我們將取得你的 GitHub 使用者名稱與大頭貼。若你在你的 GitHub
          公開個人資料中分享顯示名稱與公開電子郵件地址，我們也會取得該資訊。
        </p>
      </dd>
    
      <dt>電子郵件地址：</dt>
      <dd>
        <p>
          發佈一個 crate 之前，你必須擁有一個通過驗證的電子郵件地址。我們將取得任一與你的
          GitHub 帳號關聯的公開電子郵件。你亦可選擇不同的地址來關聯你的 Crates.io
          活動。你的電子郵件地址僅會用在我們聯繫有關你的帳號事宜時。
        </p>
      </dd>
    
      <dt>訪問紀錄：</dt>
      <dd>
        <p>
          當你訪問 Crates.io 時，我們將取得你的 IP 位址與 user-agent 標頭，作為我們標準伺服器紀錄的一部分，這些紀錄將留存一年。
        </p>
      </dd>
    
      <dt>上傳至 crate 的資訊：</dt>
      <dd>
        <p>
          所有在 Crates.io 的 crate 皆為公開，包含 crate 擁有者的使用者名稱與 crate 上傳日期。任何人都可觀看與下載
          crate 的內容。由於 Crates.io 原生的公開性，任何你可能放在上傳到 crate 的 Cargo.toml 
          檔案內的個人資料都會是公開可存取。舉例來說，若一個電子郵件地址儲存在 Cargo.toml
          檔案的 `authors` 欄位中，該電子郵件地址也同樣會公開。
        </p>
        <p>
          有鑑於其原生公開性，請留意是否有私人資訊包含在 crate
          中，這些訊息可能被搜尋引擎用來建立索引，或為其他第三方利用。敏感資訊不應包含在 crate 檔案中。
        </p>
      </dd>
    
      <dt>網站相關資料之發佈：</dt>
      <dd>
        <p>
          Crates.io 使用 Google 視覺化 API（ Google Visualization API）來建立每個 crate 過去 90
          天內下載量的圖表。這些圖表可在每個 crate 頁面底部查看。
        </p>
      </dd>
    
      <dt>錯誤監控：</dt>
      <dd>
        <p>
          Crates.io 使用 Sentry 這個錯誤監控服務，協助 Rust 團隊發現並修復程式碼的效能。當一個錯誤發生，Sentry 會取得關於你如何與網站互動，以及導致產生該錯誤的行為的基本資訊。此外，你的 IP 位置也會揭露給 Sentry 作為該錯誤回報流程的一環，但我們設定當 Sentry 一收到 IP 資訊便即刻刪除之。閱讀 <a href="https://sentry.io/privacy/">Sentry 的隱私權政策</a>
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc--2020-09 =
    <p>
      <a href="https://docs.rs">Docs.rs</a> 由
      <a href="{ $baseurl }/governance/teams/dev-tools#docs-rs">docs.rs 團隊</a>
      與 <a href="{ $baseurl }/governance/teams/core">核心團隊</a>
      的成員共同管理。
    </p>
    
    <dl>
      <dt>訪問紀錄：</dt>
      <dd>
        <p>
          當你訪問 docs.rs 時，我們會取得你的 IP 位址與 user-agent 標頭，作為我們標準伺服器紀錄的一部分，這些紀錄將留存一年。 
        </p>
      </dd>
    </dl>
policies-privacy-page-forums-title = 論壇
policies-privacy-page-forums-desc =
    <p>
      <a href="{ $baseurl }/governance/teams/community">Rust 社群團隊</a>
      經營
      <a href="https://users.rust-lang.org">使用者論壇</a>與
      <a href="https://internals.rust-lang.org">內部論壇</a>。這些
      論壇的文章皆為公開。若你註冊進而參與這些論壇，我們
     會蒐集您的電子郵件地址和名稱。作為論壇經營者，我們可取得關於您在論壇
     互動的使用資訊，例如文章發表與閱讀，以及使用該網站的時間。
    </p>
policies-privacy-page-third-parties-title = 第三方服務
policies-privacy-page-third-parties-desc =
    <p>
      在 rust-lang.org 的使用者論壇於內部論壇由
     <a href="https://www.discourse.org/">Discourse</a>託管，並使用其開源討論平臺。
      Discourse 的隱私權政策可<a href="https://www.discourse.org/privacy">由此查看</a>。
    </p>
    
    <p>
      GitHub 登入用於 Crates.io 與（可選）論壇的授權。GitHub 的隱私權成名可以<a href="https://help.github.com/en/articles/github-privacy-statement">在此找到</a>。
    </p>
    
    <p>
      部分 Rust 團隊選用 Zulip 及 Discord 作為社群協作平臺。Zulip 的隱私聲明<a href="https://zulipchat.com/privacy/">在此取得</a>。Discord 的隱私聲明<a href="https://discordapp.com/privacy">在此取得</a>。
    </p>
policies-privacy-page-contact-title = 連絡資訊
policies-privacy-page-contact-desc =
    <p>有關資料訪問的請求，或任何與此隱私聲明相關的問題，請發送電子郵件到<a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</ a></p>
    
    <p>或者您可以透過下面地址聯繫我們：</p>
    
    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

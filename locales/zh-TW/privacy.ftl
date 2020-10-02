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
policies-privacy-page-crates-io-desc =
    <p><a href="https://crates.io">Crates.io</a> 由<a href="{ $baseurl }/governance/teams/crates-io">Crates.io 團隊</ a>和<a href="{ $baseurl }/governance/teams/core">Rust 核心團隊</a> 的成員管理。 </p>
    
    <dl>
      <dt>由 GitHub 登入：</dt>
      <dd><p>Crates.io 要求使用者擁有 <a href="https://github.com">GitHub 帳號</a>以登入和使用該服務。當您使用 GitHub 帳號登入到 Crates.io 時，我們會接收到您的 GitHub 使用者名稱和頭貼。若您在 GitHub 帳號訊息中分享顯示名稱和公開電子郵件地址，我們也會接收到這些訊息。 </p></dd>
    
    <dt>電子郵件地址：</dt>
      <dd><p>欲發布 crate，您必須有一個已驗證的電子郵件地址。我們會接收到與您 GitHub 帳號關聯的任何公開電子郵件地址。您也可以選擇為您在 Crates.io 上的活動提交一個不同的地址。我們僅會與您聯絡帳戶相關事宜時使用您的電子郵件地址。 </p></dd>
    
      <dt>訪客紀錄：</dt>
      <dd><p>當您訪問 Crates.io 時，我們會接收到您的 IP 地址和使用者代理標頭，作為我們標準服務器記錄的一部分。這些記錄我們會存儲 1 年時間。 </p></dd>
    
      <dt>上傳到 crate 的訊息：</dt>
      <dd>
        <p>Crates.io 上的所有 crate 皆是公開的，包括 crate 擁有者的使用者名稱以及 crate 的上傳日期。任何人都可以查看或下載一個 crate 的內容。因為 Crates.io 開放的特性，任何包含在 Cargo.toml 文件中上傳到 crate 的個人信息都將可以被公開訪問。例如說，如果在 Cargo.toml 文件的 `author` 一欄有一個電子郵件地址，這個電子郵件地址將被公開。 </p>
        <p>因為這一公開的特性，注意您在 crate 裡包含的任何私人訊息都可能被搜索引擎索引以及被第三方使用。不應該將敏感訊息包含在 crate 文件中。 </p>
      </dd>
    
      <dt>網站相關數據的發布：</dt>
      <dd><p>Crates.io 使用 Google Visualization API 來顯示每個 crate 過去90天的下載量圖。這些圖可以在每個 crate 頁面的底部看到。 </p></dd>
    </dl>
policies-privacy-page-docs-rs-desc =
    <p><a href="https://docs.rs">Docs.rs</a> 由 <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">Rustdoc 團隊</a> 與 <a href="{ $baseurl }/governance/teams/core">Rust 核心團隊</a>成員共同管理。該專案依據此隱私權聲明描述之方式蒐集與利用資料。</p>
    
    <p>Docs.rs 是一個作為託管 Rust 程式語言的 crate 文件之開源專案。會使用 nightly 版的 Rust 編譯器自動構建 crate 文件，並發佈至 <a href="https://crates.io">crates.io</a> 上。所有從 crate 取得之資訊皆會發佈在 docs.rs，同時也可從 crates.io 公開取得。
    </p>
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

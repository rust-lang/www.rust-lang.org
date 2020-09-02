## tools/index.hbs

tools-page-title = 工具
tools-editor-support-heading = 主流編輯器支援
tools-editor-support-description = 無論您喜歡使用命令列還是視覺化的編輯器，Rust 都有整合方案供您選擇。或者您也可以用 <a href="https://github.com/rust-lang/rls">Rust Language Server</a> 來打造您自己的工具。
tools-build-heading = 平穩的建構流程
tools-build-description = Cargo 是 Rust 的建構工具。它用一道指令整合了所有常用功能，無需額外工作。
tools-build-install-heading = 安裝
tools-build-install-description = <a href="https://crates.io">crates.io</a> 上面有成千上萬的套件，很可能早就有您正在尋找的解決方案。站在巨人的肩膀上，讓你的團隊拋下重複工作，專注創新。
tools-build-test-heading = 測試
tools-build-test-description = Rust 優秀的測試工具讓您可以對程式碼充滿信心。<code class="nowrap">cargo test</code> 是統一的 Rust 測試工具。您可以直接在程式碼內寫下測試，或是另外寫在獨立檔案中：它滿足您所有的測試需求。
tools-build-deploy-heading = 佈署
tools-build-deploy-description = <code class="nowrap">cargo build</code> 可為所有平台建構出小巧的執行檔。一道指令即可對應到 Windows、Linux 以及網頁平台。全部透過現代化的界面，不需再另外定製建構檔案。
tools-automation-heading = 利用自動化加速開發
tools-automation-description = Rust 工業級的工具讓團隊放心合作，專注在最重要的工作上。
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt 可以自動格式化程式碼，讓它們更容易閱讀、編寫及維護。最重要的是：不用再爭論空格或大括號擺哪邊了。
tools-automation-rustfmt-link = 前往 repo
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>「看起來您正在實作 Iterator」</i> <br> Clippy 協助所有經驗不同的開發人員寫出符合慣例的程式碼，並且推行標準寫法。
tools-automation-clippy-link = 前往 repo
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = Cargo 的文件產生器讓所有的 API 都有對應的文件。您可以用 <code class="nowrap">cargo doc</code> 在本地端產生文件，或是在 <a href="https://docs.rs">docs.rs</a> 看到線上文件。
tools-automation-cargo-doc-link = 前往網站

## tools/install.hbs

tools-install-page-title = 安裝 Rust
install-using-rustup-heading = 使用 rustup (推薦)
install-rustup32-button = 下載 <span class="nowrap">rustup-init.exe</span> <span class="nowrap">（32 位元）</span>
install-rustup64-button = 下載 <span class="nowrap">rustup-init.exe</span> <span class="nowrap">（64 位元）</span>
install-notes-heading = Rust 安裝須知
install-notes-getting-started-description = 如果您正要開始使用 Rust，需要一份更完整的教學，請見<a href="{ $getting-started-href }">開始使用</a>頁面。
install-notes-rustup-heading = 用 <code>rustup</code> 管理工具鏈
install-notes-rustup-description =
    <p>
      <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a> 是負責安裝及管理 Rust 的工具。Rust 以六星期為週期進行<a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">快速的版本發行</a>，而且支援<a href="https://forge.rust-lang.org/release/platform-support.html">大量不同的平台</a>，因此不論何時 Rust 都有許多不同的建構版本。<code>rustup</code> 在所有平台上用統一的方式管理這些不同版本，讓您可以同時安裝 beta 或 nightly 通道的 Rust 工具，或是進行跨平台編譯。
    </p>
    <p>
      如果您之前已經安裝過 <code>rustup</code>，您可以用 <code>rustup update</code> 指令來更新它。
    </p>
    <p>
      請參考 <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
      <code>rustup</code> 文件</a> 以取得更多資訊。
    </p>
install-notes-uninstall-heading = 解除安裝 Rust
install-notes-uninstall-description =
    <p>
      若任何時候想解除安裝 Rust，你可以執行
      <code>rustup self uninstall</code>。
      我們會想念你的！
    </p>
install-notes-path-heading = 設定 <code>PATH</code> 環境變數
install-notes-path-description =
    <p>
      在 Rust 開發環境中，所有工具都安裝在
      <span class="platform-specific not-win di">
        <code>~/.cargo/bin</code>
      </span>
      <span class="platform-specific win dn">
        <code>%USERPROFILE%\.cargo\bin</code>
      </span> 目錄中。您也可以在這裡找到 Rust 工具鏈，包括 <code>rustc</code>、<code>cargo</code> 以及 <code>rustup</code>。
    </p>
    <p>
      因此，Rust 開發者通常會把這個目錄加入 <a href="https://en.wikipedia.org/wiki/PATH_(variable)">
      <code>PATH</code> 環境變數</a>中。在安裝過程中 <code>rustup</code> 會試著幫你設定 <code>PATH</code>。
      因為不同平台與 shell 之間有差異，<code>rustup</code> 本身可能也有 bug，您可能要等重啟終端機或登出後，<code>PATH</code> 的設定才會生效，但也可能沒有成功設定。
    </p>
    <p>
      如果安裝後您無法正常在終端機執行 <code>rustc --version</code>，那應該就是上述原因。
    </p>
install-notes-windows-heading = Windows 注意事項
install-notes-windows-description =
    <p>
      在 Windows 系統上，Rust 需要依賴 Visual Studio 2013 版本以上的 C++ 編譯及建構工具。要安裝這些工具，最簡便的方式是去微軟的官網下載並安裝：
      <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
        Microsoft Visual C++ Build Tools 2019
      </a>
      這只提供 Visual C++ 編譯及建構工具。或者，您可以在<a href="https://www.visualstudio.com/downloads/">安裝</a>
      Visual Studio 2019、 Visual Studio 2017、Visual Studio 2015 或 Visual
      Studio 2013 時，選擇並安裝「C++ 工具集（C++ tools）」。
    </p>
    <p>
      有關更多關於在 Windows 系統上安裝 Rust 的資訊詳見
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
      Windows 專屬 <code>rustup</code> 文件</a>。
    </p>
install-other-methods-heading = 其它安裝方式
install-other-methods-description = 我們推薦大部份開發者，使用 <code>rustup</code> 並依照以上說明安裝 Rust，但您依然可以使用其他方式來安裝。
install-other-methods-link = 了解更多

## components/tools/rustup.hbs

tools-rustup-unixy = 您的作業系統似乎是 macOS、Linux 或其他類 Unix 系統。請下載 Rustup 並安裝 Rust，然後在終端機執行以下指令，並遵循螢幕上的指示。
tools-rustup-windows-2 = 您似乎正在運行 Windows。欲使用 Rust，請下載安裝工具後，執行該程式並遵照螢幕上的指示。當看見相關提示時，您可能需要下載 <a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/"> Visual Studio C++ Build tools</a>。若您並非使用 Windows，請參考<a href="https://forge.rust-lang.org/infra/other-installation-methods.html">「其他安裝方式」</a>。
tools-rustup-wsl-heading = Windows 的 Linux 子系統（WSL）
tools-rustup-wsl = 如果您是 Windows 的 Liunx 子系統（WSL）使用者，要安裝 Rust，請在終端機執行以下指令，並遵循螢幕上的指示。
tools-rustup-unknown = Rust 可以在 Windows、Linux、maxOS、FreeBSD 和 NetBSD 上運作。如果您在這些平台上，看到此訊息，請回報問題，並附上以下內容：
tools-rustup-report = 回報問題
tools-rustup-manual-unixy = 如果您的作業系統是 Unix，要安裝 Rust，<br> 請在終端機執行以下指令，並遵循螢幕上的指示。
tools-rustup-manual-windows = 如果您的電腦是 Windows 作業系統，<br>請下載並執行 <a href="https://win.rustup.rs">rustup‑init.exe</a> ，然後遵循螢幕上的指示。
tools-rustup-manual-default = 如果您的作業系統是 Linux 或 macOS、WSL 等類 Unix 系統，要安裝 Rust，<br> 請在終端機執行以下指令，並遵循螢幕上的指示。
tools-rustup-manual-default-windows = 如果您的電腦是 Windows 作業系統，<br>請下載並執行 <a href="https://win.rustup.rs">rustup‑init.exe</a> ，然後遵循螢幕上的指示。

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

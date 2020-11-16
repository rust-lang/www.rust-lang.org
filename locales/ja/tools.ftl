## tools/index.hbs

tools-page-title = ツール
tools-editor-support-heading = 第一級のエディタサポート
tools-editor-support-description = コマンドラインでコードを書くことが好みでも、リッチなグラフィカルエディタが好みでも、あなたの選ぶエディタにはRustの拡張機能があるでしょう。また、<a href="https://github.com/rust-lang/rls">Rust Language Server</a>を使って自分だけの環境を作ることも可能です。
tools-build-heading = ビルドにやすらぎを
tools-build-description = CargoはRustのビルドツールです。全ての一般的な操作がひとつのコマンドに集約されています。ボイラープレートは不要です。
tools-build-install-heading = インストール
tools-build-install-description = 何万ものパッケージがある<a href="https://crates.io">crates.io</a>なら、お探しの解決策を持つクレートが見つかることでしょう。巨人の肩の上に乗り、チームを反復から革新へと導きます。
tools-build-test-heading = テスト
tools-build-test-description = Rustの優秀なテストツールでコードに信頼性をもたらしましょう。<code class="nowrap">cargo test</code>はRustの統合テストソリューションです。テストをコードの隣にも別のファイルにも書くことができ、あらゆるテストニーズに解決策を提供します。
tools-build-deploy-heading = デプロイ
tools-build-deploy-description = <code class="nowrap">cargo build</code>は、あらゆるプラットフォーム向けに無駄のないバイナリを生成します。1回のコマンドだけで、あなたのコードをWindows、Linux、macOS、そしてウェブ向けにビルドすることができます。すべてがモダンなインターフェイスの一部であり、環境に依ったビルドファイルは必要ありません。
tools-automation-heading = 自動化のもたらす速度
tools-automation-description = Rustの実用レベルのツールは心理的安全性をもたらし、チームが重要なタスクに集中できるようにします。
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmtは自動的にRustコードをフォーマットし、読み書きしやすく保守しやすいものにします。そしてもっとも重要なことは、スペースの数や括弧の位置についてもはや議論の余地はないということです。
tools-automation-rustfmt-link = リポジトリに行く
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description =
    <i>「イテレータを書いていますね」</i><br>
    Clippyはあらゆる経験レベルの開発者が、コード規約を守ったRustらしいコードを書くことができるようにサポートします。
tools-automation-clippy-link = リポジトリに行く
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = CargoのドキュメントビルダーはどんなAPIでもドキュメント化できます。ドキュメントは、ローカルでは<code class="nowrap">cargo doc</code>で、オンラインにあるパブリックなクレートでは<a href="https://docs.rs">docs.rs</a>で参照できます。
tools-automation-cargo-doc-link = サイトに行く

## tools/install.hbs

tools-install-page-title = Rust をインストール
install-using-rustup-heading = rustup を使う（おすすめ）
install-rustup32-button = <span class="nowrap">rustup-init.exe</span><span class="nowrap">(32-bit)</span>をダウンロードする
install-rustup64-button = <span class="nowrap">rustup-init.exe</span><span class="nowrap">(64-bit)</span>をダウンロードする
install-notes-heading = Rust のインストールについての注意
install-notes-getting-started-description = Rustをこれから始めようとしていて、詳細を見渡したいのなら、<a href="{ $getting-started-href }">はじめる</a>のページを見てください。
install-notes-rustup-heading = <code>rustup</code>を使ったツールチェーンの管理
install-notes-rustup-description =
    <p>
    Rustは<a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a>というツールによってインストール・管理されます。
    Rustには６週間ごとの<a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">ラピッドリリースプロセス</a>があり、<a href="https://forge.rust-lang.org/release/platform-support.html">多数のプラットフォーム</a>をサポートしているので、 数多くのビルドがいつても利用できます。
    <code>rustup</code>はこれらのビルドを、Rustがサポートしているすべてのプラットフォームで一貫した方法で管理し、betaやnightly版のリリースチャンネルや、追加のクロスコンパイルターゲットもサポートしています。
    </p>
    <p>
    もし<code>rustup</code>で過去にRustをインストールしたならば、いつでも<code>rustup update</code>を実行することでインストールしたものをアップデートできます。
    </p>
    <p>
    より詳しい情報は<a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md"><code>rustup</code>のドキュメント</a>を参照してください。
    </p>
install-notes-uninstall-heading = Rustをアンインストールする
install-notes-uninstall-description =
    <p>
      Rustをアンインストールしたくなったときは、
      <code>rustup self uninstall</code>
      を実行することでいつでもアンインストールできます。
      寂しいですけどね！
    </p>
install-notes-path-heading = <code>PATH</code>環境変数を設定する
install-notes-path-description =
     <p>
    Rustの開発環境において、全てのツールは<span class="platform-specific not-win di"><code>~/.cargo/bin</code></span><span class="platform-specific win dn"><code>%USERPROFILE%\.cargo\bin</code></span>ディレクトリにインストールされ、ここに<code>rustc</code>、<code>cargo</code>、<code>rustup</code>を含むRustのツールチェーンが置かれます。
    </p>
    <p>
    よって、このディレクトリを<a href="https://en.wikipedia.org/wiki/PATH_(variable)"><code>PATH</code>環境変数</a>に含めるのが、Rustの開発者にとっての通例となっています。
    インストールの際、<code>rustup</code>は<code>PATH</code>を設定しようとします。
    プラットフォームやコマンドシェルの差異、あるいは<code>rustup</code>のバグにより、<code>PATH</code>の変更はコンソールを再起動、もしくはユーザーがログアウトするまで適用されない場合や、完全に失敗してしまう場合があります。
    </p><p>
    もし、インストール後、コンソールで<code>rustc --version</code>の実行が失敗するときは、この環境変数の未設定が原因であることが多いです。
     </p>
install-notes-windows-heading = Windowsの場合
install-notes-windows-description =
    <p>
    Windowsでは、RustはさらにVisual Studio 2013以上のC++ビルドツールを要求します。ビルドツールを手に入れる最も簡単な方法は、Visual C++ビルドツールのみを提供する<a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">Microsoft Visual C++ Build Tools 2019</a>をインストールすることです。
    他には、Visual Studio 2019、Visual Studio 2017、Visual Studio 2015、Visual Studio 2013のいずれかを<a href="https://www.visualstudio.com/downloads/">インストール</a>し、インストール時に「C++ tools」を選択することでもできます。
    </p>
    <p>
    WindowsでのRustの設定についての詳しい情報は、<a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">Windows用の<code>rustup</code>ドキュメント</a>を参照してください。
    </p>
install-other-methods-heading = その他のインストール方法
install-other-methods-description = 上記の<code>rustup</code>によるインストールが、ほとんどの開発者にとってRustをインストールをする好ましい方法です。しかし、Rustは他の方法でもインストールすることができます。
install-other-methods-link = もっと知る

## components/tools/rustup.hbs

tools-rustup-unixy = あなたはmacOSかLinuxまたはその他のUnix系OSを使用しているようです。RustupをダウンロードしてRustをインストールするには、ターミナルで以下のコマンドを実行してください。それから画面に表示される指示に従ってください。Windowsユーザである場合には、<a href="https://forge.rust-lang.org/infra/other-installation-methods.html">「その他のインストール方法」</a>を参照してください。
tools-rustup-windows-2 = あなたはWindowsを使用しているようです。Rustを使い始めるには、インストーラをダウンロードして実行し、画面に表示される指示に従ってください。場合によっては、<a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/">Visual Studio C++ Build tools</a>をインストールする必要があります。もしWindowsユーザでない場合には、<a href="https://forge.rust-lang.org/infra/other-installation-methods.html">「その他のインストール方法」</a>を参照してください。
tools-rustup-wsl-heading = Windows Subsystem for Linux
tools-rustup-wsl = あなたがWindows Subsystem for Linuxのユーザーであるなら、下記をターミナル上で実行し、スクリーン上の説明に従ってRustをインストールしてください。
tools-rustup-unknown = RustはWindows、Linux、macOS、FreeBSD、そしてNetBSD上で動作します。これらのプラットフォームのいずれかでこれが表示されている場合は、以下の値と一緒に問題を報告してください。
tools-rustup-report = 問題を報告する
tools-rustup-manual-unixy = Unix上でRustをインストールするときは、<br>以下をターミナルで実行し、画面の指示に従ってください。
tools-rustup-manual-windows = Windows上では、<br><a href="https://win.rustup.rs">rustup-init.exe</a>をダウンロード・実行し、画面の指示に従ってください。
tools-rustup-manual-default = WSL、Linux、あるいはmacOSのようなUnix系統のOS上でRustをインストールするときは、<br>以下をターミナルで実行し、画面の指示に従ってください。
tools-rustup-manual-default-windows = Windows上であれば、<br><a href="https://win.rustup.rs">rustup-init.exe</a>をダウンロード・実行し、画面の指示に従ってください。

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

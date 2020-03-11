### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = 歯車
wasm-why-rust-predictable-heading = 予測可能なパフォーマンス
wasm-why-rust-predictable-description = 予測できないガベージコレクションによって、動作が停止することはありません。JITコンパイラによる急激なパフォーマンス低下もありません。低レベルの制御と高レベルのエルゴミクスの両立を実現しています。
wasm-why-rust-small-code-alt = 顕微鏡
wasm-why-rust-small-code-heading = 小さいコードサイズ
wasm-why-rust-small-code-description = コードサイズが小さくなるとページの読み込み速度は向上します。Rustが生成する<code>.wasm</code>はガベージコレクタのように必要のないものを含みません。先進的な最適化とツリーシェイキングは不要なコードを取り除きます。
wasm-why-rust-amenities-alt = 荷物
wasm-why-rust-amenities-heading = モダンで快適な環境
wasm-why-rust-amenities-description = アクティブなライブラリのエコシステムは開発を進める際に大きな助けとなります。高い表現力を持つゼロコスト抽象化も備わっています。そしてコミュニティはあなたを歓迎して学習をサポートします。

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = WebAssemblyロゴ
wasm-get-started-wasm-description = WebAssemblyと呼ばれる高速で安全かつオープンな仮想マシンについてもっと学び、そしてその標準規格を読みましょう。
wasm-get-started-wasm-link = もっと学ぶ
wasm-get-started-book-alt = wasm フェリス
wasm-get-started-book-description = Rustを使ったWebAssemblyアプリケーションのビルド、デバッグ、プロファイル、そしてデプロイの方法を学ぼう！
wasm-get-started-book-link = ドキュメントを読む
wasm-get-started-mdn-alt = MDNロゴ
wasm-get-started-mdn-description = Mozilla Developer NetworkでWebAssemblyについてもっと学ぶ
wasm-get-started-mdn-link = 確認する

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = JavaScriptとのすてきな共演
wasm-js-augment-heading = 置換ではなく、拡張
wasm-js-augment-description = WebAssemblyの目的はJavaScriptを終わらせるのではなく共存して、処理が重いタスクやレイヤの低いタスクの処理をサポートすることです。これらのタスクは、パフォーマンスに重点を置くRustだからこそ恩恵を受けられると言えるでしょう。
wasm-js-toolchains-heading = 一般的なツールチェーンとの連携
wasm-js-toolchains-description = RustのWebAssemblyパッケージはnpmのようなパッケージレジストリに公開できます。webpackやParcelなどをバンドルしてリリースすることもできます。管理には<code>npm audit</code>やGreenkeeperのようなツールが使えます。
wasm-js-interop-heading = シームレスな相互運用
wasm-js-interop-description = RustとWebAssembly、JavaScript API間をバインドするコードは自動生成できます。<a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a>のようなライブラリを使えば、各ウェブプラットフォームへのバインディングをパッケージ済みの状態で提供することもできます。

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = cloudflareロゴ
wasm-production-cloudflare-quote = RustをWASMにコンパイルして、サーバーレス関数から呼び出すことができます。これはとても素晴らしいことで、より多くのことをするのが待ちきれません。
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = <code>source-map</code>のJavaScript実装はパフォーマンスの名の下に複雑なコードが跋扈しており、私たちはそれを表現力のあるRustに書き換えました。Rustは明確な表現とランタイムパフォーマンスのどちらか一方を選ぶよう迫ることはありません。
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = 上記のように、{ "[" }Rustの]特性を活かせば、WASMを使ってwebページにDivANSコーデックを簡単に組み込めます。
wasm-production-dropbox-attribution = Daniel Reiter Horn and Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = 組込み機器

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = 顕微鏡
embedded-pitch-analysis-heading = 強力な静的解析
embedded-pitch-analysis-description = コンパイル時にピンおよび周辺機器の設定を指定できます。これによってリソースがアプリケーションの意図しない部分で使われないよう保証します。
embedded-pitch-memory-alt = RAM
embedded-pitch-memory-heading = 柔軟なメモリ管理
embedded-pitch-memory-description = 動的なメモリ割り当てが可能です。グローバルアロケータおよび動的データ構造をお使いください。もしくはヒープを全く使わずに静的にすべて割り当てることも可能です。
embedded-pitch-concurrency-alt = 歯車
embedded-pitch-concurrency-heading = 怖いもの知らずの並行処理
embedded-pitch-concurrency-description = Rustではスレッド間で誤って状態が共有されることはありません。お好きな並行処理方式をお使いください、いずれもRustの強力な保証を提供します。
embedded-pitch-interop-alt = 握手
embedded-pitch-interop-heading = 相互運用性
embedded-pitch-interop-description = Rustを既存のCコードベースと統合したり、既存のSDKを活かしてRustアプリケーションを書くことができます。
embedded-pitch-portability-alt = 台車に乗ったカバン
embedded-pitch-portability-heading = 移植性
embedded-pitch-portability-description = ライブラリやドライバを一度書くだけで、非常に小さなマイクロコントローラから強力なSBCまで、多様なシステムで扱えます。
embedded-pitch-community-alt = 盾ロゴ
embedded-pitch-community-heading = コミュニティドリブン
embedded-pitch-community-description = 組込みシステムのサポートはRustオープンソースプロジェクトの一環として、最高クラスのオープンソースコミュニティによってパートナー企業からの支援を受けつつ行われています。
embedded-learn-more-link = もっと知る

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = ショーケース
embedded-showcase-quote = 「Mozillaから出ているRustに出会ったとき、とても興奮しました。 Rustは新しいプログラミング言語で『安全、高速、並行。3つを兼ね備える。』を標語としています。その未来は確実で、強力で献身的なユーザコミュニティがついています。」
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = もっと見る
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Securing the future, with Rust</a>、作者<a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a>、<a href="https://vimeo.com">Vimeo</a>に掲載

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = DIP-6パッケージ
embedded-get-started-discovery-book-heading = The Discovery book
embedded-get-started-discovery-book-description = 組込み開発を基礎から学ぼう&mdash;Rustを使って！
embedded-get-started-embedded-rust-book-alt = QFP-20パッケージ
embedded-get-started-embedded-rust-book-heading = The Embedded Rust book
embedded-get-started-embedded-rust-book-description = 組込み開発はもうお手のものですか？今すぐRustを始めてその恩恵を受けましょう。
embedded-get-started-embedonomicon-alt = BGAパッケージ
embedded-get-started-embedonomicon-heading = The Embedonomicon
embedded-get-started-embedonomicon-description = 基礎的な組込みライブラリの内部を見てみましょう。
embedded-get-started-read-link = 読む
embedded-get-started-more-documentation-link = もっとドキュメントを読む

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Sensirion ロゴ
embedded-testimonials-sensirion-quote = Sensirionでは最近、Rustを用いてSensirionの<a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>の組込みデモンストレータを作りました。クロスコンパイルの容易さと多くの高品質なクレートがcrates.io上で提供されているおかげで、<b>私たちは高速で堅牢なデモンストレータを素早く作ることができました。</b>
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Software Engineer, Sensirion
embedded-testimonials-airborne-alt = Airborne Engineering Ltd ロゴ
embedded-testimonials-airborne-quote = Airborne Engineering Ltd.では最近、私たちは社内データ収集システムのためのEthernetブートローダ<a href="https://github.com/airborneengineering/blethrs">blethrs</a>をRustを用いて書きました。<b>Rustは有望な言語であり、組込み等のプロジェクトで将来使うことを楽しみにしています。</b>
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Instrumentation Engineer, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = 49nord ロゴ
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] により、ソフトウェアを私たちの想像を超えて速く正確にリリースできます。Rustのおかげで私たちはメモリ安全性を当たり前のものとして扱うことができますし、その一方で洗練された型システムをもつゼロオーバーヘッド言語としての利点によって、保守性の高いソフトウェアを開発することができます。<b>Rustは私たちの顧客だけでなく、エンジニアをも幸せにします。</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Terminal Technologies ロゴ
embedded-testimonials-terminal-tech-quote = 一般にC/C++の代替がないとされている<b>組込み分野において、現代的で優れた言語を使えるというのは本当にすばらしいことだと思います。</b>
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Senior Software Engineer, Terminal Technologies

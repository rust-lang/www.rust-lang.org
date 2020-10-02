## templates/what/networking.hbs

what-networking-page-title = ネットワーク

## templates/components/what/networking/get-started.hbs

networking-get-started = Rustにはウェブのための使いやすいライブラリのエコシステムがあり成長を続けています。ここでは例として二つ紹介します。
networking-get-started-post-json = JSONをPOSTする
networking-get-started-take-json = JSON POSTをハンドルする
networking-get-started-reqwest = reqwestについてもっと知る
networking-get-started-rocket = Rocketについてもっと知る

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = 省リソース
networking-pitch-footprint =
    リソースの使用を制御しメモリとCPUにかかる負荷を最小限に抑えます。
    コンパイラーの助けを借りて、正しく動作することを確認しましょう。
    生産的で使い心地のよいエコシステムでこれを行います。
networking-pitch-footprint-alt = 羽
networking-pitch-secure-header = 安全性と信頼性
networking-pitch-secure =
    Rustの強力な型チェッカがあらゆる種類のバグを防ぎます。
    状態がいつどこで共有および変更されたかを確実に把握できます。
    障害点を突き止める検査をデプロイ前に行います。
networking-pitch-secure-alt = 盾
networking-pitch-concurrent-header = 大規模な並行処理
networking-pitch-concurrent =
    最適な並行性アプローチを組み合わせて使用​​します。
    Rustは、スレッドまたはタスク間で誤って状態を共有しないようにします。
    スケーリングの最後のビットまで大胆に絞ることができます。
networking-pitch-concurrent-alt = つながった歯車

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = 私たちはPush接続インフラストラクチャをRustに移行することで、非常に高いパフォーマンスを実現しながらも、正確性に重点を置いた保守しやすいコードベースを手にしました。私たちは現在、ピーク時には2,000万件のwebsocket同時接続をRustサーバーで捌いています。
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, スタッフエンジニア, Mozilla
networking-production-testimonial-buoyant = Linkerdプロジェクトの技術ロードマップにおいて、Rustは土台となるものです。その型システムによって、モジュール性がありテスト可能で組み合わせ可能なユニットを、実行時性能を犠牲にすることなく作れます。その一方で最も驚かされる点として、Rustのライフタイム／借用チェックシステムにより大部分のリソースリークを避けられることが挙げられます。二年経ちましたが、他の言語を業務で使うことは全くもって想像できないですね。
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>

### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = 齿轮
wasm-why-rust-predictable-heading = 可预见的性能
wasm-why-rust-predictable-description = 没有难以预料的 GC 暂停，也没有 JIT 编译器造成性能抖动，只有底层控制与上层人体工程学的完美结合。
wasm-why-rust-small-code-alt = 显微镜
wasm-why-rust-small-code-heading = 更小的代码尺寸
wasm-why-rust-small-code-description = 代码尺寸越小，页面加载速度就越快。Rust 生成的 <code>.wasm</code> 模块不含类似于垃圾回收器这样的额外成本。高级优化和 Tree Shaking 优化可移除无用代码。
wasm-why-rust-amenities-alt = 行李箱
wasm-why-rust-amenities-heading = 现代设施
wasm-why-rust-amenities-description = 充满活力的库生态系统助您旗开得胜。Rust 拥有丰富的表达能力和零成本的抽象，以及助力您学习的友好社区。

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = WebAssembly 标志
wasm-get-started-wasm-description = 了解更多关于快速、安全且开放的 WebAssembly 虚拟机信息，并阅读其标准。
wasm-get-started-wasm-link = 了解更多
wasm-get-started-book-alt = wasm 和 Rust 吉祥物
wasm-get-started-book-description = 了解如何用 Rust 来构建、调试、剖析和部署 WebAssembly 应用！
wasm-get-started-book-link = 阅读文档
wasm-get-started-mdn-alt = MDN 标志
wasm-get-started-mdn-description = 在 Mozilla 开发者网络上了解更多关于 WebAssembly 的详情。
wasm-get-started-mdn-link = 点击访问

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = JavaScript 的最佳搭档
wasm-js-augment-heading = 增强，而非取代
wasm-js-augment-description = WebAssembly 的梦想不是扼杀 JavaScript，而是与其并存，帮助处理一些繁重或底层的任务。Rust 以性能为先，这些任务也可以受益。
wasm-js-toolchains-heading = 友好的工具链
wasm-js-toolchains-description = 您可以将 Rust WebAssembly 包发布到 npm 之类的包仓储中心上。使用 webpack、Parcel 或其它工具来打包并分发它们。使用 <code>npm audit</code> 之类的工具和 Greenkeeper 来维护它们。
wasm-js-interop-heading = 无缝的互操作性
wasm-js-interop-description = 自动生成 Rust、WebAssembly 和 JavaScript API 之间的绑定代码。充分利用 <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> 之类的库为整个 Web 平台提供预打包的绑定。

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = cloudflare 标志
wasm-production-cloudflare-quote = 我们可以将 Rust 编译成 WASM，并在编织到互联网结构中的 Serverless 功能中调用它。WASM 的潜力巨大，我迫不及待地想要用它做更多的事情。
wasm-production-cloudflare-attribution = Steven Pack，《<a href="{ $href }">Serverless Rust 与 Cloudflare Workers</a>》
wasm-production-mozilla-alt = 火狐
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = <code>source-map</code> 库的 JavaScript 实现为了性能累积了大量复杂的代码，而我们将它替换为地道的 Rust。Rust 不会强迫我们在明确表达意图和运行时性能之间做出选择。
wasm-production-mozilla-attribution = Nick Fitzgerald，《<a href="{ $href }">用 Rust 和 WebAssembly 提升 Source Maps 的性能</a>》
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = Rust 的特性使然，通过 WASM 可以轻松地将 DivANS 编解码器嵌入到网页中。
wasm-production-dropbox-attribution = Daniel Reiter Horn and Jongmin Baek，<a href="{ $href }">《用 DivANS 构建更好的压缩》</a>

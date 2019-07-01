### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = 齒輪
wasm-why-rust-predictable-heading = 可預期的效能
wasm-why-rust-predictable-description = 不會有未預期的垃圾蒐集導致的停頓。不會有即時編譯器（JIT compiler）的效能懸崖。正是將高人體工學與低階的操作完美搭配。
wasm-why-rust-small-code-alt = 一個顯微鏡
wasm-why-rust-small-code-heading = 少量的程式碼
wasm-why-rust-small-code-description = 少量的程式碼意味著非常快的載入速度。Rust 所產生的 <code>.wasm</code> 不會包含額外的產物，例如垃圾回收器。更進階的優化和搖樹優化（tree-shaking）則可以減少無用的程式碼。
wasm-why-rust-amenities-alt = 箱子
wasm-why-rust-amenities-heading = 時尚禮儀
wasm-why-rust-amenities-description = 一個活躍的函式庫生態系將助您旗開得勝。Rust 擁有優秀表達能力、零成本抽象化和一個非常和善的社群來幫助您學習。

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = WebAssembly 標誌
wasm-get-started-wasm-description = 學習更多有關 WebAssembly 的快速、安全與開放虛擬機，以及瞭解它的標準。
wasm-get-started-wasm-link = 瞭解更多
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = 瞭解如何用 Rust 建構、除錯、檢驗效能和發佈 WebAssembly 應用程式！
wasm-get-started-book-link = 閱讀文件
wasm-get-started-mdn-alt = MDN 標誌
wasm-get-started-mdn-description = 從 Mozilla 開發者網站來瞭解 WebAssembly 更多。
wasm-get-started-mdn-link = 立即查看

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = 與 JavaScript 極佳的相容性
wasm-js-augment-heading = 增強！不是取代！
wasm-js-augment-description = WebAssembly 的夢想不是為了扼殺 JavaScript 而是要共存，幫助非常繁重或底層的處理工作 &mdash; 因為 Rust 專注在效能而受益。
wasm-js-toolchains-heading = 使用熟悉的工具鏈來開發
wasm-js-toolchains-description = 您可以發佈 Rust 的 WebAssembly 套件到 npm 這類的套件管理工具。使用 Webpack、Parcel 或其他工具來打包和發佈套件。並使用 <code>npm audit</code> 或 Greenkeeper 等工具來進行維護。
wasm-js-interop-heading = 無縫的互操作性
wasm-js-interop-description = 自動化生成 Rust、WebAssembly 和 JavaScript 之間的 API 的綁定程式碼。充分利用 <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> 之類的函式庫為整個 Web 平台提供事先打包好的绑定。

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = cloudflare logo
wasm-production-cloudflare-quote = 我們可以用 Rust 程式碼編譯出 WASM，並呼叫與網路緊密交織的 Serverless 服務。WASM 的潛力無窮，我迫不及待地想要用它做更多的事情。
wasm-production-cloudflare-attribution = Steven Pack，《<a href="{ $href }">Serverless Rust 與 Cloudflare Workers</a>》
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = JavaScript 的 <code>source-map</code> 函式庫實現為了性能而累積的大量複雜程式碼，而我們將它替换成道地的 Rust 程式碼。Rust 不會強迫我們在明確表達意圖和運行時效能之間做出選擇。
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = { "[" }Rust] 的特性讓我們能透過 WASM 可以輕鬆地將 DivANS 編碼器嵌入到網頁中。
wasm-production-dropbox-attribution = Daniel Reiter Horn and Jongmin Baek，<a href="{ $href }">《用 DivANS 建造更好的壓縮》</a>

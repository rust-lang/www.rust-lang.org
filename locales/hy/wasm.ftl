### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Шестерни
wasm-why-rust-predictable-heading = Предсказуемая производительность
wasm-why-rust-predictable-description = Никаких непредсказуемых остановок для сбора мусора. Никаких снижений производительности JIT-компилятора. Только низкоуровневый контроль в паре с высокоуровневой эргономикой.
wasm-why-rust-small-code-alt = Микроскоп
wasm-why-rust-small-code-heading = Маленький размер кода
wasm-why-rust-small-code-description = Малый размер кода означает быструю загрузку страницы. Сгенерированный Rust <code>.wasm</code> не содержит ненужных вещей, например, сборщика мусора. Дополнительные оптимизации и техника включения гарантированно исполняемого кода (tree shaking) удаляют мёртвый код.
wasm-why-rust-amenities-alt = Тележка с багажом
wasm-why-rust-amenities-heading = Современные удобства
wasm-why-rust-amenities-description = Живая экосистема библиотек, которая поможет вам взяться за дело. Выразительные абстракции с нулевой стоимостью. И приветливое сообщество, которое поможет вам учиться.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = Логотип WebAssembly
wasm-get-started-wasm-description = Узнайте больше о быстрой, безопасной и открытой виртуальной машине, зовущейся WebAssembly, и ознакомьтесь с её стандартом.
wasm-get-started-wasm-link = Узнать больше
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = Узнайте как собрать, отладить, профилировать и развёртывать WebAssembly приложения с помощью Rust!
wasm-get-started-book-link = Читать книгу
wasm-get-started-mdn-alt = Логотип MDN
wasm-get-started-mdn-description = Узнать больше о WebAssembly на Mozilla Developer Network.
wasm-get-started-mdn-link = Узнать больше

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = Хорошо работает с JavaScript
wasm-js-augment-heading = Дополнение, а не замена
wasm-js-augment-description = Мечта WebAssembly &mdash; не убить JavaScript, а работать вместе с ним, помогая в обработке тяжёлых или низкоуровневых задач &mdash; задач, которые выигрывают от подхода Rust к производительности.
wasm-js-toolchains-heading = Работает с привычным набором инструментов
wasm-js-toolchains-description = Публикуйте пакеты WebAssembly, созданные с Rust, в реестр пакетов, такой как npm. Упаковывайте и отправляйте их с webpack, Parcel и подобными. Поддерживайте их с помощью таких инструментов, как <code>npm audit</code> и Greenkeeper.
wasm-js-interop-heading = Бесшовная совместимость
wasm-js-interop-description = Автоматически создавайте кодовые привязки между Rust, WebAssembly и JavaScript API. Получите преимущества таких библиотек, как <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a>, предоставляющих предварительно упакованные привязки для всех web-платформ.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = Логотип cloudflare
wasm-production-cloudflare-quote = Мы можем скомпилировать Rust в WASM и вызывать его из Serverless функций, вплетённых в ткань Интернета. Это потрясающе и я с нетерпением жду этого.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = Реализация библиотеки для <code>source-map</code> на JavaScript превратилась в сложный и медленный код и мы переписали его на Rust. Rust не требует от нас сделать выбор в пользу ясности выражения или производительности во время исполнения.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = Свойства { "[" }Rust] позволяют легко встроить кодек DivANS в web-страницу с помощью WASM, как показано выше.
wasm-production-dropbox-attribution = Daniel Reiter Horn и Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

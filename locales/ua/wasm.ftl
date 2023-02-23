### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Чому Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Шестерні
wasm-why-rust-predictable-heading = Передбачувана продуктивність
wasm-why-rust-predictable-description = Ніяких непередбачуваних зупинок для збирання сміття. Жодних знижень продуктивності JIT-компілятора. Тільки низькорівневий контроль у парі з високорівневою ергономікою.
wasm-why-rust-small-code-alt = Мікроскоп
wasm-why-rust-small-code-heading = Маленький розмір коду
wasm-why-rust-small-code-description = Малий розмір коду означає швидке завантаження сторінки. Згенерований Rust <code>.wasm</code> не містить непотрібних речей, наприклад, збирача сміття. Додаткові оптимізації та техніка включення гарантовано виконуваного коду (tree shaking) видаляють мертвий код.
wasm-why-rust-amenities-alt = Візок із багажем
wasm-why-rust-amenities-heading = Сучасні зручності
wasm-why-rust-amenities-description = Жива екосистема бібліотек, яка допоможе вам узятися за справу. Виразні абстракції з нульовою вартістю. І привітна спільнота, яка допоможе вам вчитися.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = Логотип WebAssembly
wasm-get-started-wasm-description = Дізнайтеся більше про швидку, безпечну та відкриту віртуальну машину на ім'я WebAssembly та ознайомтеся з її стандартом.
wasm-get-started-wasm-link = Дізнатися більше
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = Дізнайтеся, як зібрати, налагодити, профілювати та розгортати WebAssembly додатки за допомогою Rust!
wasm-get-started-book-link = Читати книгу
wasm-get-started-mdn-alt = Логотип MDN
wasm-get-started-mdn-description = Дізнатися більше про WebAssembly на Mozilla Developer Network.
wasm-get-started-mdn-link = Дізнатися більше

## Добре працює з JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = Добре працює з JavaScript
wasm-js-augment-heading = Доповнення, а не заміна
wasm-js-augment-description = Мрія WebAssembly - не вбити JavaScript, а працювати разом із ним, допомагаючи в опрацюванні важких або низькорівневих завдань - завдань, які виграють від підходу Rust до продуктивності.
wasm-js-toolchains-heading = Працює зі звичним набором інструментів
wasm-js-toolchains-description = Публікуйте пакети WebAssembly, створені з Rust, у реєстр пакетів, такий як npm. Пакуйте та надсилайте їх із webpack, Parcel та подібними. Підтримуйте їх за допомогою таких інструментів, як <code>npm audit</code> і Greenkeeper.
wasm-js-interop-heading = Безшовна сумісність
wasm-js-interop-description = Автоматично створюйте кодові прив'язки між Rust, WebAssembly і JavaScript API. Отримайте переваги таких бібліотек, як <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a>, що надають попередньо упаковані прив'язки для всіх web-платформ.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = Логотип cloudflare
wasm-production-cloudflare-quote = Ми можемо скомпілювати Rust у WASM і викликати його з Serverless функцій, вплетених у тканину Інтернету. Це приголомшливо і я з нетерпінням чекаю цього.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = firefox
# Якщо квадратна дужка, що відкривається, є першим символом у рядку, її потрібно екранувати так: {"["}. Див. https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = Реалізація бібліотеки для <code>source-map</code> на JavaScript перетворилася на складний і повільний код і ми переписали його на Rust. Rust не вимагає від нас зробити вибір на користь ясності виразу або продуктивності під час виконання.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# Якщо квадратна дужка, що відкривається, є першим символом у рядку, її потрібно екранувати так: {"["}. Див. https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = Властивості { "["}Rust] дозволяють легко вбудувати кодек DivANS у web-сторінку за допомогою WASM, як показано вище.
wasm-production-dropbox-attribution = Daniel Reiter Horn і Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

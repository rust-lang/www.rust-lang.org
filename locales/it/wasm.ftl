### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Ingranaggi
wasm-why-rust-predictable-heading = Prestazioni predicibili
wasm-why-rust-predictable-description = Nessuna pausa improvvisa dovuta al garbage collector. Nessun calo improvviso di prestazioni dovuto al compilatore JIT. Avrai invece un controllo di basso livello e a una ergonomicità di alto livello.
wasm-why-rust-small-code-alt = Un microscopio
wasm-why-rust-small-code-heading = Codice generato di piccole dimensioni
wasm-why-rust-small-code-description = Codice generato di piccole dimensioni significa caricare la pagina più velocemente. Un file <code>.wasm</code> non include roba inutile, come un garbage collector: ottimizzazioni spinte e ripulitura dal codice inutilizzato.
wasm-why-rust-amenities-alt = Valigia
wasm-why-rust-amenities-heading = Comodità moderne
wasm-why-rust-amenities-description = Un ecosistema vivace di librerie che ti aiutano a partire a tutto gas. Astrazioni espressive e a costo zero. E una community accogliente che ti aiuta a imparare.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = Logo WebAssembly
wasm-get-started-wasm-description = Scopri di più sulla virtual machine chiamata WebAssembly, veloce, sicura e open; leggi lo standard.
wasm-get-started-wasm-link = Scopri di più
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = Scopri come costruire, fare debug, profilare e fare deploy di applicazioni WebAssembly in Rust!
wasm-get-started-book-link = Leggi il Libro
wasm-get-started-mdn-alt = Logo MDN
wasm-get-started-mdn-description = Scopri di più su WebAssembly sul Mozilla Developer Network.
wasm-get-started-mdn-link = Scopri di più

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = A fianco del JavaScript
wasm-js-augment-heading = Aggiungi, non sostituire
wasm-js-augment-description = Il sogno del WebAssembly non è far fuori il tuo JavaScript ma di lavorarci insieme, dando una super-carica in task impegnativi o di basso livello, che beneficiano di tutte le prestazioni di Rust.
wasm-js-toolchains-heading = Utilizza strumenti familiari
wasm-js-toolchains-description = Pubblica pacchetti Rust in WebAssembly su repository come npm. Crea bundle con webpack, Parcel e altro ancora. Fai manutenzione con strumenti come <code>npm audit</code> e Greenkeeper.
wasm-js-interop-heading = Interoperabilità senza interruzioni
wasm-js-interop-description = Genera automaticamente i binding fra le API Rust, WebAssembly e JavaScript. Approfitta di librerie come <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> che forniscono binding pre-impacchettati per l'intera piattaforma web.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = logo cloudflare
wasm-production-cloudflare-quote = Compiliamo da Rust a WASM per invocare funzioni Serveless direttamente dal cuore di Internet. E' incredibile: non vedo l'ora di aggiungerne altre.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = L'implementazione in JavaScript [della libreria <code>source-map</code>] si è fatta complessa a causa delle varie ottimizzazioni; l'abbiamo sostituita con del codice idiomatico in Rust. Rust non ci obbliga a scegliere fra scrivere codice espressivo e prestazioni a runtime.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = { "[" }Le proprietà di Rust] fanno in modo che sia facile fare embed del codec DivANS in una pagina web, come mostrato sopra.
wasm-production-dropbox-attribution = Daniel Reiter Horn e Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

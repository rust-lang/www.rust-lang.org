### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Engrenages
wasm-why-rust-predictable-heading = Des performances prévisibles
wasm-why-rust-predictable-description = Pas d'interruption imprévisible à cause d’un ramasse-miettes. Pas de chute de performance liée à un compilateur JIT. Juste un contrôle de bas-niveau et un haut niveau d'ergonomie.
wasm-why-rust-small-code-alt = Un microscope
wasm-why-rust-small-code-heading = Code succinct
wasm-why-rust-small-code-description = Un exécutable plus léger permet des chargements de page plus rapides. Les <code>.wasm</code> générés par Rust n’incluent rien de superflu, comme un ramasse-miettes. Des optimisations avancées ainsi que du tree shaking suppriment le code mort.
wasm-why-rust-amenities-alt = Bagages
wasm-why-rust-amenities-heading = Fonctionnalités modernes
wasm-why-rust-amenities-description = Un écosystème vivant de bibliothèques pour vous aider à démarrer sur les chapeaux de roue. Des abstractions expressives à coût zéro. Et une communauté accueillante pour vous aider à apprendre.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = Logo de WebAssembly
wasm-get-started-wasm-description = Apprenez-en plus sur la machine virtuelle rapide, sûre et ouverte appelée WebAssembly, et lisez sa référence.
wasm-get-started-wasm-link = En savoir plus
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = Apprenez à construire, déboguer, profiler et déployer des applications WebAssembly avec Rust.
wasm-get-started-book-link = Lire le Livre
wasm-get-started-mdn-alt = logo MDN
wasm-get-started-mdn-description = En savoir plus sur WebAssembly en consultant Mozilla Developer Network.
wasm-get-started-mdn-link = Jeter un œil

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = Fonctionne bien avec JavaScript
wasm-js-augment-heading = Améliorez, ne remplacez pas
wasm-js-augment-description = Le rêve de WebAssembly n'est pas d'éliminer JavaScript, mais de collaborer étroitement pour doper les calculs lourds ou les tâches de bas niveaux &mdash; tâches qui bénéficient de l'efficacité de Rust.
wasm-js-toolchains-heading = Fonctionne avec les outils habituels
wasm-js-toolchains-description = Publiez des paquets WebAssembly en Rust dans des dépôts comme npm. Regroupez-les et distribuez-les avec webpack, Parcel et bien d’autres. Maintenez-les avec des outils comme <code>npm audit</code> et Greenkeeper.
wasm-js-interop-heading = Interopérabilité sans accroc
wasm-js-interop-description = Générez automatiquement du code de liaison entre Rust, WebAssembly et l'API JavaScript. Tirez avantage de bibliothèques comme <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> qui fournissent des associations prédéfinies avec l'intégralité de la plateforme web.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = Logo de cloudflare
wasm-production-cloudflare-quote = Nous pouvons compiler Rust en WASM, et l'exécuter depuis des fonctions Serverless embarquées dans le cœur même d’Internet. C'est incroyable et je suis impatient d'en faire encore plus.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = L'implémentation JavaScript [de la bibliothèque <code>source-map</code>] avait accumulé du code alambiqué pour des raisons de performance, et nous l'avons remplacé par du code Rust idiomatique. Rust ne nous force pas à choisir entre exprimer clairement l'intention du programme et la performance.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = Les propriétés de [Rust] rendent facile l'intégration du codec DivANS dans une page web avec WASM, comme montré ci-dessus.
wasm-production-dropbox-attribution = Daniel Reiter Horn et Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

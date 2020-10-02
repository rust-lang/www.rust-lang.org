### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Engranajes
wasm-why-rust-predictable-heading = Rendimiento predecible
wasm-why-rust-predictable-description = Sin pausas impredecibles del colector de basura. Sin caídas en el rendimiento del compilador JIT. Sólo control de bajo nivel combinado con ergonomía de alto nivel.
wasm-why-rust-small-code-alt = Un microscopio
wasm-why-rust-small-code-heading = Código generado reducido
wasm-why-rust-small-code-description = Reducir el código generado significa páginas que cargan más rápido. El <code>.wasm</code> generado por Rust no incluye relleno, como un colector de basura. El código muerto se elimina mediante <em>tree shaking</em> y optimizaciones avanzadas.
wasm-why-rust-amenities-alt = Equipaje
wasm-why-rust-amenities-heading = Comodidades modernas
wasm-why-rust-amenities-description = Un activo ecosistema de librerías para ayudarte a no empezar de cero. Abstracciones expresivas de coste cero. Y una comunidad que te ayuda a aprender.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = Logo de WebAssembly
wasm-get-started-wasm-description = Aprende más sobre WebAssembly, una máquina virtual rápida, segura y abierta, y lee su especificación.
wasm-get-started-wasm-link = Saber más
wasm-get-started-book-alt = Ferris y Wasm
wasm-get-started-book-description = ¡Aprende cómo construir, depurar, optimizar y desplegar aplicaciones WebAssembly usando Rust!
wasm-get-started-book-link = Leer el libro
wasm-get-started-mdn-alt = Logo de MDN
wasm-get-started-mdn-description = Aprende más sobre WebAssembly en Mozilla Developer Network
wasm-get-started-mdn-link = Echar un vistazo

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = Funciona bien junto a JavaScript
wasm-js-augment-heading = Amplía, no reemplaza
wasm-js-augment-description = El sueño de WebAssembly no es eliminar a JavaScript, sino funcionar conjuntamente, potenciando tareas de bajo nivel o de fuerte procesamiento &mdash; tareas que se benefician del enfoque de Rust en el rendimiento.
wasm-js-toolchains-heading = Funciona con las herramientas conocidas
wasm-js-toolchains-description = Publica paquetes de WebAssembly hechos en Rust en registros como npm. Empaqueta y sírvelos con webpack, Parcel u otros. Mantenlos usando <code>npm audit</code> o Greenkeeper.
wasm-js-interop-heading = Interoperación sin trabas
wasm-js-interop-description = Genera código automáticamente que una APIs en Rust, WebAssembly y JavaScript. Aprovecha bibliotecas como <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> que te permiten acceder a toda la plataforma web.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = Logo de Cloudflare
wasm-production-cloudflare-quote = Podemos compilar Rust a WASM e invocarlo desde funciones <em>serverless</em> engarzadas en la estructura misma de Internet. Es tremendo, estoy deseando seguir por este camino.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = Firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = La implementación [de la biblioteca de <code>source-map</code>] en JavaScript había crecido en código complicado por razones de rendimiento, y la reemplazamos por Rust idiomático. Rust no te hace elegir entre expresar claramente tu propósito y el rendimiento en tiempo de ejecución.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = Dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = Estas propiedades de [Rust] facilitan embeber el codec de DivANS en una página web con WASM, como hemos visto.
wasm-production-dropbox-attribution = Daniel Reiter Horn y Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

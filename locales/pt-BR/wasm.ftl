### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Engrenagens
wasm-why-rust-predictable-heading = Desempenho previsível
wasm-why-rust-predictable-description = Sem pausas imprevisíveis pelo <i>Garbage Collector<i>. Sem quedas de performance causadas pelo compilador JIT. Apenas controle de baixo nível acompanhado de ergonomia de alto nível.
wasm-why-rust-small-code-alt = Um microscópio
wasm-why-rust-small-code-heading = Código pequeno
wasm-why-rust-small-code-description = Código pequeno significa páginas carregando mais rápidamente. <code>wasm</code> gerado por Rust não inclui nada extra, como um <i>garbage collector<i>. Otimizações avançadas e técnica de <i>three shaking</i> para remoção de código não usado.
wasm-why-rust-amenities-alt = Bagagem
wasm-why-rust-amenities-heading = Amenidades modernas
wasm-why-rust-amenities-description = Um ecossistema ativo de bibliotecas para te ajudar a começar seus projetos rapidamente. Expressivo, abstrações de custo zero. E uma comunidade acolhedora para te ajudar a aprender.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = Logo de WebAssembly
wasm-get-started-wasm-description = Aprenda mais sobre a máquina virtual rápida, segura e aberta, chamada WebAssembly, e leia as suas normas.
wasm-get-started-wasm-link = Aprenda mais
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = Aprenda a criar, depurar, perfilar e implantar aplicações WebAssembly usando Rust!
wasm-get-started-book-link = Leia O Livro
wasm-get-started-mdn-alt = Logo MDN
wasm-get-started-mdn-description = Aprenda mais sobre WebAssembly na Rede de Desenvolvimento da Mozilla (MDN).
wasm-get-started-mdn-link = Confira

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = Funciona bem com JavaScript
wasm-js-augment-heading = Melhore, não substitua
wasm-js-augment-description = O sonho do WebAssembly não é acabar com o JavaScript, mas sim trabalhar junto para ajudar a lidar com tarefas de processamento pesado ou de baixo nível &mdash; tarefas que se beneficiam do foco de Rust em performance.
wasm-js-toolchains-heading = Funciona com conjunto de ferramentas familiares
wasm-js-toolchains-description = Publique pacotes de Rust WebAssembly em registros de pacotes como npm. Integre com o webpack, Parcel, e outros. Mantenha seus pacote com ferramentas como <code>npm audit</code> e Greenkeeper.
wasm-js-interop-heading = Interoperabilidade homogênea
wasm-js-interop-description = Gere automaticamente integração entre Rust, WebAssembly, e JavaScript. Aproveite de bibliotecas como <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> que provê integrações pré-empacotadas para toda a plataforma web.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = logo da cloudflare
wasm-production-cloudflare-quote = Você pode compilar Rust para WASM, e chamar o código a partir de funções Serverless amarradas as fundações da Internet. Isso é incrível e mal posso esperar para trabalhar mais nisso.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = A implementação em JavaScript [da biblioteca de <code>source-map</code>] acumulou muito código complicado em nome de performance, e nos trocamos isso por código idiomático em Rust. Rust não nos força escolher entre expressar claramente nossas intenções e performance durante execução.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = As propriedades { "[" }do Rust] torna fácil embarcar o codec DivANS em uma página web com WASM, como mostramos acima.
wasm-production-dropbox-attribution = Daniel Reiter Horn e Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Sistemas embarcados

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Um microscópio
embedded-pitch-analysis-heading = Analise estática poderosa
embedded-pitch-analysis-description = Garanta a configuração de pinos e periféricos durante o tempo de compilação. Garanta que recursos não serão usados de maneira não intencional por partes da sua aplicação.
embedded-pitch-memory-alt = Um pente de memória
embedded-pitch-memory-heading = Memória flexível
embedded-pitch-memory-description = Alocação dinâmica de memória é opcional. Use um alocador global e estruturas de dados dinâmicas. Ou evite o <i>heap</i> e aloque tudo estaticamente.
embedded-pitch-concurrency-alt = Engrenagens
embedded-pitch-concurrency-heading = Concorrência sem medo
embedded-pitch-concurrency-description = Rust torna impossível compartilhar estado acidentalmente entre <i>threads</i>. Use o método de concorrência que preferir, e você manterá as fortes garantias de Rust.
embedded-pitch-interop-alt = Aperto de mãos
embedded-pitch-interop-heading = Interoperabilidade
embedded-pitch-interop-description = Integre Rust em sua base de código atual em C, ou aproveite SDKs existentes para escrever suas aplicações em Rust
embedded-pitch-portability-alt = Carrinho de bagagens
embedded-pitch-portability-heading = Portabilidade
embedded-pitch-portability-description = Escreva bibliotecas ou <i>drivers</i> uma vez, e use-os em diversos sistemas, desde pequenos microcontroladores até poderosos <i>SBCs</i>.
embedded-pitch-community-alt = Logo com um Escudo
embedded-pitch-community-heading = Conduzido pela Comunidade
embedded-pitch-community-description = Como parte do projeto Rust de código aberto, o suporte para sistemas embarcados é movido por uma das melhores comunidades abertas, com suporte de parceiros comerciais.
embedded-learn-more-link = Aprenda mais

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Mostra
embedded-showcase-quote = "Eu estava tão empolgado quando conheci Rust, da Mozilla. Rust é uma linguagem de programação nova, com o lema de 'seguro, rápido, concorrente &ndash; escolha três'. O projeto também tem um futuro garantido, com uma comunidade de usuários poderosa e dedicada."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Consultor Senior, Cambridge Consultants
embedded-showcase-see-more-link = Veja mais
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Securing the future, with Rust</a> de <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> em <a href="https://vimeo.com">Vimeo</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = Pacote DIP-6
embedded-get-started-discovery-book-heading = O livro Discovery
embedded-get-started-discovery-book-description = Aprenda desenvolvimento embarcado do zero usando Rust!
embedded-get-started-embedded-rust-book-alt = Pacote TFQP-16
embedded-get-started-embedded-rust-book-heading = O livro sobre Embarcados em Rust
embedded-get-started-embedded-rust-book-description = Já familiarizado com desenvolvimento de Embarcados: Comece agora com Rust e comece a colher os benefícios.
embedded-get-started-embedonomicon-alt = Pacote BGA
embedded-get-started-embedonomicon-heading = O livro <i>Embedonomicon</i>
embedded-get-started-embedonomicon-description = Aprenda como funciona as bibliotecas fundacionais para sistemas embarcados.
embedded-get-started-read-link = Leia
embedded-get-started-more-documentation-link = Mais documentação

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Logo da Sensirion
embedded-testimonials-sensirion-quote = Na Sensirion nós recentemente usamos Rust para criar um demonstrador embarcado para o <a href="https://sensirion-automotive.com/products#PM2_5">Sensor de Material Particulado</a> da Sensirion. Por causa da fácil compilação cruzada e da disponibilidade de muitos <i>crates</i> de ótima qualidade no crates.io <b>nós rapidamente chegamos a um demostrador rápido e robusto.</b>
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Engenheiro Software, Sensirion
embedded-testimonials-airborne-alt = Logo da Airborne Engineering Ltd
embedded-testimonials-airborne-quote = Nós na Airborne Engineering Ltd. usamos Rust recentemente para escrever nosso <i>bootloader Ethernet</i>, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>, para nosso sistema interno de aquisição de dados. <b>Rust é uma linguagem promissora e estamos animados para usá-la em futuros projetos, embarcados ou não.</b>
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Engenheiro de Instrumentatação, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = Logo 49nord
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] nos permite entregar software mais rápido e mais correto do que imaginávamos ser possível. Graças a Rust, podemos tratar segurança de memória como uma garantia, enquanto outros benefícios de uma linguagem com custo zero de abstrações e um sofisticado sistema de tipos, nos ajudam a desenvolver software sustentavelmente. <b>Rust deixa nossos clientes felizes, e nossos engenheiros também.</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Logo da Terminal Technologies
embedded-testimonials-terminal-tech-quote = <b>Nós realmente achamos incrível que possamos usar uma boa linguagem moderna no ambiente dos sistemas embarcados</b>, onde geralmente não existem alternativas para C/C++
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Engenheiro de Software Senior, Terminal Technologies

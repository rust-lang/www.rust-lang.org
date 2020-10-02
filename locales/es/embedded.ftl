### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Dispositivos embebidos

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Un microscopio
embedded-pitch-analysis-heading = Análisis estático potente
embedded-pitch-analysis-description = Aplica la configuración de pins y periféricos en tiempo de compilación. Garantiza que los recursos no son usados accidentalmente por otras partes de tu aplicación.
embedded-pitch-memory-alt = Un módulo de RAM
embedded-pitch-memory-heading = Memoria flexible
embedded-pitch-memory-description = La gestión dinámica de memoria es opcional. Usa un gestor de memoria global y estructuras de datos dinámicas. O prescinde del <em>heap</em> y asigna espacio para todo estáticamente.
embedded-pitch-concurrency-alt = Engranajes
embedded-pitch-concurrency-heading = Concurrencia sin miedo
embedded-pitch-concurrency-description = Rust previene el estado compartido accidentalmente entre hilos. Usa concurrencia con el enfoque que desees, y siempre tendrás las fuertes garantías de Rust.
embedded-pitch-interop-alt = Apretón de manos
embedded-pitch-interop-heading = Interoperabilidad
embedded-pitch-interop-description = Integra Rust en tu código C ya existente o aprovecha uno de los SDKs disponibles para escribir una aplicación en Rust.
embedded-pitch-portability-alt = Carrito de equipaje
embedded-pitch-portability-heading = Portabilidad
embedded-pitch-portability-description = Escribe una biblioteca o driver una sola vez, y úsala en múltiples sistemas, desde pequeños microcontroladores hasta potentes placas integradas.
embedded-pitch-community-alt = Logo de un escudo
embedded-pitch-community-heading = Impulsado por la comunidad
embedded-pitch-community-description = Como parte del proyecto <em>open source<em> Rust, el soporte para sistemas embebidos está respaldado por una comunidad <em>open source</em> ejemplar, con apoyo de socios comerciales.
embedded-learn-more-link = Saber más

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Casos
embedded-showcase-quote = "Descubrir Rust, de Mozilla, fue muy excitante. Rust es un nuevo lenguaje de programación, con el eslógan 'seguro, rápido, concurrente &ndash; escoge tres'. Tiene además un futuro asegurado, con una comunidad de usuarios entregada y potente."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = Ver más
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Securing the future, with Rust</a> de <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> en <a href="https://vimeo.com">Vimeo</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = Paquete DIP-6
embedded-get-started-discovery-book-heading = El libro Discovery
embedded-get-started-discovery-book-description = Aprende desarrollo embebido desde cero, ¡usando Rust!
embedded-get-started-embedded-rust-book-alt = Paquete QFP-20
embedded-get-started-embedded-rust-book-heading = El libro de Embedded Rust
embedded-get-started-embedded-rust-book-description = ¿Ya tienes experiencia con desarrollo embebido? Iníciate en Rust y empieza a sacarle partido.
embedded-get-started-embedonomicon-alt = Paquete BGA
embedded-get-started-embedonomicon-heading = El Embedonomicon
embedded-get-started-embedonomicon-description = Descubre los detalles de las bibliotecas fundacionales en embebido.
embedded-get-started-read-link = Leer
embedded-get-started-more-documentation-link = Más documentación

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Logo de Sensirion
embedded-testimonials-sensirion-quote = En Sensirion hemos empezado a usar Rust recientemente para crear una demostración embebida de nuestro <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Gracias a la facilidad para compilar en múltiples plataformas y las muchas <em>crates</em> disponibles en crates.io de gran calidad, <b>acabamos rápidamente un prototipo rápido y robusto.</b>
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, ingeniero de software, Sensirion
embedded-testimonials-airborne-alt = Logo de Airborne Engineering Ltd
embedded-testimonials-airborne-quote = En Airborne Engineering usamos Rust recientemente para escribir un gestor de arranque por Ethernet, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>, para nuestro sistema interno de adquisición de datos. <b>Rust es un lenguaje prometedor, y estamos entusiasmados con usarlo en nuestros futuros proyectos, embebidos o no.
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, ingeniero de instrumentación, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = Logo de 49nord
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] nos permite desplegar software más correcto y más rápidamente de lo que imaginábamos. Gracias a Rust podemos dar la seguridad de memoria por sentada, mientras que otros beneficios de un lenguaje de coste cero con un sistema de tipos sofisticado nos ayudan a desarrollar software mantenible. <b>Rust hace felices a nuestros clientes, así como a nuestros ingenieros.</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Logo de Terminal Technologies
embedded-testimonials-terminal-tech-quote = <b>Creemos que es genial poder usar un lenguaje agradable y moderno en el área de embebido</b> donde habitualmente no hay alternativa a C o C++
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, ingeniero de software senior, Terminal Technologies

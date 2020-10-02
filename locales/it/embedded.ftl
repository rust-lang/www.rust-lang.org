### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Dispositivi embedded

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Un microscopio
embedded-pitch-analysis-heading = Potente static analysis del codice
embedded-pitch-analysis-description = Assicura la configurazione dei pin e delle periferiche in fase di compilazione. La garanzia che le risorse non saranno utilizzate da altre componenti dell'applicazione.
embedded-pitch-memory-alt = Una barra di RAM
embedded-pitch-memory-heading = Gestione flessibile della memoria
embedded-pitch-memory-description = L'allocazione dinamica della memoria è opzionale. Puoi usare un allocatore globale e strutture dati dinamiche. O escludere del tutto l'heap e allocare staticamente tutto.
embedded-pitch-concurrency-alt = Ingranaggi
embedded-pitch-concurrency-heading = Multi-thread senza paura
embedded-pitch-concurrency-description = Rust fa in modo che sia impossibile condividere accidentalmente stati fra differenti thread. Usa l'approccio al concurrency che preferisci, godrai comunque delle garanzie di Rust.
embedded-pitch-interop-alt = Stretta di mano
embedded-pitch-interop-heading = Interoperabilità
embedded-pitch-interop-description = Integra Rust nella tua base di codice esistente in C, o con utilizza un SDK che già conosci per scrivere un'applicazione.
embedded-pitch-portability-alt = Carrello con valigia
embedded-pitch-portability-heading = Portabilità
embedded-pitch-portability-description = Scrivi una libreria o un driver una sola volta e usala su più sistemi, dal microcontroller ai potenti SBC.
embedded-pitch-community-alt = Logo scudo
embedded-pitch-community-heading = Guidato dalla community
embedded-pitch-community-description = In quanto parte del progetto open source Rust, il supporto per sistemi embedded è guidato dalla migliore community open source, col supporto di partner commerciali.
embedded-learn-more-link = Scopri di più

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Casi di successo
embedded-showcase-quote = "Quando ho cominciato a usare Rust, creato da Mozilla, ero estremamente interessato. Rust è un nuovo linguaggio di programmazione, il suo motto è 'sicuro, veloce, concorrente: scegline tre!'. Il linguaggio ha anche un futuro garantito, grazie alla sua attivissima community."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = Scopri di più
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Securing the future, with Rust</a> da <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> su <a href="https://vimeo.com">Vimeo</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = DIP-6 package
embedded-get-started-discovery-book-heading = Il libro Discovery
embedded-get-started-discovery-book-description = Impara a sviluppare su embedded da zero con Rust!
embedded-get-started-embedded-rust-book-alt = QFP-20 package
embedded-get-started-embedded-rust-book-heading = Il libro Embedded Rust
embedded-get-started-embedded-rust-book-description = Sviluppi già su embedded? Mettici dentro Rust e comincia a raccoglierne i benefici.
embedded-get-started-embedonomicon-alt = BGA package
embedded-get-started-embedonomicon-heading = Embedonomicon
embedded-get-started-embedonomicon-description = Guarda sotto il cofano delle fondamentali librerie embedded.
embedded-get-started-read-link = Leggi
embedded-get-started-more-documentation-link = Ulteriore documentazione

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Logo Sensirion
embedded-testimonials-sensirion-quote = In Sensirion abbiamo di recente usato Rust per creare un embedded demonstrator del nostro <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Grazie alla semplicità con cui si può fare cross-compiling, alla disponibilità di molti pacchetti di alta qualità su crates.io, <b>siamo riusciti a mettere insieme rapidamente un robusto demonstrator.</b>
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Software Engineer, Sensirion
embedded-testimonials-airborne-alt = Logo Airborne Engineering Ltd
embedded-testimonials-airborne-quote = In Airborne Engineering Ltd. abbiamo di recente utilizzato Rust per scrivere un bootloader Ethernet, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>, per i nostri sistemi interni di acquisizione dati. <b>Rust è un linguaggio promettente e non vediamo l'ora di utilizzarlo per i nostri progetti futuri, sia embedded che non.</b>
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Instrumentation Engineer, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = Logo 49nord
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] ci ha permesso di scrivere software più velocemente e con miglior qualità di quello che pensavamo fosse possibile. Grazie a Rust, possiamo dare per scontata la sicurezza nella gestione della memoria; inoltre, i benefici di un linguaggio zero-overhead, associato a un sofisticato type system, ci aiutano a sviluppare software semplice da mantenere. <b>Rust soddisfa i nostri clienti, così come i nostri ingegneri.</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Logo Terminal Technologies
embedded-testimonials-terminal-tech-quote = <b>Crediamo che sia eccezionale poter usare un moderno linguaggio in ambito embedded</b> dove di solito non c'è alternativa al C/C++
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Senior Software Engineer, Terminal Technologies

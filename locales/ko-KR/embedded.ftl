### Translation file for https://www.rust-lang.org/what/embedded

## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Embedded devices


## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = A microscope
embedded-pitch-analysis-heading = Powerful static analysis
embedded-pitch-analysis-description =
        Enforce pin and peripheral configuration at compile time. Guarantee that resources won’t be used by unintended parts of your application.

embedded-pitch-memory-alt = A RAM stick
embedded-pitch-memory-heading = Flexible memory 
embedded-pitch-memory-description =
        Dynamic memory allocation is optional. Use a global allocator and dynamic data structures. Or leave out the heap altogether and statically allocate everything.

embedded-pitch-concurrency-alt = Gears
embedded-pitch-concurrency-heading = Fearless concurrency
embedded-pitch-concurrency-description =
        Rust makes it impossible to accidentally share state between threads. Use any concurrency approach you like, and you’ll still get Rust’s strong guarantees.

embedded-pitch-interop-alt = Handshake
embedded-pitch-interop-heading = Interoperability
embedded-pitch-interop-description =
        Integrate Rust into your existing C codebase or leverage an existing SDK to write a Rust application.

embedded-pitch-portability-alt = Luggage trolley
embedded-pitch-portability-heading = Portability
embedded-pitch-portability-description =
        Write a library or driver once, and use it with a variety of systems, ranging from very small microcontrollers to powerful SBCs.

embedded-pitch-community-alt = Shield Logo
embedded-pitch-community-heading = Community driven
embedded-pitch-community-description =
        As part of the Rust open source project, support for embedded systems is driven by a best-in-class open source community, with support from commercial partners.

embedded-learn-more-link = Learn more


## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Showcase

embedded-showcase-quote =
        “I was so excited when I came across Rust, from Mozilla. Rust is a new programming language, with the tag line ‘safe, fast, concurrent &ndash; pick three.’ It also has an assured future, with a powerful, committed user community.”
embedded-showcase-quote-attribution =
        &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = See More

embedded-showcase-video-description =
        <a href="https://vimeo.com/224912526">Securing the future, with Rust</a> from <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> on <a href="https://vimeo.com">Vimeo</a>.


## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = DIP-6 package
embedded-get-started-discovery-book-heading = The Discovery book
embedded-get-started-discovery-book-description =
        Learn embedded development from the ground up&mdash;using Rust!

embedded-get-started-embedded-rust-book-alt = QFP-20 package
embedded-get-started-embedded-rust-book-heading = The Embedded Rust book
embedded-get-started-embedded-rust-book-description =
        Already familiar with Embedded development? Jump in with Rust and start reaping the benefits.

embedded-get-started-embedonomicon-alt = BGA package
embedded-get-started-embedonomicon-heading = The Embedonomicon
embedded-get-started-embedonomicon-description =
        Look under the hood of foundational embedded libraries.

embedded-get-started-read-link = Read
embedded-get-started-more-documentation-link = More Documentation


## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Sensirion logo
embedded-testimonials-sensirion-quote =
        At Sensirion we recently used Rust to create an embedded demonstrator for Sensirion’s <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Due to the easy cross-compilation and the availability of many high quality crates on crates.io <b>we quickly ended up with a fast and robust demonstrator.</b>
embedded-testimonials-sensirion-attribution =
        &ndash; Raphael Nestler, Software Engineer, Sensirion

embedded-testimonials-airborne-alt = Airborne Engineering Ltd logo
embedded-testimonials-airborne-quote =
        At Airborne Engineering Ltd. we recently used Rust to write an Ethernet bootloader, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>, for our in-house data acquisition system. <b>Rust is a promising language and we’re excited to use it for our future projects, embedded and otherwise.</b>
embedded-testimonials-airborne-attribution =
        &ndash; Dr. Adam Greig, Instrumentation Engineer, Airborne Engineering Ltd.

embedded-testimonials-49nord-alt = 49nord logo

# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote =
        {"["}Rust] enables us to ship software faster and more correct than we thought possible. Thanks to Rust, we can take memory safety for granted, while other benefits of a zero-overhead language with a sophisticated type system help us develop maintainable software. <b>Rust makes our customers happy, as well as our engineers.</b>
embedded-testimonials-49nord-attribution =
        &ndash; Marc Brinkmann, CEO, 49nord

embedded-testimonials-terminal-tech-alt = Terminal Technologies logo
embedded-testimonials-terminal-tech-quote =
        <b>We think it’s really cool that we can use a modern nice language in the embedded space</b> where usually there’s no alternative to C/C++
embedded-testimonials-terminal-tech-attribution =
        &ndash; Aleksei Arbuzov, Senior Software Engineer, Terminal Technologies

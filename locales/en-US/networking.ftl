## templates/what/networking.hbs

what-networking-page-title = Networking

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust has a growing ecosystem of easy-to-use libraries for the web. Here are just two examples:
networking-get-started-post-json = POST some JSON
networking-get-started-take-json = Handle a JSON POST
networking-get-started-reqwest = Learn more about reqwest
networking-get-started-rocket = Learn more about Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Low footprint
networking-pitch-footprint =
    Take control over resource usage to keep memory and CPU footprint to a minimum.
    Get help from the compiler to make sure you’ve got it right.
    And do this with an ecosystem that is productive and pleasant to use.
networking-pitch-footprint-alt = A feather


networking-pitch-secure-header = Secure and reliable
networking-pitch-secure =
    Rust’s powerful type checker prevents whole classes of bugs.
    Make sure you know exactly when and where state is shared and mutated.
    Get help catching points of failure &mdash; before deployment.
networking-pitch-secure-alt = A shield


networking-pitch-concurrent-header = Concurrent at scale
networking-pitch-concurrent =
    Use any mixture of concurrency approaches that works for you.
    Rust will make sure you don’t accidentally share state between threads or tasks.
    It empowers you to squeeze every last bit of scaling, fearlessly.
networking-pitch-concurrent-alt = Connected gears


## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla =
    Migrating our Push connection infrastructure to Rust has provided us with an easier to maintain
    code-base with a focus on correctness while delivering fantastic performance. We are now
    handling up to 20 million websocket connections at once during peak hours with Rust servers.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla

networking-production-testimonial-buoyant =
    Rust is foundational to the Linkerd project’s technology roadmap. Its type system allows us to
    build modular, testable, composable units without sacrificing runtime performance. What’s been
    most surprising, though, is how Rust’s lifetime/borrow checking system allows us to avoid large
    classes of resource leaks. After 2 years, I really can’t imagine using any other language for
    the job.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>

networking-production-testimonial-1aim =
    Rust's powerful type system enables safe refactoring and catches many classes of bugs at
    compile time. Its low footprint and high performance, complemented by guaranteed memory safety
    and rock-solid error handling make it perfect for writing security critical and complex
    business logic for our backend. The ultra-high stability means that our Rust applications are
    the last part of our stack we ever have to worry about. We have been running a almost 100% Rust
    backend in production since end of 2015 and it has never failed us so far!

networking-production-testimonial-1aim-attribution = Yann Leretaille, <a href="{ $href }">1aim</a>

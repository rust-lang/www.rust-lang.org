### Translation file for https://www.rust-lang.org/what/wasm

## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly


## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Gears
wasm-why-rust-predictable-heading = Predictable performance
wasm-why-rust-predictable-description =
        No unpredictable garbage collection pauses. No JIT compiler performance cliffs. Just low-level control coupled with high-level ergonomics.

wasm-why-rust-small-code-alt = A microscope
wasm-why-rust-small-code-heading = Small code size
wasm-why-rust-small-code-description =
        Small code size means faster page loads. Rust-generated <code>.wasm</code> doesn’t include extra bloat, like a garbage collector. Advanced optimizations and tree shaking remove dead code.

wasm-why-rust-amenities-alt = Luggage
wasm-why-rust-amenities-heading = Modern amenities
wasm-why-rust-amenities-description =
        A lively ecosystem of libraries to help you hit the ground running. Expressive, zero-cost abstractions. And a welcoming community to help you learn.


## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = WebAssembly Logo
wasm-get-started-wasm-description =
        Learn more about the fast, safe, and open virtual machine called WebAssembly, and read its standard.
wasm-get-started-wasm-link = Learn More

wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description =
        Learn how to build, debug, profile, and deploy WebAssembly applications using Rust!
wasm-get-started-book-link = Read The Book

wasm-get-started-mdn-alt = MDN logo
wasm-get-started-mdn-description =
        Learn more about WebAssembly on the Mozilla Developer Network.
wasm-get-started-mdn-link = Check it out

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = Plays well with JavaScript

wasm-js-augment-heading = Augment, don’t replace
wasm-js-augment-description =
        The dream of WebAssembly is not to kill JavaScript but to work alongside of it, to help super charge processing-heavy or low-level tasks &mdash; tasks that benefit from Rust’s focus on performance.

wasm-js-toolchains-heading = Works with familiar toolchains
wasm-js-toolchains-description =
        Publish Rust WebAssembly packages to package registries like npm. Bundle and ship them with webpack, Parcel, and others. Maintain them with tools like <code>npm audit</code> and Greenkeeper.

wasm-js-interop-heading = Seamless interop
wasm-js-interop-description =
        Automatically generate binding code between Rust, WebAssembly, and JavaScript APIs. Take advantage of libraries like <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a> that provide pre-packaged bindings for the entire web platform.


## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = cloudflare logo
wasm-production-cloudflare-quote =
        We can compile Rust to WASM, and call it from Serverless functions woven into the very fabric of the Internet. That’s huge and I can’t wait to do more of it.
wasm-production-cloudflare-attribution =
        Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>

wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote =
        The JavaScript implementation [of the <code>source-map</code> library] has accumulated convoluted code in the name of performance, and we replaced it with idiomatic Rust. Rust does not force us to choose between clearly expressing intent and runtime performance.
wasm-production-mozilla-attribution =
        Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>

wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote =
        {"["}Rust’s] properties make it easy to embed the DivANS codec in a webpage with WASM, as shown above.
wasm-production-dropbox-attribution =
        Daniel Reiter Horn and Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

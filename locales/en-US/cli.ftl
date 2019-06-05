### Translation file for page: https://www.rust-lang.org/what/cli

## templates/what/cli.hbs

what-cli-page-title = Command-line apps


## templates/components/what/cli/pitch.hbs

cli-pitch-solid-img-alt = Shield with a checkmark
cli-pitch-solid-heading = Solid and quick
cli-pitch-solid-description = Even if you’re just writing a short one-off
        script, you can be confident it’s fast, easily testable, and gives
        helpful output.
cli-pitch-solid-link = Rust’s guarantees

cli-pitch-ship-img-alt = box with a checkmark
cli-pitch-ship-heading = Easy distribution
cli-pitch-ship-description = Compile everything down to a single binary&mdash;no
        need for your users to have a runtime or libraries installed.
cli-pitch-ship-link = How to ship Rust code

cli-pitch-config-img-alt = A note and a gear
cli-pitch-config-heading = Robust configuration
cli-pitch-config-description = Handle configuration files across platforms with
        ease.  Rust will deal with namespaces and formats for you.
cli-pitch-config-link = Start configuring

cli-pitch-manuals-img-alt = Help manual
cli-pitch-manuals-heading = Manuals? done.
cli-pitch-manuals-description = Generate manual pages for your app
        automatically.  Just package the generated files and you’re done.
cli-pitch-manuals-link = Learn how

cli-pitch-machines-img-alt = Pipes
cli-pitch-machines-heading = Data in, data out
cli-pitch-machines-description = In addition to talking to humans, Rust has
        great tools to help you talk to machines.
cli-pitch-machines-link = Communicate with machines

cli-pitch-logging-img-alt = 3 wood logs stacked on top of each other
cli-pitch-logging-heading = Flexible logging
cli-pitch-logging-description = It’s easy to add logging, and even easier to
        configure it to different targets and with different styles.
cli-pitch-logging-link = Log, trace, comprehend


## templates/components/what/cli/maintainable.hbs

cli-maintainable-heading = A maintainable code base

cli-maintainable-errors-img-alt = cli app structure
cli-maintainable-errors-heading = Catch errors <em>now</em>
cli-maintainable-errors-description = 
        What if the config file is missing or corrupt? What if the content of
        that one environment variable is empty? These cases are easy to forget
        about! But thanks to its approach to error handling and its library
        design, Rust will point out these “what if” situations before you even
        run your program.
cli-maintainable-errors-link = Rust’s error handling

cli-maintainable-refactoring-img-alt = cli is no rocket science
cli-maintainable-refactoring-heading = Easily extend later
cli-maintainable-refactoring-description = 
        Rust allows you to be flexible in the way you organize your code. Start
        with just a single file and, when you need more features, refactor your
        application with the confidence that you aren’t breaking anything.
cli-maintainable-refactoring-link = Refactoring Rust


## templates/components/what/cli/example.hbs

cli-example-description = Writing a command-line app is a great way to learn Rust.
cli-example-inputs-heading = Define your inputs
cli-example-main-heading = Write your tool
cli-example-link = Learn more with the CLI book


## templates/components/what/cli/production.hbs

cli-production-sentry-img-alt = sentry logo
cli-production-sentry-quote =
        One of the reasons we liked Rust was the crates.io ecosystem. [...]
        There is a lot of really good already existing infrastructure for
        building very nice command-line interfaces.
cli-production-sentry-attribution = &ndash; Armin Ronacher,
cli-production-sentry-link = Rust at Sentry &ndash; PolyConf 2017

cli-production-habitat-quote =
        I have zero regrets with living in this code base. […] This was sort of
        an added bonus for me: Using Rust to make CLI or console based tools. It
        is very good at compiling for different target systems.
cli-production-habitat-attribution = &ndash; Fletcher Nichol,
cli-production-habitat-link = Taking Rust to Production &ndash; RustFest Kyiv
cli-production-habitat-img-alt = Habitat logo

# wubwub
> the home of the new rust website

[![Build Status](https://travis-ci.com/rust-lang/wubwub.svg?token=hHeDp9pQmz9kvsgRNVHy&branch=master)](https://travis-ci.com/rust-lang/wubwub)

## Development

### Running the app locally

1. This is a [Rocket](https://rocket.rs/) app, which means we use the `nightly` channel of Rust. You can install it using [`rustup`](https://rustup.rs/) by running `rustup default nightly`. The Rust `nightly` that we deploy with is listed in the `RustConfig` file. If the latest `nightly` is not working for you, you should use the `nightly` version in that file.
1. Install `cargo watch` by running `cargo install cargo-watch` in your terminal.
1. To build the app and run the server, run `cargo watch -x run` in your terminal.
1. Navigate to http://localhost:7878 in your browser. If you make any updates to the styles, or any other project files, `cargo watch` will automatically restart the server for you, all you have to do is refresh your browser to see your changes.

### Where to edit

- If you would like to edit styles, you should edit [`src/styles/app.scss`](src/styles/app.scss). 
- If you would like to update group data, you should edit the `yml` files in [`src/data/`](src/data/).
- If you would like to edit page content, you should edit the `hbs` file in [`templates`](templates).

### Contributing

Please read our [`CONTRIBUTING.md`](CONTRIBUTING.md) before submitting a PR!

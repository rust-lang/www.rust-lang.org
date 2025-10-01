# www.rust-lang.org
> the home of the rust website

![CI](https://github.com/rust-lang/www.rust-lang.org/workflows/CI/badge.svg)

> [!NOTE]
> There are currently no reviewers for the translations available.
> If you have a suggestion to improve the translations, you may still open an issue for future reference.
> However, it likely won't be acted upon for the time being.

## Development

### Building the web locally

Execute `cargo run`. The web will be compiled into the `build` directory, from which you can serve it using a web server of your choice. For example, with Python it could be:

```console
$ cargo run
$ python3 -m http.server -d build
```

You can use `cargo watch -x run` to automatically rebuild the web once you make changes to it.

### Where to edit

- If you would like to edit styles, you should edit [`src/styles/app.scss`](src/styles/app.scss).
- If you would like to edit page content, you should edit the `hbs` files in [`templates`](templates).

### Contributing

Please read our [`CONTRIBUTING.md`](CONTRIBUTING.md) before submitting a PR!

### Deployment

www.rust-lang.org is currently hosted on GitHub Pages. The `main` branch is
automatically deployed to [www.rust-lang.org](https://www.rust-lang.org) after
each push.

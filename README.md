# wubwub
> the home of the new rust website

[![Build Status](https://travis-ci.com/rust-lang/wubwub.svg?token=hHeDp9pQmz9kvsgRNVHy&branch=master)](https://travis-ci.com/rust-lang/wubwub)

## Development

### Running the app locally

1. As this is a [Rocket](https://rocket.rs/) app, you must have the most current version of Rust nightly installed on your local machine. You can install it using [`rustup`](https://rustup.rs/) by running `rustup default nightly`.

1. After cloning the repo, run `cargo run` in your terminal. If you encounter any errors, you may need to update your version of Cargo by running `cargo update`.

1. Navigate to http://localhost:7878 in your browser. If you make any updates to the styles, they should automatically update in the browser on refresh. If they don't, you may have to force-quit the local server and run `cargo run` again.

### A few notes on style(s)

Colors and other variables go in `/src/styles/variables`.

If you add a new `.scss` file be sure to `@include` it in `/src/styles/app.scss`.

Be sure to put your styles in the applicable `.scss` files and compile to `.css`. Please don't write anything in the `.css` files, it will just be written over the next time you or someone else compiles the `.scss`.

The `skeleton.css` file comes from http://getskeleton.com/ and is a base upon which we are building. Feel free to pull out things from there that you would like to customize and add your altered version to our original SCSS.

### Using the linter

The linter is how we maintain a consistent code style throughout the project. This project's style rules are defined in `.stylelintrc` using [Stylelint](https://stylelint.io/). You can install Stylelint on your local machine by running `npm install -g stylelint`. There are a few ways to use the linter! You can do all or just some of them.

1. Install a linter package to your text editor of choice. I use Atom, so I installed [linter-stylelint](https://atom.io/packages/linter-stylelint), but you can probably find a [compatible package](https://stylelint.io/user-guide/complementary-tools/#editor-plugins) for your editor of choice.
1. Run `stylelint <path/to/file.scss>` (where `<path/to/file.scss>` is replaced by the actual path to your file) in your terminal and it will print out a nice list of all the rules you're breaking, right there in the terminal.

If you encounter a persistent linter error that you are certain you've fixed, try running `stylelint <path/to/file.scss> --fix` (where `<path/to/file.scss>` is replaced by the actual path to your file) in your terminal.

If you encounter a persistent linter error regarding a third-party CSS framework or other thing outside of your control, add the file to the list in the `.stylelintignore` file. Please only ignore third-party files that are not under your control. If you have the ability to fix the linter error or warning, it is preferable to do so.

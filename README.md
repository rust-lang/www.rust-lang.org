# rustmx.github.io
> El sitio oficial de RustMX (Aún en construcción)

[![Build Status](https://travis-ci.org/rust-lang/www.rust-lang.org.svg?branch=master)](https://travis-ci.org/rust-lang/www.rust-lang.org)

## Desarrollo

### Ejecutar un servidor local

1. Esta página está hecha con [Rocket](https://rocket.rs/), lo que significa que utiliza el canal de actualizaciones `nightly`. Puedes instalarlo con [`rustup`](https://rustup.rs/) ejecutando la orden `rustup default nightly`. El Rust `nightly` que desplegamos está en el archivo `RustConfig`. Si el `nightly` mas reciente no te funciona intenta usar la versión `nightly` en el archivo.
1. Instala `cargo watch` ejecutando `cargo install cargo-watch` en tu terminal.
1. Para construir y ejecutar el servidor, ejecuta la orden `cargo watch -x run` en tu terminal.
1. Ingresa a http://localhost:7878 en tu navegador. Si actualizaste los estilos, o cualquier otro archivo del proyecto, `cargo watch` actualizará el servidor por ti, solo necesitarás refrescar la pestaña de tu navegador para ver los cambios.

### Archivos a editar

- Si deseas editar los estilos, dirígete a [`src/styles/app.scss`](src/styles/app.scss). 
- Si deseas actualizar los datos grupales, ve a los archivos `yml` en [`src/data/`](src/data/).
- Si deseas editar el contenido de la página, puedes editar los archivos `hbs` en [`templates`](templates).

### Contribuciones

Please read our [`CONTRIBUTING.md`](CONTRIBUTING.md) before submitting a PR! (WORK IN PROGRESS)

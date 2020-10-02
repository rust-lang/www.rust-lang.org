## tools/index.hbs

tools-page-title = Herramientas
tools-editor-support-heading = Soporte de editores de primer nivel
tools-editor-support-description = Tanto si prefieres trabajar con el código desde la línea de comandos, o utilizando editores gráficos, Rust se integra con tu editor preferido. O puedes integrarlo por tu cuenta usando el <a href="https://github.com/rust-lang/rls">Rust Language Server</a>.
tools-build-heading = Lleva a cabo tus compilaciones con tranquilidad
tools-build-description = Cargo es la herramienta de construcción para Rust. Empaqueta todas las acciones comunes en un único comando. No necesitas repetir configuración.
tools-build-install-heading = Instala
tools-build-install-description = Con decenas de miles de paquetes, es muy probable que <a href="https://crates.io">crates.io</a> tenga la solución que estás buscando. Apóyate sobre los hombros de gigantes y haz que tu equipo pase de la repetición a la innovación.
tools-build-test-heading = Prueba
tools-build-test-description = Genera confianza en tu código a través de las excelentes herramientas de Rust para hacer pruebas. <code class = "nowrap">cargo test</code> es la solución unificada de Rust para hacer pruebas. Escribe las pruebas junto a tu código, o en archivos separados: una solución para todas las necesidades de pruebas.
tools-build-deploy-heading = Despliega
tools-build-deploy-description = <code class="nowrap">cargo build</code> crea binarios ajustados a cada plataforma. Con un solo comando tu código puede ser destinado a Windows, Linux, macOS, y la web. Todo es parte de una interfaz moderna, sin necesidad de archivos  compilados específicos.
tools-automation-heading = Velocidad mediante automatización
tools-automation-description = Las herramientas de calidad industrial de Rust facilitan la colaboración sin miedo, permitiendo a los equipos centrarse en las tareas que realmente importan.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt formatea automáticamente el código Rust, haciendo que sea más fácil de leer, escribir y mantener. Y más importante: nunca más será necesario debatir sobre el espaciado o la posición de las llaves.
tools-automation-rustfmt-link = Ir al repositorio
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>“Parece que estás escribiendo un iterador.”</i> <br> Clippy ayuda a los desarrolladores de todos los niveles de experiencia a escribir código idiomático, y hacer cumplir las normas.
tools-automation-clippy-link = Ir al repositorio
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = La documentación de Cargo hace que no haya API sin documentar. Está disponible localmente mediante <code class="nowrap">cargo doc</code>, y en línea en <a href="https://docs.rs">docs.rs</a> para crates públicas.
tools-automation-cargo-doc-link = Ir al sitio web

## tools/install.hbs

tools-install-page-title = Instalar Rust
install-using-rustup-heading = Usando rustup (recomendado)
install-rustup32-button = Descarga <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32 bits)</span>
install-rustup64-button = Descarga <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64 bits)</span>
install-notes-heading = Notas sobre la instalación de Rust
install-notes-getting-started-description = Si estás empezando con Rust y te gustaría una guía más detallada, visita nuestra pagina <a href="{ $getting-started-href }">cómo empezar</a>.
install-notes-rustup-heading = Gestión del conjunto de herramientas con <code>rustup</code>
install-notes-rustup-description =
    <p>
    Rust es instalado y gestionado por la herramienta 
    <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a>. 
    Rust tiene un
    <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
    proceso rápido de lanzamiento
    </a> de 6 semanas y soporta un
    <a href="https://forge.rust-lang.org/release/platform-support.html">gran número de plataformas</a>, así que hay muchas compilaciones de Rust disponibles en
    cualquier momento. <code>rustup</code> gestiona éstas compilaciones de forma consistente en cada plataforma que soporta Rust, habilitando la instalación de Rust
    de los canales de versiones beta y nightly, así como soporte para
    destinos adicionales de compilación cruzada.
    </p>
    <p>
    Si has instalado <code>rustup</code> en el pasado, puedes actualizar tu instalación ejecutando
    <code>rustup update</code>.
    </p>
    <p>
    Para más información visita la documentación de
    <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
          <code>rustup</code></a>.
    </p>
install-notes-uninstall-heading = Desinstalar Rust
install-notes-uninstall-description =
    <p>
      Si en algún momento quieres desinstalar Rust, puedes ejecutar
      <code>rustup self uninstall</code>.
      ¡Eso sí, te echaremos de menos!
    </p>
install-notes-path-heading = Configurar la variable de entorno <code>PATH</code>
install-notes-path-description =
    <p>
    En el entorno de desarrollo de Rust, todas las herramientas son instaladas en el directorio
    <span class="platform-specific not-win di">
    <code>~/.cargo/bin</code>
    </span>
    <span class="platform-specific win dn">
     <code>%USERPROFILE%\.cargo\bin</code>
    </span> y aquí es donde encontrarás el conjunto de herramientas de Rust,
    incluyendo <code>rustc</code>, <code>cargo</code>, and <code>rustup</code>.
    </p>
    <p>
    Por consiguiente, es habitual para los desarrolladores de Rust incluir este directorio en su variable de entorno
     <a href="https://en.wikipedia.org/wiki/PATH_(variable)">
    <code>PATH</code></a>. Durante la instalación <code>rustup</code> intentará configurar la variable <code>PATH</code>.
    Debido a las diferencias entre plataformas, consolas de comandos y errores en <code>rustup</code>, las modificaciones de la variable
    <code>PATH</code> podrían no tener efecto hasta que la consola sea reiniciada o el usuario cierre su sesión, o incluso no funcionar después de todo.
    </p>
    <p>
    Si después de la instalación, la ejecución de<code>rustc --version</code> en la consola falla, esta es la razón más probable.
    </p>
install-notes-windows-heading = Consideraciones para Windows
install-notes-windows-description =
    <p>
      En Windows, Rust adicionalmente requiere las herramientas de compilación de C++ para Visual Studio 2013 o posterior. La forma más sencilla de adquirir estas herramientas es instalando 
      <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
        Microsoft Visual C++ Build Tools 2019
      </a>
      que proporciona las herramientas de compilación de Visual C++. Alternativamente, puedes <a href="https://www.visualstudio.com/downloads/">instalar</a>
      Visual Studio 2019, Visual Studio 2017, Visual Studio 2015, o Visual
      Studio 2013 y durante el proceso de instalación seleccionar “C++ tools.”
    </p>
    <p>
      Para más información sobre la configuración de Rust en Windows, consulta la
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
      documentación específica de Windows para <code>rustup</code></a>.
    </p>
install-other-methods-heading = Otros métodos de instalación
install-other-methods-description = El proceso descrito anteriormente, usando <code>rustup</code>, es la forma preferida de instalar Rust para la mayoría de desarrolladores. Sin embargo, Rust también se puede instalar mediante otros métodos.
install-other-methods-link = Aprende más

## components/tools/rustup.hbs

tools-rustup-unixy = Parece que estás usando macOS, GNU/Linux u otra variante de Unix. Para descargar Rustup e instalar Rust, ejecuta el siguiente comando en tu terminal y sigue las instrucciones que aparecen en pantalla.
tools-rustup-windows-2 = Parece que estás usando Windows. Para empezar a usar Rust, descarga el instalador, ejecútalo y sigue las instrucciones que aparecen en pantalla. Es posible que tengas que instalar las <a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/">Visual Studio C++ Build tools</a> cuando se te pida. Si no estás usando Windows, ve a <a href="https://forge.rust-lang.org/infra/other-installation-methods.html"><em>"Other Installation Methods"</em></a>
tools-rustup-wsl-heading = Subsistema de Windows para Linux
tools-rustup-wsl = Si utilizas el Subsistema de Windows para Linux (WSL), ejecuta el siguiente comando en tu terminal y sigue las instrucciones que aparecen en pantalla para instalar Rust.
tools-rustup-unknown = Rust funciona en Windows, Linux, macOS, FreeBSD and NetBSD. Si estás en una de estas plataformas y ves esto, por favor, informa de un problema con los siguientes valores:
tools-rustup-report = Informar de un problema
tools-rustup-manual-unixy = Para instalar Rust, si usas Unix, <br>ejecuta el siguiente comando en tu terminal y sigue las instrucciones que aparecen en pantalla.
tools-rustup-manual-windows = Si usas Windows, <br>descarga y ejecuta <a href="https://win.rustup.rs">rustup‑init.exe</a> y sigue las instrucciones que aparecen en pantalla.
tools-rustup-manual-default = Para instalar Rust, si usas una variante de Unix como WSL, GNU/Linux o macOS, <br> ejecuta el siguiente comando en tu terminal y sigue las instrucciones que aparecen en pantalla.
tools-rustup-manual-default-windows = Si usas Windows, <br>descarga y ejecuta <a href="https://win.rustup.rs">rustup‑init.exe</a> y sigue las instrucciones que aparecen en pantalla.

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

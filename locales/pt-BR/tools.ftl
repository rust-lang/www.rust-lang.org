## tools/index.hbs

tools-page-title = Ferramentas
tools-editor-support-heading = Suporte de primeira classe em editores
tools-editor-support-description =
    Independente se você prefere trabalhar com código a partir
    da linha de comando, ou usando um editor gráfico, existe uma
    extensão Rust disponível para o editor da sua escolha. Ou você pode criar 
    a sua própria usando <a href="https://github.com/rust-lang/rls">Rust Language Server</a>.
tools-build-heading = Traga tranquilidade para a compilação
tools-build-description =
    Cargo é uma ferramenta de automação de compilação para Rust.
    Ela agrega todas as ações comuns em um único comando. Nenhum <i>boilerplate</i> é necessário.
tools-build-install-heading = Instale
tools-build-install-description = Com dezena de milhares de pacotes, é bem provável que você encontre no <a href="https://crates.io">crates.io</a> a solução que você procura. Suba nos ombros de gigantes, e mova sua equipe da repetição para a inovação.
tools-build-test-heading = Teste
tools-build-test-description = Traga confiança para seu código através das excelentes ferramentas de testes disponíveis em Rust. <code class="nowrap">cargo test</code> é a solução unificada para testar. Escreva testes próximos ao seu código, ou em arquivos separados: a solução para todas suas necessidades para testes.
tools-build-deploy-heading = Implante
tools-build-deploy-description = <code class="nowrap">cargo build</code> cria binários enxutos para todas as plataformas. Com apenas um comando seu código estará disponível para Windows, Linux, macOS, e na <i>web</i>. Tudo isso com uma interface moderna, sem requerer arquivos de configurações sob medidas.
tools-automation-heading = Velocidade através de automação
tools-automation-description = As ferramentas de qualidade industrial permitem a colaboração sem medo, deixando equipes focarem nas tarefas que realmente importam.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt formata automaticamente o código Rust, tornando-o mais fácil ler, escrever e manter. E o mais importante: nunca mais será necessário debater sobre espaçamento ou posições de chaves.
tools-automation-rustfmt-link = Vá para o repositório
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>"Parece que você está escrevendo um Iterator."</i><br>O Clippy ajuda pessoas com qualquer nível de experiência a escrever códigos idiomáticos, e garantir padrões.
tools-automation-clippy-link = Vá para o repositório
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description =
    A ferramenta de documentação do Cargo garante
    que nenhuma API fique sem documentação. Ela está
    disponível localmente através do comando 
    <code class="nowrap">cargo doc</code>, e online para <i>crates</i>
    públicas através de <a href="https://docs.rs">docs.rs</a>.
tools-automation-cargo-doc-link = Vá para o website

## tools/install.hbs

tools-install-page-title = Instale Rust
install-using-rustup-heading = Usando rustup (Recomendado)
install-rustup32-button = Baixar <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span>
install-rustup64-button = Baixar <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64-bit)</span>
install-notes-heading = Notas sobre a instalação de Rust
install-notes-getting-started-description =
    Caso você esteja apenas começando com Rust
    e gostaria de um tutorial mais detalhado, confira
    nossa página sobre <a href="{ $getting-started-href }">como começar</a>.
install-notes-rustup-heading = Gerenciamento de ferramentas com <code>rustup</code>
install-notes-rustup-description =
    <p>
      Rust é instalado e gerenciado pela ferramenta
      <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a>.
      Rust possui um rápido processo
    <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
    de lançamentos a cada 6 semanas
     </a> e suporta
      <a href="https://forge.rust-lang.org/release/platform-support.html">um grande número de plataformas</a>, 
    o que faz com que sempre existam uma grande quantidade de 
    binários.
    <code>rustup</code> gerencia esses binários consistentemente
    em todas as plataformas suportadas por Rust, permitindo a instalação
    do Rust desde a versão beta ou nightly até mesmo suporte adiciona de componentes para cross-compilação.
    </p>
    <p>
     Se você já instalou <code>rustup</code> no passado, você pode atualizar a instalação 
    executando <code>rustup update</code>.
    </p>
    <p>
      Para mais informações confira a documentação do
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
      <code>rustup</code></a>.
    </p>
install-notes-uninstall-heading = Desinstalar Rust
install-notes-uninstall-description =
    <p>
      Se a qualquer momento você desejar desinstalar Rust, você pode rodar
      <code>rustup self uninstall</code>.
      Porém, vamos sentir sua falta!
    </p>
install-notes-path-heading = Configurando a variável de ambiente <code>PATH</code>
install-notes-path-description =
    <p>
    No ambiente de desenvolvimento para Rust, todas as ferramentas são
    instaladas na pasta   <span class="platform-specific not-win di">
        <code>~/.cargo/bin</code>
      </span>
      <span class="platform-specific win dn">
        <code>%USERPROFILE%\.cargo\bin</code>
      </span>, onde você encontra todo o conjunto de ferramentas 
    de Rust, incluindo <code>rustc</code>, <code>cargo</code>,e <code>rustup</code>.
    </p>
    <p>
    Normalmente é comum para quem desenvolve Rust incluir esse diretório
    na <a href="https://en.wikipedia.org/wiki/PATH_(variable)">
      variável de ambiente <code>PATH</code></a>. 
    Durante a instalação do <code>rustup</code>, será feito uma tentativa de configurar a variável <code>PATH</code>.
    Por causa da diferença entre plataformas, terminais, e problemas no
      <code>rustup</code>, as mudanças feitas na variável <code>PATH</code> 
    podem não ser aplicadas até que o console seja reiniciado, o usuário do sistema entre novamente,
    ou até mesmo nunca.
    </p>
    <p>
      Se após a instalação a execução de <code>rustc --version</code> for reportado um erro, há uma grande chance de que a configuração não foi aplicada.
    </p>
install-notes-windows-heading = Considerações para Windows
install-notes-windows-description =
    <p>
     No Windows, Rust requer adicionalmente as ferramentas de compilação
    de C++ para o Visual Studio 2013 ou superior. A maneira mais fácil de conseguir
    essas ferramentas é instalando  o pacote <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
        Microsoft Visual C++ Build Tools 2019
      </a>
    que provê apenas as ferramentas de compilação de Visual C++.
    Alternativamente, você pode <a href="https://www.visualstudio.com/downloads/">instalar</a>
      o Visual Studio 2019, Visual Studio 2017, Visual Studio 2015, or Visual
      Studio 2013 and e durante a instalação incluir a opção de “Ferramentas para C++.”
    </p>
    <p>
    Para mais informações sobre como configurar Rust no Windows consulte a
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
    documentação específica sobre Windows do <code>rustup</code></a>.
    </p>
install-other-methods-heading = Outros métodos de instalação
install-other-methods-description =
    A instalação descrita acima, através
    do <code>rustup</code>, é a maneira preferida de instalação
    de muitas pessoas que desenvolvem Rust. Entretanto, Rust pode ser instalado
    por outros meios também.
install-other-methods-link = Aprenda mais

## components/tools/rustup.hbs

tools-rustup-unixy = Aparentemente você está rodando macOS, Linux, ou outro sistema similar ao Unix. Para fazer o download do Rustup e instalar Rust, execute o seguinte comando no seu terminal, e siga as instruções que surgirem na tela.
tools-rustup-windows-2 = Parece que você está rodando Windows. Para começar a usar Rust, baixe o instalador, em seguida rode o programa e siga as instruções na tela. Você pode precisar instalar o <a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/"><i>Visual Studio C++ Build tools</i></a> se solicitado durante o processo de instalação. Se você não está no Windows, veja <a href="https://forge.rust-lang.org/infra/other-installation-methods.html">"Outros Métodos de Instalação"</a>.
tools-rustup-wsl-heading = Windows Subsystem for Linux
tools-rustup-wsl = Se você for um usuário do Windows Subsystem for Linux (WSL) execute o seguinte comando no terminal, e siga as instruções na tela para a instalação de Rust.
tools-rustup-unknown = Rust funciona em Windows, Linux, macOS, FreeBSD e NetBSD. Se você estiver em alguma dessas plataformas e estiver vendo essa mensagem, então reporte um problema com as seguintes informações:
tools-rustup-report = Reporte um problema
tools-rustup-manual-unixy = Para instalar Rust, se você estiver rodando Unix, <br> execute o seguinte no seu terminal, e siga as instruções que surgirem na tela.
tools-rustup-manual-windows = Se você estiver rodando Windows, <br>baixe e execute <a href="https://win.rustup.rs">rustup‑init.exe</a>, e então siga as instruções que surgirem na tela.
tools-rustup-manual-default = Para instalar Rust, se você estiver rodando algum Unix como o WSL, Linux ou macOS, <br> execute o seguinte comando no seu terminal, e siga as instruções que surgirem na tela.
tools-rustup-manual-default-windows = Se você estiver rodando Windows, <br> faça o download e execute <a href="https://win.rustup.rs">rustup‑init.exe</a>, e então siga as instruções que aparecem na tela.

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

## tools/index.hbs

tools-page-title = Outils
tools-editor-support-heading = Support des éditeurs de premier choix
tools-editor-support-description = Que vous préfériez travailler avec du code depuis la ligne de commande, ou en utilisant un éditeur graphique riche, il y a une solution d'intégration disponible pour l'éditeur de votre choix. Ou bien vous pouvez bâtir la votre en utilisant le <a href="https://github.com/rust-lang/rls">Rust Language Server</a>.
tools-build-heading = Apportez de la sérénité à vos builds
tools-build-description = Cargo est l'outil de build pour Rust. Il rassemble toutes les actions communes en une seule commande. Pas besoin de configuration verbeuse.
tools-build-install-heading = Installer
tools-build-install-description = Avec des dizaines de milliers de packages, il y a de fortes chances que <a href="https://crates.io">crates.io</a> aie la solution que vous recherchez. Appuyez-vous sur les épaules des géants et faites passer votre équipe de la répétition à l’innovation.
tools-build-test-heading = Tester
tools-build-test-description = Soyez confiant en votre code grâce aux excellents outils de test de Rust. <code class="nowrap">cargo test</code> est la solution unifiée de test pour Rust. Écrivez vos tests à coté de votre code, ou dans un fichier séparé : il fournit une solution à tous les types de tests.
tools-build-deploy-heading = Déployer
tools-build-deploy-description = <code class="nowrap">cargo build</code> crée des binaires légers pour chaque plateforme. Avec une seule commande, votre code peut cibler Windows, Linux, Mac OS, et le web. Tout d'une interface moderne sans le besoin de fichiers de build spécialisés.
tools-automation-heading = La vitesse par l'automatisation
tools-automation-description = Les outils Rust, de qualité industrielle, rendent la collaboration sans crainte, permettant aux équipes de se concentrer sur les taches importantes.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt formate le code Rust automatiquement, le rendant plus facile à lire, écrire et maintenir. Et plus important : vous ne débattrez plus jamais de l'espacement ou du positionnement des crochets.
tools-automation-rustfmt-link = Aller au dépôt
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>“It looks like you’re writing an Iterator.”</i> <br> Clippy aide les développeurs de tous les niveaux d'expérience à écrire du code idiomatique et à forcer l'usage des standards.
tools-automation-clippy-link = Aller au dépôt
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = Le constructeur de documentation de Cargo fait en sorte qu'aucune API reste non documentée. Il est disponible localement via <code class="nowrap">cargo doc</code> et en ligne pour les crates publiques via <a href="https://docs.rs">docs.rs</a>.
tools-automation-cargo-doc-link = Aller sur le site

## tools/install.hbs

tools-install-page-title = Installer Rust
install-using-rustup-heading = Utiliser rustup (recommandé)
install-rustup32-button = Télécharger <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span>
install-rustup64-button = Télécharger <span class="nowrap"> rustup-init.exe</span> <span class="nowrap">(64-bit)</span>
install-notes-heading = Notes à propos de l'installation de Rust
install-notes-getting-started-description = Si vous commencez avec Rust et que vous souhaitez une visite guidée, visitez la page <a href="{ $getting-started-href }">commencer</a>.
install-notes-rustup-heading = Gestion des chaînes d'outils avec <code>rustup</code>
install-notes-rustup-description =
    <p>
      Rust est installé et géré par l'outil <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a>. Rust suit un 
      <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
        processus de publication rapide
      </a> avec une nouvelle version toutes les six semaines et il supporte un <a href="https://forge.rust-lang.org/release/platform-support.html">grand nombre de plateformes</a>, donc il y a de nombreuses versions de Rust disponibles en même temps. <code>rustup</code> gère ces différentes versions de manière consistante sur toutes les plateformes supportées par Rust, permettant l'installation de Rust depuis les canaux beta et nightly ainsi que le support de cibles de cross-compilation supplémentaires.
    </p>
    <p>
      Si vous avez installé <code>rustup</code> dans le passé, vous pouvez mettre à jour votre installation en exécutant : <code>rustup update</code>.
    </p>
    <p>
      Pour plus d'information, visitez la
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
      documentation de <code>rustup</code></a>.
    </p>
install-notes-uninstall-heading = Désinstaller Rust
install-notes-uninstall-description =
    <p>
      Si jamais vous voulez désinstaller Rust, vous pouvez exécuter
      <code>rustup self uninstall</code>.
      Mais vous nous manquerez !
    </p>
install-notes-path-heading = Configuration de la variable d’environnement <code>PATH</code>
install-notes-path-description =
    <p>
      Dans l’environnement de développement de Rust, tous les outils sont installés dans le répertoire 
      <span class="platform-specific not-win di">
        <code>~/.cargo/bin</code>
      </span>
      <span class="platform-specific win dn">
        <code>%USERPROFILE%\.cargo\bin</code>
      </span> et c'est là que vous trouverez la chaîne d'outils Rust incluant <code>rustc</code>, <code>cargo</code>, et <code>rustup</code>.
    </p>
    <p>
      Ainsi, il est de coutume pour les développeurs Rust d'inclure ce répertoire dans leur <a href="https://en.wikipedia.org/wiki/PATH_(variable)">variable d’environnement <code>PATH</code></a>. Pendant l'installation <code>rustup</code> essaiera de configurer le <code>PATH</code>.
      À cause des différences entre les plateformes, les shells de commande, ou de problèmes de <code>rustup</code>, la modification de <code>PATH</code> pourrait ne prendre effet qu'après le redémarrage de la console, après que l'utilisateur soit déconnecté , ou ne pas fonctionner du tout.
    </p>
    <p>
      Si, après l'installation, exécuter la commande <code>rustc --version</code> dans la console échoue, c'est probablement la raison.
    </p>
install-notes-windows-heading = Problématiques Windows
install-notes-windows-description =
    <p>
      Sous Windows, Rust requiert l'installation additionnelle des C++ build tools de Visual Studio 2013 ou supérieur. La façon la plus facile d'obtenir les build tools est d'installer <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">Microsoft Visual C++ Build Tools 2019</a> qui fournit uniquement les build tools de Visual C++. 
    Comme alternative, vous pouvez <a href="https://www.visualstudio.com/downloads/"> installer </a>
      Visual Studio 2019, Visual Studio 2017, Visual Studio 2015, ou Visual
      Studio 2013 en sélectionnant les "C++ tools" durant l’installation
    </p>
    <p>
      Pour plus d'informations sur la configuration de Rust sur Windows, visitez la
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
      documentation de <code>rustup</code> spécifique à Windows</a>.
    </p>
install-other-methods-heading = Autres méthodes d'installation
install-other-methods-description = L'installation décrite ci-dessus, via <code>rustup</code>, est la façon préférée d'installer Rust pour la majorité des développeurs. Cependant, Rust peut également être installé par d'autres méthodes.
install-other-methods-link = En apprendre plus

## components/tools/rustup.hbs

tools-rustup-unixy = Il semblerait que vous utilisez macOS, Linux ou un autre OS de type UNIX. Pour télécharger Rustup et installer Rust, exécutez la commande suivante dans votre terminal, puis suivez les instructions à l'écran.
tools-rustup-wsl-heading = Sous-système Windows pour Linux
tools-rustup-wsl = Si vous êtes un utilisateur du sous-système Windows pour Linux, exécutez la commande suivante dans votre terminal, puis suivez les instructions à l'écran.
tools-rustup-unknown = Rust fonctionne sur Windows, Linux, macOS, FreeBSD et NetBSD. Si vous êtes sur une de ces plateformes et voyez ceci, veuillez rapporter une erreur avec les valeur suivantes :
tools-rustup-report = Rapporter une erreur
tools-rustup-manual-unixy = Pour installer Rust, si vous utilisez Unix, <br> exécutez la commande suivante dans votre terminal, puis suivez les instructions à l'écran.
tools-rustup-manual-windows = Si vous êtes sous Windows,<br> téléchargez et exécutez <a href="https://win.rustup.rs">rustup‑init.exe</a>, puis suivez les instructions à l'écran.
tools-rustup-manual-default = Pour installer Rust, si vous utilisez un Unix comme le WSL, Linux ou macOS,<br> exécutez la commande suivante dans votre terminal, puis suivez les instructions à l'écran.
tools-rustup-manual-default-windows = Si vous utilisez Windows,<br> téléchargez et exécutez <a href="https://win.rustup.rs">rustup‑init.exe</a>, puis suivez les instructions à l'écran.

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

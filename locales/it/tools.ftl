## tools/index.hbs

tools-page-title = Strumenti
tools-editor-support-heading = Pieno supporto per gli editor
tools-editor-support-description = Sia che tu preferisca scrivere codice da riga di comando o usare un editor o IDE, troverai supporto a Rust nel tuo editor preferito. Oppure puoi semplicemente creare il supporto usando il <a href="https://github.com/rust-lang/rls">Rust Language Server</a>.
tools-build-heading = Porta serenità nelle tue build
tools-build-description = Cargo è lo strumento per compilare in Rust, racchiude tutte le azioni più comuni in un singolo comando. Nessun boilerplate.
tools-build-install-heading = Installa
tools-build-install-description =
    Con decine di migliaia di librerie, c'è una buona probabilità che <a href="https://crates.io">crates.io</a> abbia la soluzione che stai cercando. 
    Stai sulle spalle dei giganti e porta il tuo team dalla ripetizione portandolo verso l'innovazione.
tools-build-test-heading = Test
tools-build-test-description = Fidati del tuo codice grazie agli eccellenti strumenti per testare in Rust. <code class="nowrap">cargo test</code> è la soluzione unificata di Rust per il testing. Puoi scrivere i test accanto al tuo codice o organizzarli in file separati: la soluzione per tutte le esigenze.
tools-build-deploy-heading = Deploy
tools-build-deploy-description = <code class="nowrap">cargo build</code> crea binari efficienti per ogni piattaforma. Con un semplice comando il tuo codice è adatto per Windows, Linux, macOS e il web. Tutto con un'interfaccia moderna, senza bisogno di build file personalizzati.
tools-automation-heading = Rapidità grazie all'automazione
tools-automation-description = Gli strumenti di qualità di Rust rendono la collaborazione semplice, permettendo ai team di concentrarsi sulle cose importanti.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt formatta automaticamente il tuo codice Rust, rendendolo semplice da leggere, scrivere e mantenere. Ma soprattutto niente più dibattiti sugli spazi nel codice o la posizione delle parentesi.
tools-automation-rustfmt-link = Vai al repo
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>"Si direbbe che stai scrivendo un Iterator."</i><br> Clippy aiuta sviluppatori di qualunque livello a scrivere codice idiomatico applicando gli standard.
tools-automation-clippy-link = Vai al repo
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = Il compilatore della documentazione di Cargo fa in modo che non ci sia più una API senza documentazione. E' disponibile in locale tramite <code class="nowrap">cargo doc</code> e online per i crate pubblici <a href="https://docs.rs">docs.rs</a>.
tools-automation-cargo-doc-link = Vai al sito

## tools/install.hbs

tools-install-page-title = Installa Rust
install-using-rustup-heading = Usare rustup (Raccomandato)
install-rustup32-button = Scarica <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span>
install-rustup64-button = Scarica <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64-bit)</span>
install-notes-heading = Note sull'installazione di Rust
install-notes-getting-started-description = Se stai iniziando con Rust e vorresti una guida passo passo più dettagliata, guarda la nostra pagina <a href="{ $getting-started-href }">getting started</a> .
install-notes-rustup-heading = Gestione della toolchain con <code>rustup</code>
install-notes-rustup-description = Rust è installato e gestito da <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a>. Rust ha un rapido <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">ciclo di rilasci</a> di 6 settimane e supporta una <a href="https://forge.rust-lang.org/release/platform-support.html">grande quantità di piattaforme</a>, quindi ci sono sempre molteplici build di Rust disponibili. <code>rustup</code> gestisce queste build in maniera coerente su qualsiasi piattaforma supportata dalle release beta e nightly così come il supporto alla cross-compilation per differenti target.
install-notes-uninstall-heading = Disinstalla Rust
install-notes-uninstall-description =
    <p>
      Per disinstallare Rust in qualunque momento, esegui il comando
      <code>rustup self uninstall</code>.
      Peccato, ci mancherai!
    </p>
install-notes-path-heading = Configurare la variabile d'ambiente <code>PATH</code>
install-notes-path-description =
    <p>
    Nell'ambiente di sviluppo di Rust, tutti gli strumenti sono installati della directory
    <span class="platform-specific not-win di">
    <code>~/.cargo/bin</code>
    </span>
    <span class="platform-specific win dn">
    <code>%USERPROFILE%\.cargo\bin</code>
    </span> e qui dove troverai la toolchain, compresi <code>rustc</code>, <code>cargo</code> e <code>rustup</code>.
    </p>
    <p>
    Di conseguenza, è consuetudine tra gli sviluppatori di Rust di includere questa directory nella <a href="https://en.wikipedia.org/wiki/PATH_(variable)">
      variabile d'ambiente <code>PATH</code></a>. Durante l'installazione <code>rustup</code> cerca di configurare il <code>PATH</code>. A causa di differenze tra varie piattaforme,  differnti shell e bug presenti in <code>rustup</code>, le modifiche del <code>PATH</code> potrebbero non essere effettive finché la console non è stata riavviata, l'utente non ha effettuato il log-out, oppure potrebbe addirittura non essere mai effettiva.
    </p>
    <p>
    Se dopo l'installazione il comando <code>rustc --version</code> dovesse fallire, queste potrebbero essere le ragioni più probabili.
install-notes-windows-heading = Considerazioni per Windows
install-notes-windows-description =
    <p>
    In windows, Rust ha anche bisogno dell'ambiente di sviluppo C++ per Visual Studio 2013 (o successivo) installato. Il metodo più semplice per ottenerlo è installare il
    <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
     Microsoft Visual C++ Build Tools 2019
    </a>
    che fornisce solo gli strumenti di compilazione C++ per Visual Studio. In alternativa puoi <a href="https://www.visualstudio.com/downloads/">installare</a> Visual Studio 2019, Visual Studio 2017, Visual Studio 2015, oppure Visual
      Studio 2013 e durante l'installazione selezionare "C++ tools."
    </p>
    <p>
    Puoi trovare ulteriori informazioni su come configurare Rust in Windows a questo link di
    <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
      documentazione specifica per <code>rustup</code> su Windows</a>.
    </p>
install-other-methods-heading = Altri metodi di installazione
install-other-methods-description = Per la maggior parte degli utenti l'installazione di Rust tramite <code>rustup</code> è il metodo preferito. In ogni caso, Rust può essere anche installato attraverso altri metodi.
install-other-methods-link = Scopri di più

## components/tools/rustup.hbs

tools-rustup-unixy = Sembra che tu stia usando macOS, Linux o un altro sistema della famiglia Unix. Per scaricare Rustup e installare Rust esegui i seguenti comandi e segui le istruzioni a schermo.
tools-rustup-windows-2 = Sembra che il tuo sistema opertivo sia Windows. Per iniziare ad usare Rust, scarica l'installer, eseguilo ed infine segui i passaggi che ti vengono mostrati. Per completare l'installazione occorre installare <a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/">Visual Studio C++ Build tools</a>, ti verrà richiesto in caso risulti mancante. Se invece non sei su Windows, vai alla pagina <a href="https://forge.rust-lang.org/infra/other-installation-methods.html">"Other Rust Installation Methods"</a>.
tools-rustup-wsl-heading = Windows Subsystem per Linux
tools-rustup-wsl = Se stai usando Windows Subsystem for Linux esegui i seguenti comandi nel tuo terminale e segui le istruzioni a schermo per installare Rust.
tools-rustup-unknown = Rust gira su Windows, Linux, macOS, FreeBSD and NetBSD. Se stai usando una di queste piattaforme e stai vedendo questo messaggio segnala l'errore inserendo i seguenti valori:
tools-rustup-report = Segnala un problema
tools-rustup-manual-unixy = Se stai usando un sistema Unix, per installare Rust <br>esegui i seguenti comandi nel tuo terminale e segui le istruzioni a schermo.
tools-rustup-manual-windows = Se stai usando Windows,<br>scarica ed esegui <a href="https://win.rustup.rs">rustup‑init.exe</a> e segui le istruzioni a schermo.
tools-rustup-manual-default = Se stai usando un sistema Unix come WSL, Linux o macOS<br>esegui i seguenti comandi nel tuo terminale e segui le istruzioni a schermo.
tools-rustup-manual-default-windows = Se stai usando Windows,<br>scarica ed esegui <a href="https://win.rustup.rs">rustup‑init.exe</a> e segui le istruzioni a schermo.

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = Intellij IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Informativa sulla privacy
policies-privacy-page-version = <p>Versione { $version }, datata <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro =
    <p>
      Il progetto Rust sovraintende numerosi progetti, incluso il
      <a href="{ $baseurl }/">sito web Rust</a>,
      <a href="https://crates.io">crates.io</a>, e
      <a href="https://docs.rs">docs.rs</a>. Questa informativa sulla privacy spiega cosa
    facciamo con le vostre informazioni personali.
    </p>
policies-privacy-page-rust-lang-org-desc =
    <p>
      Il sito web di Rust, <a href="{ $baseurl }/">rust-lang.org</a>, é un progetto
      del <a href="{ $baseurl }/governance/teams/core">Core team</a> e del
      <a href="{ $baseurl }/governance/teams/community">Community team.</a>
    </p>
    
    <dl>
      <dt>log di chi visita il sito:</dt>
      <dd>
        Quando visiti il sito rust-lang.org, riceviamo il tuo indirizzo IP come parte
        dei log standard dei nostri server. Salviamo questi log per 1 anno.
      </dd>
    </dl>
policies-privacy-page-crates-io-desc =
    <p>
      <a href="https://crates.io">Crates.io</a> é gestito dai membri dei team
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a> e
      <a href="{ $baseurl }/governance/teams/core">Rust core</a>.
    </p>
    
    <dl>
      <dt>Login da GitHub:</dt>
      <dd>
        <p>
          Crates.io richiede agli utenti di avere un
          <a href="https://github.com">account GitHub</a>
          per effettuare il login e accedere al servizio. Quando effettui il login su Crates.io
          usando un account GitHub, riceviamo il tuo username e avatar GitHub. Se
          condividi un nome o un indirizzo email pubblico nel tuo profilo GitHub,
          riceviamo anche quelle informazioni.
        </p>
      </dd>
    
      <dt>Indirizzi email:</dt>
      <dd>
        <p>
          Devi avere un indirizzo email verificato per pubblicare un crate. Riceviamo
         qualsiasi indirizzo email pubblico sia associato al tuo account GitHub. Puoi
          anche scegliere di impostare un indirizzo differente da associare alle tue
          attività su Crates.io. Usiamo il tuo indirizzo email esclusivamente per comunicazioni
          riguardanti il tuo account.
        </p>
      </dd>
    
      <dt>Log delle visite:</dt>
      <dd>
        <p>
          Quando visiti il sito web Crates.io, riceviamo il tuo indirizzo IP e l'header user-agent
          come parte dei log standard dei nostri server. Salviamo questi log per 1
          anno.
        </p>
      </dd>
    
      <dt>Dati caricati nei crate:</dt>
      <dd>
        <p>
          Tutte i crate presenti in Crates.io sono pubblici, inclusa la lista degli username dei proprietari del crate e la data in cui é stato caricato. Chiunque può vedere o scaricare
          i contenuti di un crate. Poiché Crates.io é pubblico, qualsiasi
          dato personale incluso nel file Cargo.toml caricato in una
          crate sarà altrettanto pubblico. Per esempio, se un indirizzo email
          é nel campo 'authors' del file Cargo.toml, quell'indirizzo email
          sarà reso pubblico.
        </p>
        <p>
          Per la sua natura pubblica, fai attenzione quando includi informazioni
          private in un crate, potrebbero essere indicizzate dai motori
          di ricerca oppure usate da parti terze. Informazioni sensibili non andrebbero
          incluse in un file all'interno del crate.
        </p>
      </dd>
    
      <dt>Publicazione di dati relativi al sito: </dt>
      <dd>
        <p>
          Crates.io usa le Google Visualization API per create i grafici per ogni
          crate visualizzando i download degli ultimi 90 giorni. Questi grafici possono essere
          visualizzati in basso nella pagina di ogni crate.
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc =
    <p>
      <a href="https://docs.rs">Docs.rs</a> é gestito dai membri del
      <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">Rustdoc team</a>
      e del <a href="{ $baseurl }/governance/teams/core">Rust core team</a>. Il
      progetto raccoglie e usa i dati come descritto in questa informativa sulla privacy.
    </p>
    
    <p>
      Docs.rs é un progetto open-source per l'hosting della documentazione dei crate per il
      linguaggio di programmazione Rust. Genera automaticamente la documentazione dei crate
      pubblicati su <a href="https://crates.io">crates.io</a> usando la release nightly
      del compilatore Rust. Tutte le informazioni dei crate che sono
      pubblicate su docs.rs sono anche pubblicamente disponibili su crates.io.
    </p>
policies-privacy-page-forums-title = Forum
policies-privacy-page-forums-desc =
    <p>
      <a href="{ $baseurl }/governance/teams/community">Il Community team di Rust</a>
      gestisce il
      <a href="https://users.rust-lang.org">Forum degli utenti</a> e il
      <a href="https://internals.rust-lang.org">Forum interno</a>. I post
      su questi forum sono pubblichi. Se ti iscrivi per partecipare in questi forum, informazioni come il tuo nome e il tuo indirizzo email saranno raccolte. In quanto amministratori del forum,
      abbiamo accesso alle informazioni sulle tue interazioni col forum, come ad esempio
      i post pubblicati, quelli letti e il tempo speso nel sito.
    </p>
policies-privacy-page-third-parties-title = Servizi di terze parti
policies-privacy-page-third-parties-desc =
    <p>
      Il Forum degli utenti e i Forum Interni su rust-lang.org sono ospitati su
      <a href="https://www.discourse.org/">Discourse</a> e usano la piattaforma
      di discussioni open source. La privacy policy di Discourse é disponibile
      <a href="https://www.discourse.org/privacy">qui</a>.
    </p>
    
    <p>
      Usiamo Mailgun per mandare le email. La privacy policy di Mailgun é disponibile
      <a href="https://www.mailgun.com/privacy-policy">qui</a>.
    </p>
    
    <p>
      Il login tramite GitHub é usato per l'autenticazione in Crates.io e (opzionalmente) nei
      forum. L'informativa sulla Privacy di GitHub la trovate
      <a href="https://help.github.com/en/articles/github-privacy-statement">qui</a>.
    </p>
    
    <p>
      Alcuni membri del team Rust usano le piattaforme Zulip e Discord per
      collaborare nella comunity. L'informativa sulla Privacy di Zulip é disponibile
      <a href="https://zulipchat.com/privacy/">qui</a>.
      L'informativa sulla Privacy di Discord é disponibile
      <a href="https://discordapp.com/privacy">qui</a>.
    </p>
policies-privacy-page-contact-title = Contatti
policies-privacy-page-contact-desc =
    <p>
      Per richieste di accesso ai dati o qualsiasi domanda riguardante questa
      Informativa sulla Privacy, chiedi pure supporto all'indirizzo email
      <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>
    </p>
    
    <p>In alternativa, puoi contattarci a questo indirizzo:</p>
    
    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

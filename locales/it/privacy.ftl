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
policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      <a href="https://crates.io">Crates.io</a> è gestito dai membri del
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a> e dei
      <a href="{ $baseurl }/governance/teams/core">Rust core</a> team.
    </p>
    
    <dl>
      <dt>Accesso tramite GitHub:</dt>
      <dd>
        <p>
          Crates.io richiede agli utenti di loggarsi tramite un
          <a href="https://github.com">GitHub account</a>
          per usare il servizio. Quando fai login in Crates.io
          tramite un account GitHub riceviamo il tuo GitHub username e avatar.
          Se condividi un nome e un indirizzo pubblico nel tuo profilo GitHub,
          riceviamo anche questi.
        </p>
      </dd>
    
      <dt>Indirizzi email:</dt>
      <dd>
        <p>
          Per poter pubblicare un crate occorre un indirizzo email verificato.
          Crates.io riceve già un eventual tuo indirizzo email pubblico del tuo
          profilo GitHub. Puoi decidere di utilizzare un altro indirizzo email
          da associare a Crates.io. Ti contattero su questo indirizzo email soltanto
          per motivi riguardanti il tuo account.
        </p>
      </dd>
    
      <dt>Log delle visite:</dt>
      <dd>
        <p>
          Quando visiti il sito docs.rs riceviamo il tuo indirizzo IP e l'header User-Agent in quanto parte dei nostri log standard. Conserviamo questi log per un anno.
        </p>
      </dd>
    
      <dt>Informazioni caricate insieme al crate:</dt>
      <dd>
        <p>
          Tutte le informazioni su Crates.io sono pubbliche, inclusa la lista dei
          crate e data di upload. Chiunque puo' vedere o scaricare il contenuto di
          un crate. Poiché Crates.io é pubblico, qualunque dato personale incluso nel
          file Cargo.toml sarà di conseguenza pubblico. Ad esempio, se c'è un indirizzo email
          nel campo `authors` del Cargo.toml, quell'indirizzo email sarà anch'esso pubblico.
        </p>
        <p>
          Data la natura pubblica di un crate, ricorda che qualunque informazione
          privata che potrebbe essere in un crate viene indicizzata da motori di ricerca
          o usata da terze parti. Informazioni sensibili non dovrebbero esser incluse in un crate.
        </p>
      </dd>
    
      <dt>Pubblicazione di dati relativi al sito: </dt>
      <dd>
        <p>
          Crates.io utilizza le Google Visualization API per creare grafici dei download degli ultimi 
          90 giorni per ogni crate. Questi grafici possono essere visti in fondo alla pagina di ciascun crate.
        </p>
      </dd>
    
      <dt>Monitoring degli errori:</dt>
      <dd>
        <p>
          Crates.io utilizza Sentry, un servizio di monitoraggio degli errori, per
          aiutare il team a trovare e sistemare problemi di performance. Quando si verifica un errore
          Sentry riceve informazioni di base su come hai interagito col sito e le azioni
          che hanno causato l'errore. Inoltre. il tuo indirizzo IP puo' essere comunicato a Sentry in
          quanto parte del processo di reporting. Abbiamo tuttavia configurato Sentry affinché cancelli
          questo dato non appena ricevuto. Qui puoi leggere la <a href="https://sentry.io/privacy/">Privacy Policy</a> di Sentry.
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc--2020-09 =
    <p>
      <a href="https://docs.rs">Docs.rs</a> è gestito dai membri del
      <a href="{ $baseurl }/governance/teams/dev-tools#docs-rs">docs.rs team</a>
      e del <a href="{ $baseurl }/governance/teams/core">Rust core team</a>.
    </p>
    
    <dl>
      <dt>Log delle visite:</dt>
      <dd>
        <p>
          Quando visiti il sito docs.rs riceviamo il tuo indirizzo IP e l'header User-Agent in quanto parte dei nostri log standard. Conserviamo questi log per un anno.
        </p>
      </dd>
    </dl>
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

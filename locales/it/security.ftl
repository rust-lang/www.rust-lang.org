### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Policy di sicurezza
security-reporting-heading = Segnalazioni
security-reporting-link = contatta { ENGLISH("security@rust-lang.org") }
security-reporting-description =
    <p>La sicurezza è uno dei principi fondamentali di Rust, e per questo fine vogliamo assicurarci che l'implementazione sia sicura. Vi ringraziamo per il tempo che impiegherete per comunicarci in modo responsabile eventuali problemi riscontrati.</p>
    <p>Qualunque bug di sicurezza in una distribuzione di Rust dovrebbe essere comunicato via email a { -security-at-rust-lang-org-anchor }. Questa mailing list inoltra l'email a un piccolo team addetto alla sicurezza. La segnalazione verrà presa in carico entro 24 ore, riceverete una risposta dettagliata entro 48 ore. Se preferite, potete criptare la segnalazione usando <a href="{ -rust-security-team-key-href }">la nostra chiave GPG pubblica</a>. Questa chiave è disponibile anche <a href="{ -rust-pgp-key-mit-keyserver-href }">sul keyserver del MIT</a> ed è copiata <a href="#security-pgp-key">qua sotto</a>.</p>
    <p>Questo indirizzo email riceve molto spam, quindi assicuratevi che l'oggetto sia chiaro per evitare che la segnalazione non venga notata. Dopo una prima risposta, il team addetto alla sicurezza farà in modo di tenervi informati sui progressi, al fine di sistemare il problema e rilasciare un completo annuncio pubblico. Come raccomandato dalla <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>, questi aggiornamenti saranno inviati almeno ogni cinque giorni. In realtà, è più probabile che vengano emanati ogni 24-48 ore.</p>
    <p>Se non ricevete una risposta alla mail entro 48 ore, o non avete ricevuto notizie dal team nel giro di cinque giorni, ci sono alcune cose che potete fare (nell'ordine):</p>
      <ul>
        <li>Contattare direttamente l'attuale coordinatore della sicurezza ({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">chiave GPG pubblica</a>))</li>
        <li>Contattare direttamente il coordinatore in seconda ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">chiave GPG pubblica</a>))</li>
        <li>Pubblicare una segnalazione sul <a href="{ -internals-rust-lang-org-href }">forum dello sviluppo interno</a></li>
      </ul>
    <p>Per favore tenete presente che le discussioni sul forum sono pubbliche. Se decidete di comunicare una segnalazione, non discutetene in pubblico. Per favore limitatevi a cercare di contattare qualcuno del team della sicurezza.</p>
security-disclosure-heading = Policy di sicurezza
security-disclosure-description =
    <p>Il progetto Rust utilizza un processo di pubblicazione delle segnalazioni in cinque passi:</p>
    <ol>
      <li>La segnalazione di sicurezza viene ricevuta e assegnata a un primo responsabile. Questa persona coordinerà la gestione del processo di correzione e rilascio.</li>
      <li>Il problema viene confermato e viene redatta una lista delle versioni affette dal problema.</li>
      <li>I sorgenti vengono verificati per trovare eventuali altri problemi simili.</li>
      <li>La correzione viene preparata per ogni versione ancora supportata. Queste correzioni non saranno committate su un repository pubblico ma tenute in locale in attesa di un annuncio pubblico.</li>
      <li>Il giorno della pubblicazione della segnalazione, la <a href="{ -rustlang-security-announcements-google-groups-forum-href }">mailing list di sicurezza di Rust</a> manderà copia dell'annuncio. Le modifiche saranno inviate sul repository pubblico e le nuove build pubblicate su rust-lang.org. Entro 6 ore, la mailing list sarà notificata e una copia della segnalazione sarà pubblicata sul blog Rust</li>
    </ol>
    <p>Per questo processo occorre tempo, specialmente quando il coordinamento richiede mantainer di altri progetti. Verrà fatto ogni sforzo per gestire il bug nel minor tempo possibile, ma comunque à importante seguire il processo di rilascio per assicurare che la pubblicazione sia gestita in modo coerente.</p>
security-receiving-heading = Ricevere gli aggiornamenti di sicurezza
security-receiving-description =
    <p>Il modo migliore per ricevere gli annunci di sicurezza è sottoscrivere la <a href="{ -rust-security-announcements-mailing-list-href }">mailing list per gli annunci di sicurezza</a> (in alternativa mandare una mail a { -rustlang-security-announcements-subscribe-anchor }). La mailing list ha poco traffico e riceve le notifiche al momento che la pubblicazione à decisa.</p>
    <p>Annunceremo le vulnerabilità di sicurezza 72 ore prima che la pubblicazione sia autorizzata su { -distros-openwall-email-anchor }, in modo che le distribuzioni Linux possano aggiornare i propri pacchetti.</p>
security-pgp-key-heading = Chiave GPG in formato testo

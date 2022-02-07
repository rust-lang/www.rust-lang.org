### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Policy di sicurezza
security-reporting-heading = Segnalazioni
security-reporting-link = contatta { ENGLISH("security@rust-lang.org") }
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

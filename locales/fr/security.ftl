### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Politique de sécurité
security-reporting-heading = Signaler
security-reporting-link = email { ENGLISH("security@rust-lang.org") }
security-disclosure-heading = Politique de divulgation
security-disclosure-description =
    <p>Le projet Rust dispose d'un processus de divulgation en cinq étapes.</p>
    <ol>
      <li>Le rapport de sécurité est reçu et est affecté à un responsable. Cette personne coordonnera le processus de correction et de sa diffusion.</li>
      <li>Le problème est confirmé et la liste de l'ensemble des versions impactées est déterminée.</li>
      <li>Le code est audité afin de repérer potentiellement tout problème analogue.</li>
      <li>Des correctifs sont préparés pour toutes les versions qui sont encore maintenues. Ces correctifs ne sont pas transmis sur le dépôt public mais plutôt conservés de façon locale en attendant l'annonce.</li>
      <li>À la date d'embargo, la <a href="{ -rustlang-security-announcements-google-groups-forum-href }">liste de diffusion d'annonces de sécurité</a> reçoit une copie de l'annonce. Les modifications sont poussées sur le dépôt public et les nouvelles versions sont déployées sur rust-lang.org. D'ici 6 heures après cette première diffusion, une copie d'information est publiée sur le blog Rust.</li>
    </ol>
    <p>Ce processus peut prendre un certain temps, notamment lorsqu'il est nécessaire de coordonner différents mainteneurs impliqués sur d'autres projets. Tous les efforts seront faits afin de résoudre le bug de la façon la plus réactive possible, cependant il est important de respecter le processus de déploiement des versions ci-dessus afin de s'assurer que la divulgation est gérée de façon consistante.</p>
security-receiving-heading = Recevoir des mises à jour de sécurité
security-pgp-key-heading = Clé PGP en texte brut

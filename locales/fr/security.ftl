### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Politique de sécurité
security-reporting-heading = Signaler
security-reporting-link = email { ENGLISH("security@rust-lang.org") }
security-reporting-description =
    <p>La sécurité est un des principes fondateurs de Rust ; aussi nous voudrions nous assurer que l’implémentation de Rust est bien sécurisée. Merci de prendre le temps de divulguer de manière responsable tout problème que vous trouveriez.</p>
    <p>Tout bug de sécurité dans la distribution Rust doit être reporté par email à { -security-at-rust-lang-org-anchor }. Cette liste est envoyée à une petite équipe de sécurité. Votre message sera pris en compte dans les 24 heures, et vous recevrez une réponse plus détaillée dans les 48 heures, indiquant les prochaines étapes dans le traitement de votre rapport. Si vous le souhaitez, vous pouvez chiffrer votre rapport en utilisant <a href="{ -rust-security-team-key-href }">notre clé publique</a>. Cette clé est également <a href="{ -rust-pgp-key-mit-keyserver-href }">sur le serveur de clés du MIT</a> et <a href="#security-pgp-key">reproduite ci-dessous</a>.</p>
    <p>Cette adresse email reçoit une quantité importante de spam, donc assurez-vous que l'objet du message est descriptif pour éviter que votre rapport soit ignoré. Après la réponse initiale à votre rapport, l'équipe de sécurité vous tiendra au courant de l’avancement vers un correctif et une annonce complète. Comme recommandé par la <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>, ces mises à jour seront envoyées au moins tous les cinq jours. En réalité, cela sera plus probablement toutes les 24 à 48 heures.</p>
    <p>Si vous n'avez pas reçu de réponse à votre email dans les 48 heures, ou n'avez rien reçu de le part de l'équipe de sécurité ces cinq derniers jours, il y a plusieurs étapes que vous pouvez suivre (dans l'ordre):</p>
    <ul>
      <li>Contacter directement le coordinateur actuel de l'équipe de sécurité ({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">clé publique</a>)).</li>
      <li>Contacter directement le correspondant suppléant ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">clé publique</a>)).</li>
      <li>Publier sur les <a href="{ -internals-rust-lang-org-href }">forums internes</a></li>
    </ul>
    <p>Veuillez noter que les forums de discussion sont des zones publiques. En recourant à ces lieux, veillez à ne pas discuter de votre problème. Expliquez simplement que vous essayez de joindre un membre de l'équipe de sécurité.</p>
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
security-receiving-description =
    <p>La meilleure façon de recevoir toutes les annonces de sécurité est de s'abonner à la <a href="{ -rust-security-announcements-mailing-list-href }">liste de diffusion d'annonces de sécurité</a> (ou alternativement en envoyant un mail à { -rustlang-security-announcements-subscribe-anchor }). Cette liste de diffusion a un très faible trafic, et reçoit les notifications publiques dès que l'embargo est levé.</p>
    <p>Nous annoncerons les vulnérabilités 72 heures avant la levée de l'embargo sur { -distros-openwall-email-anchor }, afin que les distributions Linux puissent mettre à jour leurs paquets.</p>
security-pgp-key-heading = Clé PGP en texte brut

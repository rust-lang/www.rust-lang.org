### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Avis de confidentialité de Rust
policies-privacy-page-version = <p> Version { $version }, le <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro =
    <p>¶
      Le projet Rust inclut un certain nombre de projets, dont le¶
      <a href="{ $baseurl }/">site web Rust</a>,¶
      <a href="https://crates.io">crates.io</a>, et¶
      <a href="https://docs.rs">docs.rs</a>. L’avis de confidentialité explique¶
      ce que nous faisons des informations personnelles.¶
    </p>
policies-privacy-page-rust-lang-org-desc =
    <p>¶
      Le site web Rust — <a href="{ $baseurl }/">rust-lang.org</a> — est un projet¶
      de <a href="{ $baseurl }/governance/teams/core">l’équipe principale (Core)</a> ainsi que de¶
      <a href="{ $baseurl }/governance/teams/community">l’équipe communauté.</a>¶
    </p>¶
    ¶
    <dl>¶
      <dt>Historique des visiteurs :</dt>¶
      <dd>¶
        Lorsque vous visitez rust-lang.org, nous stockons votre adresse IP au sein de¶
        nos logs serveurs. Nous conservons ces logs pendant 1 an.¶
      </dd>¶
    </dl>
policies-privacy-page-crates-io-desc =
    <p>¶
      <a href="https://crates.io">Crates.io</a> est géré par les membres de¶
      <a href="{ $baseurl }/governance/teams/crates-io">l'équipe Crates.io</a> ainsi que ¶
      <a href="{ $baseurl }/governance/teams/core">l'équipe principale de Rust (Core)</a>.¶
    </p>¶
    ¶
    <dl>¶
      <dt>S’identifier avec GitHub :</dt>¶
      <dd>¶
        <p>¶
          Crates.io requiert un¶
          <a href="https://github.com">compte GitHub</a>¶
          afin de s’identifier et de pouvoir utiliser le service. Lorsque vous vous connectez à Crates.io¶
          en utilisant un compte GitHub, nous recevons votre nom d’utilisateur GitHub ainsi que votre avatar. Si¶
          vous partagez publiquement un nom d’affichage ou une adresse e-mail sur votre profil GitHub,¶
          nous recevons aussi ces informations.¶
        </p>¶
      </dd>¶
    ¶
      <dt>Adresses e-mail:</dt>¶
      <dd>¶
        <p>¶
          Vous devez disposer d’une adresse e-mail vérifiée pour publier une crate. Nous recevons¶
          toute adresse e-mail associée publiquement à votre compte GitHub. Vous pouvez¶
          aussi choisir d’associer votre activité avec une adresse différente sur Crates.io.¶
          Nous n'utiliserons votre adresse e-mail que pour vous contacter¶
          au sujet de votre compte.¶
        </p>¶
      </dd>¶
    ¶
      <dt>Historique des visiteurs :</dt>¶
      <dd>¶
        <p>¶
          Lorsque vous visitez Crates.io, nous stockons votre adresse IP ainsi que l’en-tête user-agent¶
          au sein de nos logs serveurs. Nous conservons ces logs pendant 1 an.¶
        </p>¶
      </dd>¶
    ¶
      <dt>Information publiées dans les crates :</dt>¶
      <dd>¶
        <p>¶
          Toutes les crates sur Crates.io sont publiques, y compris la liste des nom d’utilisateurs des fondateurs¶
          et la date de publication. N’importe qui peut voir ou télécharger le contenu¶
          d’une crate. De par la nature publique de Crates.io, n’importe quelle¶
          donnée personnelle que vous pourriez inclure dans un fichier Cargo.toml publié dans¶
          une crate sera alors disponible publiquement. Par exemple, si une adresse e-mail¶
          se trouve dans le champ `authors` du fichier Cargo.toml, cette adresse e-mail¶
          sera aussi publique.¶
        </p>¶
        <p>¶
          De par sa nature publique, soyez vigilant lorsque vous incluez¶
          des informations personnelles dans une crate : cette information peut être indexée par des moteurs de¶
          recherche ou de tierces parties. Les informations sensibles ne devraient pas être¶
          embarquées dans une crate.¶
        </p>¶
      </dd>¶
    ¶
      <dt>Publication des informations relatives au site : </dt>¶
      <dd>¶
        <p>¶
          Crates.io utilise l’API Google Visualization pour créer des graphiques pour chaque¶
          crate montrant le nombre de téléchargements au cours des 90 derniers jours. Ces graphes peuvent être visualisés¶
          au bas de la page de chaque crate..¶
        </p>¶
      </dd>¶
    </dl>
policies-privacy-page-docs-rs-desc =
    <p>¶
      <a href="https://docs.rs">Docs.rs</a> est géré par les membres de¶
      <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">l’équipe Rustdoc</a>¶
      et <a href="{ $baseurl }/governance/teams/core">l’équipe Rust principale (Core)</a>. Le¶
      projet collecte et utilise des données tel que décrit dans cet avis de confidentialité.¶
    </p>¶
    ¶
    <p>¶
      Docs.rs est un projet open source qui héberge la documentations de crates pour le¶
      langage de programmation Rust. Il génère automatiquement la documentation des crates¶
      publiées sur <a href="https://crates.io">crates.io</a> en utilisant une distribution « nightly »¶
      du compilateur Rust. Toutes les informations des crates¶
      publiées sur docs.rs sont aussi disponibles publiquement sur crates.io.¶
    </p>
policies-privacy-page-forums-title = Forums
policies-privacy-page-forums-desc =
    <p>¶
      <a href="{ $baseurl }/governance/teams/community">L’équipe communauté de Rust</a>¶
      gère le¶
      <a href="https://users.rust-lang.org">forum utilisateurs</a> ainsi que le¶
      <a href="https://internals.rust-lang.org">forum <i>Internals</i></a>. Les publications sur¶
      ces forums sont publiques. Si vous vous créez un compte pour participer sur ces forums, nous¶
      collectons votre adresse e-mail ainsi que votre nom. Les administrateurs du forum¶
      ont accès à des informations concernant les interactions que vous avez sur ce site, tels que¶
      les messages publiés et lus, et le temps passé sur le site.¶
    </p>
policies-privacy-page-third-parties-title = Services Tiers
policies-privacy-page-third-parties-desc =
    <p>¶
      Le forum des utilisateurs et le forum <i>Internals</i> sur rust-lang.org sont hébergés par¶
      <a href="https://www.discourse.org/">Discourse</a> et utilisent sa plateforme de discussion¶
      open source. L’avis de confidentialité de Discourse est disponible¶
      <a href="https://www.discourse.org/privacy">ici</a>.¶
    </p>¶
    ¶
    <p>¶
      Nous utilisons Mailgun pour envoyer des emails. L’avis de confidentialité de Mailgun est disponible¶
      <a href="https://www.mailgun.com/privacy-policy">ici</a>.¶
    </p>¶
    ¶
    <p>¶
      L’authentification avec GitHub est utilisée pour s’authentifier sur Crates.io et (optionnellement) sur¶
      les forums. L’avis de confidentialité de GitHub est disponible¶
      <a href="https://help.github.com/en/articles/github-privacy-statement">ici</a>.¶
    </p>¶
    ¶
    <p>¶
      Certains membres de l’équipe de Rust utilisent les plateformes Zulip et Discord pour¶
      collaborer avec la communauté. L’avis de confidentialité de Zulip est disponible¶
      <a href="https://zulipchat.com/privacy/">ici</a>.¶
      L’avis de confidentialité de Discord est disponible¶
      <a href="https://discordapp.com/privacy">ici</a>.¶
    </p>
policies-privacy-page-contact-title = Contact
policies-privacy-page-contact-desc =
    <p>¶
      Pour toute demande d’accès aux données, ou toute question à propos de ce présent avis de¶
      confidentialité, merci d’envoyer un email à¶
      <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>¶
    </p>¶
    ¶
    <p>Vous pouvez aussi nous contacter à :</p>¶
    ¶
    <address>¶
      Mozilla Corporation<br>¶
      Attn: Legal Notices - Privacy<br>¶
      331 E. Evelyn Ave,<br>¶
      Mountain View, CA 94041¶
    </address>

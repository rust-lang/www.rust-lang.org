### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Polityka Prywatności Rusta
policies-privacy-page-version = <p>Wersja { $version }, utworzona <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro =
    <p>
      The Rust Project zarządza zestawem projektów, w tym
      <a href="{ $baseurl }/">stroną internetową Rusta</a>,
      <a href="https://crates.io">crates.io</a>, oraz
      <a href="https://docs.rs">docs.rs</a>. Niniejsza notka wyjaśnia w jaki sposób
      przetwarzamy dane osobowe.
    </p>
policies-privacy-page-rust-lang-org-desc =
    <p>
      Strona internetowa <a href="{ $baseurl }/">rust-lang.org</a> jest projektem
      <a href="{ $baseurl }/governance/teams/core">Głównego zespołu</a> oraz
      <a href="{ $baseurl }/governance/teams/community">Zespołu ds. społeczności.</a>
    </p>
    
    <dl>
      <dt>Logi odwiedzających:</dt>
      <dd>
        Kiedy odwiedzasz rust-lang.org, otrzymujemy twój adres IP jako część
        standardowych logów serwerowych. Przechowujemy je przez okres 1 roku.
      </dd>
    </dl>
policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      Strona <a href="https://crates.io">crates.io</a> jest zarządzana przez
      <a href="{ $baseurl }/governance/teams/crates-io">zespół crates.io</a> oraz
      <a href="{ $baseurl }/governance/teams/core">główny zespół Rusta</a>.
    </p>
    
    <dl>
      <dt>Logowanie za pomocą konta GitHub:</dt>
      <dd>
        <p>
          Zalogowanie się na crates.io wymaga posiadania
          <a href="https://github.com">Konta GitHub</a>
          Logując się na stronie crates.io przy pomocy konta GitHub,
          przekazujesz nam informację o swojej nazwie użytkownika oraz awatarze.
          Jeśli używasz publicznie swojego imienia lub adresu email w serwisie GitHub,
          również te informacje są nam przekazane. 
        </p>
      </dd>
    
      <dt>Adresy email:</dt>
      <dd>
        <p>
          Weryfikacja adresu email jest konieczna, aby móc publikować paczki na crates.io.
          Otrzymujemy publiczny adres email użytkownika powiązany z kontem GitHub.
          Użytkownik może użyć innego adresu email niż powiązany z kontem GitHub.
          Używamy adresu email użytkownika jedynie do kontaktowania się w sprawach
          dotyczących konta na crates.io.
        </p>
      </dd>
    
      <dt>Logi odwiedzających:</dt>
      <dd>
        <p>
          Kiedy odwiedzasz Crates.io, otrzymujemy Twój adres IP oraz user-agent
          header jako część standardowych logów serwerowych. Przechowujemy je
          przez okres 1 roku.
        </p>
      </dd>
    
      <dt>Informacje zawarte w przesłanych paczkach:</dt>
      <dd>
        <p>
          Wszystkie paczki na crates.io są publiczne, łącznie z listą nazw użytkowników
          właścicieli paczek oraz datą przesłania. Wszyscy mają wgląd w przesłane paczki.
          Z tego względu, jakiekolwiek prywatne informacje zawarte w ramach plików 
          wchodzących w skład paczki staną się publicznie dostępne w internecie.
          Przykładowo adres email zawarty w pliku Cargo.toml przesłanej na
          crates.io paczki stanie się publiczny od momentu publikacji paczki.
        </p>
        <p>
          Ze względu na ogólnodostępność danych zawartych w paczkach, należy
          pamiętać, że informacje te mogą być zbierane przez strony trzecie, w tym
          indeksowane przez wyszukiwarki. Poufne informacje nie powinny być zawarte
          w plikach składowych paczek.
        </p>
      </dd>
    
      <dt>Publication of site-related data: </dt>
      <dd>
        <p>
          Crates.io korzysta z Google Visualization API w celu tworzenia wykresów
          dla informacji dotyczących ilości pobrań paczek w ciągu ostatnich 90 dni.
          Wykresy te są widoczne na dole strony każdej paczki.
        </p>
      </dd>
    
      <dt>Monitorowanie błędów:</dt>
      <dd>
        <p>
          Crates.io korzysta z serwisu monitorowania błędów Sentry w celu
          szybszego wykrywania i naprawy problemów z oprogramowaniem strony.
          W przypadku wystąpienia błędu Sentry otrzymuje podstawowe informacje
          dotyczące Twojej interakcji ze stroną oraz akcji, które doprowadziły do
          wystąpienia błędu. Ponadto, Twój adres IP może zostać ujawniony Sentry
          jako część procesu raportowania błędu. Obecna konfiguracja Sentry dla 
          crates.io zakłada usunięcie tej informacji od razu po jej otrzymaniu.
          Przeczytaj politykę prywatności Sentry <a href="https://sentry.io/privacy/">
          pod tym adresem</a>.
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc--2020-09 =
    <p>
      Strona <a href="https://docs.rs">docs.rs</a> jest zarządzana przez 
      <a href="{ $baseurl }/governance/teams/dev-tools#docs-rs">zespół docs.rs</a>
      oraz <a href="{ $baseurl }/governance/teams/core">główny zespół Rusta</a>.
    </p>
    
    <dl>
      <dt>Logi odwiedzających:</dt>
      <dd>
        <p>
          Kiedy odwiedzasz docs.rs, otrzymujemy Twój adres IP oraz user-agent
          header jako część standardowych logów serwerowych. Przechowujemy
          te informacje przez 1 rok.
        </p>
      </dd>
    </dl>
policies-privacy-page-forums-title = Fora
policies-privacy-page-forums-desc =
    <p>
      <a href="{ $baseurl }/governance/teams/community">Zespół ds. Społeczności</a>
      zarządza
      <a href="https://users.rust-lang.org">Forum Użytkowników</a> oraz
      <a href="https://internals.rust-lang.org">Forum Internals</a>. Posty na
      tych forach są publiczne. Kiedy rejestrujesz się na tych forach, zapisujemy
      Twój adres email oraz nazwę użytkownika. Administratorzy forów mają
      dostęp do historii aktywności użytkowników, w tym rzeczy takich jak
      opublikowane wpisy, przeczytane wpisy, czy czas spędzony na stronie.
    </p>
policies-privacy-page-third-parties-title = Usługi stron trzecich
policies-privacy-page-third-parties-desc =
    <p>
      Forum Użytkowników oraz Forum Internals na rust-lang.org są hostowane przez
      <a href="https://www.discourse.org/">Discourse</a> i korzystają z jego platformy dyskusyjnej open source. Polityka prywatności Discourse jest dostępna
      <a href="https://www.discourse.org/privacy">pod tym adresem</a>.
    </p>
    
    <p>
      Używamy serwisu Mailgun do wysyłania emaili. Polityka prywatności
      Mailgun jest dostępna
      <a href="https://www.mailgun.com/privacy-policy">pod tym adresem</a>.
    </p>
    
    <p>
      Korzystamy z GitHub login w celu uwierzytelniania użytkowników na Crates.io oraz (opcjonalnie) na forach. Oświadczenie o ochronie prywatności firmy Github
    jest dostępne
      <a href="https://help.github.com/en/articles/github-privacy-statement">pod tym adresem</a>.
    </p>
    
    <p>
      Niektórzy członkowie zespołów Rusta korzystają z platform Zulip oraz Discord.
      Informacja o ochronie prywatności Zulip jest dostępna
      <a href="https://zulipchat.com/privacy/">tutaj</a>.
      Informacja o ochronie prywatności Discord jest dostępna
      <a href="https://discordapp.com/privacy">tutaj</a>.
    </p>
policies-privacy-page-contact-title = Kontakt
policies-privacy-page-contact-desc =
    <p>
      Wnioski o dostęp do danych oraz jakiekolwiek pytania dotyczące polityki
      prywatności prosimy kierować na adres email
      <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>
    </p>
    
    <p>Można też skontaktować się z nami pocztą:</p>
    
    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

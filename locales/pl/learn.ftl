## learn/index.hbs

learn-page-title = Ucz się Rusta
learn-begin = Rozpocznij przygodę z Rustem
learn-book = Nazywany po prostu "podręcznikiem", <cite>The Rust Programming Language</cite> oferuje szerokie spojrzenie na język programowania Rust od podstaw. Przeprowadza on też przez kilka pierwszych projektów z Rustem. Gwarantujemy, że jeśli przebrniesz przez całość, będziesz mieć już całkiem solidne zrozumienie Rusta.
learn-book-button = Przeczytaj Podręcznik!
translated-book = { "" }
translated-book-button = { "" }
learn-rustlings = Alternatywnie, Rustlings przeprowadzi Cię przez pobranie i instalację toolchaina Rusta, a także nauczy Cię podstaw syntaktycznych związanych z czytaniem i pisaniem języka Rust, wszystko w ramach wiersza poleceń. Jest to pewnego rodzaju zamiennik dla Rust by Example, który działa w twoim własnym terminalu.
learn-rustlings-button = Wykonaj kurs Rustlings!
learn-rbe = Jeśli czytanie kilkuset stronicowej książki o języku programowania nie jest w twoim stylu, to być może bardziej spodoba Ci się Rust By Example. Podczas gdy główny podręcznik opisuje język słowami, RBE pokazuje go na przykładach kodu i zadaniach, które możesz wykonać!
learn-rbe-button = Zobacz Rust by Example!
learn-use = Rozwijaj się z Rustem
learn-doc-heading = Przeczytaj dokumentację języka
learn-doc = Cała ta dokumentacja jest też dostępna lokalnie. Wystarczy użyć komendy <code>rustup doc</code>, aby otworzyć w przeglądarce przechowywane na dysku pliki dokumentacji. Połączenie z internetem nie jest potrzebne!
learn-doc-std = Kompletny poradnik do API standardowej biblioteki Rusta.
learn-doc-std-button = Biblioteka standardowa
learn-doc-edition = Przewodnik po dostępnych edycjach Rusta.
learn-doc-edition-button = Przewodnik po edycjach
learn-doc-cargo = Podręcznik traktujący o menadżerze pakietów i systemie buildów Rusta.
learn-doc-cargo-button = Podręcznik Cargo
learn-doc-rustdoc = Naucz się tworzyć niesamowitą dokumentację dla swoich paczek.
learn-doc-rustdoc-button = Podręcznik rustdoc
learn-doc-rustc = Zapoznaj się z wszystkimi dostępnymi trikami kompilatora Rust.
learn-doc-rustc-button = Podręcznik rustc
learn-doc-error = Szczegółowe wyjaśnienia błędów które może wyrzucić kompilator Rusta.
learn-doc-error-button = Indeks Błędów Kompilatora
learn-domain = Doszkalaj się w domenie tworzenia aplikacji
learn-domain-cli-button = Podręcznik do wiersza poleceń
learn-domain-cli = Naucz się tworzyć wydajne aplikacje wiersza poleceń w Ruście.
learn-domain-wasm-button = Podręcznik WebAssembly
learn-domain-wasm = Używaj Rusta do budowania bibliotek przeznaczonych bezpośrednio dla przeglądarek przy pomocy WebAssembly.
learn-domain-embedded-button = Podręcznik Systemów Wbudowanych
learn-domain-embedded = Stań się biegłym z Mikrokontrolerami i innymi systemami wbudowanymi z Rustem.
learn-master = Opanuj Rusta
learn-master-text = Ciekawią Cię mniej uczęszczane tematy dotyczące Rusta? Tutaj znajdziesz więcej pikantnych szczegółów:
learn-reference-alt = Ikonka półki na książki
learn-reference = Dokument Referencyjny nie jest formalną specyfikacją, ale przyjmuje formę bardziej obszerną i szczegółową niż typowy podręcznik.
learn-reference-button = Czytaj Dokument Referencyjny
learn-nomicon-alt = Dwie ręce trzymające ogień
learn-nomicon = Niechaj Rustonomikon poprowadzi Cię przez czarną magię sekcji niebezpiecznego kodu Rust. Niektórzy nazywają go skrótowo po prostu "nomikonem".
learn-nomicon-button = Czytaj nomikon.
learn-unstable-alt = Ręka dzieląca się iskrami
learn-unstable = Podręcznik Niestabilności dokumentuje niestabilne funkcje języka które są dostępne jedynie w wersjach nightly.
learn-unstable-button = Czytaj podręcznik niestabilności

## learn/get-started.hbs

learn-get-started-page-title = { getting-started }
learn-setup = W mgnieniu oka ustaw środowisko Rusta i napisz małą apkę!
learn-install-heading = Instalacja Rusta
learn-play = Możesz przetestować Rusta w przeglądarce w ramach funkcji Rust Playground, bez konieczności instalowania czegokolwiek.
learn-play-button = Wypróbuj Rust bez instalacji
learn-install-rustup-header = Rustup: program służący do instalacji i zarządzania wersjami Rusta
learn-install-rustup = Głównym sposobem instalacji Rusta jest skorzystanie z narzędzia Rustup, które spełnia zarówno wersję instalatora, jak i narzędzia zarządzania wersjami języka.
learn-install-rustup-update-header = Czy masz aktualną wersję Rust?
learn-install-rustup-update = Aktualizacje Rusta są publikowane dosyć często. Jeśli Twoja instalacja Rustup miała miejsce już jakiś czas temu, istnieje dobra szansa, że dostępna jest nowa wersja. Zainstaluj najnowszą wersję Rusta uruchamiając polecenie { $update-command }.
learn-install-rustup-button = Dowiedz się więcej o instalacji
learn-install-cargo-header = Cargo: narzędzie do kompilacji i menadżer paczek w jednym
learn-install-cargo =
    <p>Instalator Rustup pobierze też dla Ciebie ostatnią stabilną wersję Rustowego narzędzia do budowania projektów i zarządzania paczkami, zwanego Cargo. Z pomocą Cargo będziesz w stanie:</p>
    <ul>
      <li>szybko zbudować swój projekt, używając <code>cargo build</code></li>
      <li>zbudować i uruchomić swój projekt, używając <code>cargo run</code></li>
      <li>uruchomić testy, używając <code>cargo test</code></li>
      <li>wygenerować dokumentację dla swojego projektu, używając <code>cargo doc</code></li>
      <li>opublikować swoją bibliotekę na <a href="https://crates.io">crates.io</a>, używając <code>cargo publish</code></li>
    </ul>
    <p>Aby sprawdzić, czy Rust i Cargo zostały poprawnie zainstalowane, wystarczy wpisać do terminala następującą komendę:</p>
    <p><code>cargo --version</code></p>
learn-install-cargo-button = Czytaj podręcznik cargo
learn-install-other = Inne narzędzia
learn-install-editors = Wsparcie dla Rusta jest dostępne w wielu edytorach:
learn-generating = Generowanie nowego projektu
learn-generating-steps =
    <p>Wykorzystajmy nasze nowo zainstalowane środowisko programistyczne Rusta do napisania małego programu. Na początek wykorzystamy Cargo do stworzenia nowego projektu. Uruchom terminal i wpisz następujące polecenie:</p>
    <p><code>cargo new hello-rust</code></p>
    <p>Tym oto sposobem stworzyliśmy nowy folder o nazwie <code>hello-rust</code>, zawierający następujące pliki:</p>
    { $tree }
    <p><code>Cargo.toml</code> to plik manifestowy projektu Rust. Jest to miejsce, w którym trzymane są metadane dotyczące naszego projektu oraz jego zależności w postaci rozmaitych bibliotek kodu.</p>
    <p><code>src/main.rs</code> to plik, w którym będziemy pisać nasz program.</p>
    <hr/>
    <p><code>cargo new</code> tworzy dla nas domyślny projekt "Hello, world!". Możemy uruchomić tak powstałą aplikację, wchodząc w katalog projektu i uruchamiając następujące polecenie:</p>
    <p><code>cargo run</code></p>
    <p>Na ekranie powinniśmy zobaczyć:</p>
    { $output }
learn-dependencies = Dodawanie zależności
learn-dependencies-steps =
    <p>Dodajmy do naszej aplikacji nową zależność, czyli bibliotekę, na której będzie opierać się nasz program. Na oficjalnym repozytorium bibliotek Rusta <a href="https://crates.io">crates.io</a> znajdziesz całą masę rozmaitych bibliotek. Biblioteki oprogramowania Rust są potocznie nazywane "crates", co odnosi się do ich "paczkowej" natury.</p>
    <p>W naszym nowym projekcie skorzystamy z paczki o nazwie <a href="https://crates.io/crates/ferris-says"><code>ferris-says</code></a>.
    <p>Dopisz następującą linijkę do pliku <code>Cargo.toml</code> (lub skopiuj ją z podstrony paczki na crates.io):</p>
    { $cargotoml }
    <p>Teraz możemy zbudować nasz projekt:</p>
    <p><code>cargo build</code></p>
    <p>...i Cargo samodzielnie pobrało wymienioną zależność za nas.</p>
    <p>Zauważ, że kiedy uruchomiliśmy tę komendę, stworzony został nowy plik o nazwie <code>Cargo.lock</code>. Plik ten pełni funkcję logu, czy listy, konkretnych wersji zależności naszego projektu, które są używane przy kompilacji na naszej maszynie.</p>
    <p>Aby skorzystać z nowo zaimportowanej zależności, otwórz plik <code>main.rs</code>, usuń całą jego obecną zawartość (która jest tylko przykładem), i dodaj następującą linijkę:</p>
    <pre><code>use ferris_says::say;</code></pre>
    <p>Oznacza ona, że od teraz możemy użyć funkcji <code>say</code> udostępnionej nam przez paczkę <code>ferris-says</code>.</p>
learn-app = Mała aplikacja w Rust
learn-app-steps =
    <p>Wykorzystajmy naszą nową bibliotekę do napisania niewielkiej aplikacji. Dodaj następujący kod do <code>main.rs</code>:<p>
    { $code }
    <p>Zapisz plik i uruchom aplikację, wpisując w terminal:</p>
    <p><code>cargo run</code></p>
    <p>Zakładając, że nie wkradł się w naszą aplikację żaden błąd, oto co powinno pojawić się na ekranie:</p>
    { $output }
learn-read-docs-header = Dowiedz się więcej!
learn-read-docs = Od dziś możesz dumnie zwać się Rustowcem! Gratulacje! Miło móc Cię gościć w naszych skromnych progach. Kiedy będziesz gotowy, zajrzyj na stronę Ucz się Rusta, gdzie znajdziesz mnóstwo podręczników które pomogą Ci kontynuować Twoją podróż z tym językiem.
learn-read-docs-button = dowiedz się więcej!
learn-ferris-who = Kim jest ten krab, Ferris?
learn-ferris =
    <p>Ferris jest nieoficjalną maskotką Społeczności Rusta. Wielu programistów Rust mówi o sobie żartobliwie "Rustaceans", co jest w języku angielskim grą słów odnoszącą się do “<a href="https://en.wikipedia.org/wiki/Crustacean">crustacean</a>”, czyli "skorupiaka". W języku polskim brakuje nam tu niestety tak sprytnej gry słów, używamy więc po prostu zwrotu "Rustowcy". Warto dodać, że jako maskotka, Ferris nie ma przypisanej konkretnej płci.</p>
    <p>Samo imię "Ferris" jest znów grą słów w języku angielskim i odnosi się do przymiotnika “ferrous”, oznaczającego "coś związanego z żelazem". Jako że Rust, czyli rdza, występuje często na żelazie, taka nazwa dla naszej maskotki wydała nam się całkiem odpowiednia!</p>
    <p>Więcej obrazków z Ferrisem znajdziesz na <a href="https://rustacean.net/">rustacean.net</a>.
learn-ferris-alt = gif na którym ferris biega z jednej strony na drugą

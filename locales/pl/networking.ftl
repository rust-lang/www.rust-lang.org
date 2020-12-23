## templates/what/networking.hbs

what-networking-page-title = Sieci

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust posiada rosnący ekosystem łatwych w użyciu bibliotek dla aplikacji internetowych. Oto dwa najprostsze przykłady:
networking-get-started-post-json = POSTowanie fragmentu JSON
networking-get-started-take-json = Odbieranie POSTowanego JSONa
networking-get-started-reqwest = Dowiedz się więcej o reqwest
networking-get-started-rocket = Dowiedz się więcej o Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Małe zużycie pamięci
networking-pitch-footprint =
    Przejmij kontrolę nad zasobami komputera i zminimalizuj zapotrzebowanie na RAM i cykle procesora.
    Kompilator pomoże Ci upewnić się, że twój kod jest poprawny.
    Do tego ekosystem Rusta zapewnia produktywną i komfortową pracę.
networking-pitch-footprint-alt = Pióro
networking-pitch-secure-header = Bezpieczny i niezawodny
networking-pitch-secure =
    Sprawna weryfikacja typów w Ruście uniemożliwia pojawienie się całej plejady bugów.
    Teraz będziesz wiedzieć dokładnie kiedy, gdzie i jakie obiekty są aktualnie współdzielone czy zmieniane.
    Kluczem jest złapanie jak największej ilości potencjalnych błędów &mdash; na etapie kompilacji.
networking-pitch-secure-alt = Tarcza
networking-pitch-concurrent-header = Współbieżność na dużą skalę
networking-pitch-concurrent =
    Używaj takiego podejścia do współbieżności jakie tylko zechcesz.
    Rust upewni się, że nie udostępnisz przypadkowo stanu aplikacji dwóm wątkom.
    Dzięki temu możesz tworzyć skalowalne aplikacje bez zamartwiania się szczegółami.
networking-pitch-concurrent-alt = Połączone zębatki

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla =
    Migracja naszej infrastruktury połączeń Push do Rusta sprawiła, że teraz kładziemy większy nacisk
    na poprawność i nasz kod stał się prostszy w utrzymaniu, zachowując jednocześnie znakomitą
    wydajność. Teraz nasze serwery obsługują nawet do 20 milionów połączeń websocket w godzinach szczytu.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Inżynier Personelu, Mozilla
networking-production-testimonial-buoyant =
    Rust jest technologiczną podstawą całego planu na przyszłość dla naszego projektu Linkerd.
    Jego system typowania pozwala nam budować modularne, testowalne, składalne części bez poświęcania
    wydajności. Najbardziej zadziwiające było to jak zasady lifetime/borrow checking pozwalają
    nam uniknąć dużej części błędów, z którymi borykaliśmy się do tej pory. Minęły już 2 lata
    i nie jestem w stanie sobie wyobrazić sytuacji, w której chcielibyśmy wymienić Rusta na jakikolwiek
    inny język.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>

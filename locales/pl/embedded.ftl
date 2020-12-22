### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Urządzenia wbudowane

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Mikroskop
embedded-pitch-analysis-heading = Silna statyczna analiza
embedded-pitch-analysis-description = Wymuś konfigurację pinów i peryferiów na etapie kompilacji. Upewnij się, że Twoja aplikacja nie będzie zużywała cennych zasobów w nieprzewidziany sposób.
embedded-pitch-memory-alt = Kostka RAM
embedded-pitch-memory-heading = Elastyczna pamięć
embedded-pitch-memory-description = Dynamiczna alokacja pamięci jest opcjonalna. Korzystaj z globalnego alokatora i dynamicznych struktur danych, albo pozbądź się pamięci heap i przydzielaj całą pamięć statycznie.
embedded-pitch-concurrency-alt = Zębatki
embedded-pitch-concurrency-heading = Nieustraszona współbieżność
embedded-pitch-concurrency-description = Rust uniemożliwia dzielenie stanu pomiędzy wątkami. Bez względu na twoje podejście do współbieżności, Rust utrzymuje swoje gwarancje bezpieczeństwa.
embedded-pitch-interop-alt = Uścisk dłoni
embedded-pitch-interop-heading = Interoperacyjność
embedded-pitch-interop-description = Integruj Rusta do swojej bazy kodu C lub korzystaj z istniejących SDK do napisania nowej aplikacji z użyciem Rusta.
embedded-pitch-portability-alt = Wózek na bagaż
embedded-pitch-portability-heading = Przenośność
embedded-pitch-portability-description = Napisz bibliotekę lub sterownik raz, i używaj na różnych systemach, od małych mikrokontrolerów po większe komputery jednopłytkowe.
embedded-pitch-community-alt = Logo Tarczy
embedded-pitch-community-heading = Tworzone przez społeczność
embedded-pitch-community-description = Jako część projektu open source, jakim jest Rust, wsparcie dla systemów wbudowanych jest tworzone przez najlepszą w swojej klasie otwartą społeczność, wspieraną dodatkowo przez komercyjnych partnerów.
embedded-learn-more-link = Dowiedz się więcej

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Prezentacja
embedded-showcase-quote = "Kiedy pierwszy raz usłyszałem o Ruscie Mozilli, byłem niezwykle podekscytowany. Rust jest nowym językiem programowania proponującym motto 'bezpieczeństwo, szybkość, współbieżność &ndash; wybierz trzy.' Świetlana przyszłość tego projektu jest zapewniona dzięki silnej, oddanej sprawie społeczności która za nim stoi."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Starszy Konsultant, Cambridge Consultants
embedded-showcase-see-more-link = Zobacz więcej
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Zabezpieczamy przyszłość, z Rustem</a> od <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> na <a href="https://vimeo.com">Vimeo</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = Paczka DIP-6
embedded-get-started-discovery-book-heading = Podręcznik "Discovery"
embedded-get-started-discovery-book-description = Naucz się programowania na systemach wbudowanych od zera &mdash; z Rustem!
embedded-get-started-embedded-rust-book-alt = Paczka QFP-20
embedded-get-started-embedded-rust-book-heading = Rust dla Systemów Wbudowanych
embedded-get-started-embedded-rust-book-description = Znasz już podstawy systemów wbudowanych? Przeskocz na Rusta i przekonaj się ile możesz zyskać.
embedded-get-started-embedonomicon-alt = paczka BGA
embedded-get-started-embedonomicon-heading = Embedonomicon
embedded-get-started-embedonomicon-description = Zobacz, co kryje się pod maską podstawowych bibliotek dla systemów wbudowanych.
embedded-get-started-read-link = Czytaj
embedded-get-started-more-documentation-link = Więcej dokumentacji

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Logo Sensirion
embedded-testimonials-sensirion-quote = W Sensirion użyliśmy ostatnio Rusta, żeby stworzyć wbudowaną demonstrację dla naszego produktu <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Łatwa kompilacja krzyżowa i dostępność wielu wysokiej jakości paczek na crates.io umożliwiły nam <b>szybkie i sprawne zbudowanie naszej demonstracji</b>.
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Inżynier Oprogramowania, Sensirion
embedded-testimonials-airborne-alt = Logo Airborne Engineering Ltd
embedded-testimonials-airborne-quote = W naszej firmie Airborne Engineering Ltd. użyliśmy ostatnio Rusta do napisania Ethernetowego bootloadera, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>, stanowiącego część naszego wewnętrznego systemu gromadzenia danych. <b>Rust jest bardzo obiecującym językiem programowania, nie możemy doczekać się kolejnych projektów z jego udziałem, nie tylko tych na urządzenia wbudowane.</b>
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Inżynier Instrumentacji, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = Logo 49nord
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] umożliwia nam wypuszczanie lepszej jakości oprogramowania szybciej niż wydawało nam się to możliwe. Dzięki Rustowi możemy brać bezpieczeństwo związane z pamięcią za daną, podczas gdy inne elementy tego wydajnego języka z wyrafinowanym systemem typowania sprawiają, że nasze oprogramowanie jest łatwiejsze w utrzymaniu. <b>Rust nie tylko sprawia, że nasi klienci są zadowoleni - sprawia też, że zadowoleni są nasi inżynierowie.<b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Logo Terminal Technologies
embedded-testimonials-terminal-tech-quote = <b>Jesteśmy zdania, że to wspaniała rzecz móc korzystać z przejrzystego, nowoczesnego języka w przestrzeni systemów wbudowanych</b>, miejscu które jest zwykle domeną C/C++
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Starszy Inżynier Oprogramowania, Terminal Technologies

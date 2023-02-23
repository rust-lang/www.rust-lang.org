### Translation file for https://www.rust-lang.org/what/embedded

## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Вбудовувані пристрої

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Мікроскоп
embedded-pitch-analysis-heading = Потужний статичний аналіз
embedded-pitch-analysis-description = Примусове налаштування контактів і периферійних пристроїв під час компіляції. Гарантія того, що ресурси не будуть використовуватися не призначеними частинами програми.
embedded-pitch-memory-alt = Планка пам'яті
embedded-pitch-memory-heading = Гнучка пам'ять
embedded-pitch-memory-description = Динамічний розподіл пам'яті не є обов'язковим. Використовуйте глобальний розподільник і динамічні структури даних. Або взагалі виключити купу і статично розподілити все.
embedded-pitch-concurrency-alt = Шестерні
embedded-pitch-concurrency-heading = Написання паралельного коду без страху
embedded-pitch-concurrency-description = Rust унеможливлює випадковий поділ стану між потоками. Використовуйте будь-які підходи до паралелізму, які вам подобаються, і ви все одно отримаєте суворі гарантії Rust.
embedded-pitch-interop-alt = Рукостискання
embedded-pitch-interop-heading = Сумісність
embedded-pitch-interop-description = Інтегруйте Rust у вашу наявну кодову базу на C або використовуйте наявний SDK для написання програми на Rust.
embedded-pitch-portability-alt = Візок для багажу
embedded-pitch-portability-heading = Переносимість
embedded-pitch-portability-description = Один раз напишіть бібліотеку або драйвер і використовуйте його з різними системами починаючи від дуже маленьких мікроконтролерів, до потужних інтегрованих плат.
embedded-pitch-community-alt = Логотип Shield
embedded-pitch-community-heading = Рухомий спільнотою
embedded-pitch-community-description = У рамках open source проєкту Rust, підтримка вбудованих систем рухається, за підтримки комерційних партнерів, найкращою у своєму класі open source спільнотою.
embedded-learn-more-link = Дізнайтеся більше

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Історія успіху
embedded-showcase-quote = "Я був так схвильований, коли я натрапив на Rust від Mozilla. Rust - нова мова програмування з гаслом "безпечна, швидка, паралельна - обери три". Їй також гарантоване майбутнє з сильною і відданою спільнотою користувачів."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = Дізнатися більше
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Безпечне майбутнє з Rust</a> з <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> на <a href="https://vimeo.com">Vimeo</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = Пакет DIP-6
embedded-get-started-discovery-book-heading = Книга Discovery
embedded-get-started-discovery-book-description = Вивчіть вбудовану розробку з нуля використовуючи Rust!
embedded-get-started-embedded-rust-book-alt = Пакет QFP-20
embedded-get-started-embedded-rust-book-heading = Книга Embedded Rust
embedded-get-started-embedded-rust-book-description = Уже знайомі з розробкою вбудованих систем? Приєднуйтесь до Rust і починайте отримувати вигоду.
embedded-get-started-embedonomicon-alt = Пакет BGA
embedded-get-started-embedonomicon-heading = Embedonomicon
embedded-get-started-embedonomicon-description = Подивіться під капот фундаментальних embedded бібліотек.
embedded-get-started-read-link = Читати
embedded-get-started-more-documentation-link = Більше документації

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Логотип Sensirion
embedded-testimonials-sensirion-quote = Ми в Sensirion нещодавно використали Rust для створення демонстрації <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Завдяки простій крос-компіляції та доступності великої кількості високоякісних пакетів на crates.io <b>ми швидко отримали швидкий і надійний демонстратор</b>.
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Software Engineer, Sensirion
embedded-testimonials-airborne-alt = Логотип Airborne Engineering Ltd
embedded-testimonials-airborne-quote = Ми в Airborne Engineering Ltd. нещодавно використали Rust щоб написати внутрішню систему збору даних на Ethernet завантажувачі, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>. <b>Rust є перспективною мовою і ми будемо раді використовувати її в наших майбутніх проектах, вбудованих і не тільки.</b>
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Instrumentation Engineer, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = Логотип 49nord
# "Fluent" вимагає, щоб квадратна дужка, яка є першим символом рядка, виводилася таким чином: {"["} Дивіться https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "["}Rust] дав нам змогу доставляти програмне забезпечення швидше та коректніше, ніж ми припускали. Завдяки Rust ми отримали гарантії безпеки пам'яті, тоді як інші переваги мови з нульовими витратами і складною системою типів допомагають нам розробляти підтримуване ПЗ. <b>Rust робить щасливими як наших клієнтів, так і наших інженерів.</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Логотип Terminal Technologies
embedded-testimonials-terminal-tech-quote = <b>Ми думаємо, що це справді круто, що ми можемо використовувати хорошу сучасну мову в галузі вбудованих пристроїв</b> де зазвичай немає альтернатив C/C++
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Senior Software Engineer, Terminal Technologies

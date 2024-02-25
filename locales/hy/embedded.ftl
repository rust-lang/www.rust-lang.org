### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Встраиваемые устройства

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Микроскоп
embedded-pitch-analysis-heading = Мощный статический анализ
embedded-pitch-analysis-description = Принудительная настройка контактов и периферийных устройств во время компиляции. Гарантия того, что ресурсы не будут использоваться не предназначенными частями приложения.
embedded-pitch-memory-alt = Планка памяти
embedded-pitch-memory-heading = Гибкая память
embedded-pitch-memory-description = Динамическое распределение памяти не является обязательным. Используйте глобальный распределитель и динамические структуры данных. Или вообще исключить кучу и статически распределить всё.
embedded-pitch-concurrency-alt = Шестерни
embedded-pitch-concurrency-heading = Написание параллельного кода без страха
embedded-pitch-concurrency-description = Rust делает невозможным случайное разделение состояния между потоками. Используйте любые подходы к параллелизму, которые вам нравятся, и вы всё равно получите строгие гарантии Rust.
embedded-pitch-interop-alt = Рукопожатие
embedded-pitch-interop-heading = Совместимость
embedded-pitch-interop-description = Интегрируйте Rust в вашу существующую кодовую базу на C или используйте существующий SDK для написания приложения на Rust.
embedded-pitch-portability-alt = Тележка для багажа
embedded-pitch-portability-heading = Переносимость
embedded-pitch-portability-description = Один раз напишите библиотеку или драйвер и используйте его с разными системами начиная от очень маленьких микроконтроллеров, до мощных интегрированных плат.
embedded-pitch-community-alt = Логотип Shield
embedded-pitch-community-heading = Движимый сообществом
embedded-pitch-community-description = В рамках open source проекта Rust, поддержка встраиваемых систем движется, при поддержке коммерческих партнёров, лучшим в своём классе open source сообществом.
embedded-learn-more-link = Узнайте больше

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = История успеха
embedded-showcase-quote = "Я был так взволнован, когда я наткнулся на Rust от Mozilla. Rust - новый язык программирования с лозунгом «безопасный, быстрый, параллельный - выбери три». Ему также гарантировано будущее с сильным и преданным сообществом пользователей."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = Узнать больше
embedded-showcase-video-description = <a href="https://vimeo.com/224912526">Безопасное будущее с Rust</a> из <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> на <a href="https://vimeo.com">Vimeo</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = Пакет DIP-6
embedded-get-started-discovery-book-heading = Книга Discovery
embedded-get-started-discovery-book-description = Изучите встроенную разработку с нуля используя Rust!
embedded-get-started-embedded-rust-book-alt = Пакет QFP-20
embedded-get-started-embedded-rust-book-heading = Книга Embedded Rust
embedded-get-started-embedded-rust-book-description = Уже знакомы с разработкой встраиваемых систем? Присоединяйтесь к Rust и начинайте получать выгоду.
embedded-get-started-embedonomicon-alt = Пакет BGA
embedded-get-started-embedonomicon-heading = Embedonomicon
embedded-get-started-embedonomicon-description = Посмотрите под капот фундаментальных embedded библиотек.
embedded-get-started-read-link = Читать
embedded-get-started-more-documentation-link = Больше документации

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Логотип Sensirion
embedded-testimonials-sensirion-quote = Мы в Sensirion недавно использовали Rust для создания демонстрации <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Благодаря простой кросс-компиляции и доступности большого количества высококачественных пакетов на crates.io <b>мы быстро получили быстрый и надёжный демонстратор</b>.
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Software Engineer, Sensirion
embedded-testimonials-airborne-alt = Логотип Airborne Engineering Ltd
embedded-testimonials-airborne-quote = Мы в Airborne Engineering Ltd. недавно использовали Rust чтобы написать внутреннюю систему сбора данных на Ethernet загрузчике, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>. <b>Rust является перспективным языком и мы будем рады использовать его в наших будущих проектах, встраиваемых и не только.</b>
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Instrumentation Engineer, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = Логотип 49nord
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] позволил нам доставлять программное обеспечение быстрее и более корректно, чем мы предполагали. Благодаря Rust мы получили гарантии безопасности памяти, в то время как другие преимущества языка с нулевыми издержками и сложной системой типов помогают нам разрабатывать поддерживаемое ПО. <b>Rust делает счастливыми как наших клиентов, так и наших инженеров.</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Логотип Terminal Technologies
embedded-testimonials-terminal-tech-quote = <b>Мы думаем, что это действительно круто, что мы можем использовать хороший современный язык в области встраиваемых устройств</b> где обычно нет альтернатив C/C++
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Senior Software Engineer, Terminal Technologies

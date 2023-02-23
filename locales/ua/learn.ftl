## learn/index.hbs

learn-page-title = Вивчити Rust
learn-begin = З чого почати?
learn-book = <cite>"The Rust Programming Language"</cite>, ласкаво звана "книгою", дасть вам огляд мови починаючи з базових принципів. Під час читання ви створите кілька проєктів і до кінця вивчення отримаєте тверде розуміння мови.
learn-book-button = Читати книгу!
translated-book = { "" }
translated-book-button = { "" }
learn-rustlings = Інший варіант, Rustlings, допоможе вам у встановленні та налаштуванні інструментів Rust, і навчить вас основам читання і написання коду на Rust. Це альтернатива книзі "Rust на прикладах", яка працює з вашим власним оточенням.
learn-rustlings-button = Пройдіть курс Rustlings!
learn-rbe = Якщо читання сотень сторінок про мову &mdash; не ваш стиль, то вам варто поглянути на "Rust на прикладах" ("Rust By Example", RBE). Поки "Книга" великою кількістю слів розмірковує про код, RBE показує шматки коду і зводить міркування до мінімуму. Також вона містить вправи!
learn-rbe-button = Перейти до Rust by Example!
translated-rbe = {""}
translated-rbe-button = {""}
learn-use = Вдосконалюйтеся з Rust
learn-doc-heading = Прочитайте основну документацію
learn-doc = Уся документація також доступна локально. Команда <code>rustup doc</code> відкриє її у вашому браузері навіть без мережі!
learn-doc-std = Повний посібник з API стандартної бібліотеки.
learn-doc-std-button = Стандартна бібліотека
learn-doc-edition = Посібник з редакцій Rust.
learn-doc-edition-button = Посібник з редакцій мови
learn-doc-cargo = Книга про пакетний менеджер і систему складання Rust.
learn-doc-cargo-button = Книга про Cargo
learn-doc-rustdoc = Дізнайтеся, як створити дивовижну документацію для вашого проєкту.
learn-doc-rustdoc-button = Книга з rustdoc
learn-doc-rustc = Познайомтеся з опціями, доступними в компіляторі Rust.
learn-doc-rustc-button = Книга з rustc
learn-doc-error = Детальні пояснення помилок, які ви можете отримати від компілятора.
learn-doc-error-button = Посібник з помилок компілятора
learn-domain = Розвивайте свої навички в прикладній сфері
learn-domain-cli-button = Книга про консольні додатки
learn-domain-cli = Вивчіть як писати ефективні консольні додатки на Rust.
learn-domain-wasm-button = Книга про WebAssembly
learn-domain-wasm = Використовуйте Rust для створення нативних браузерних бібліотек за допомогою WebAssembly.
learn-domain-embedded-button = Книга Embedded
learn-domain-embedded = Станьте досвідченим розробником під мікроконтролери та інші вбудовані системи з Rust.
learn-master = Майстер Rust
learn-master-text = Цікаво дізнатися про найтемніші куточки мови? Тут ви можете докопатися до дрібниць:
learn-reference-alt = Книжкова полиця
learn-reference = Reference не є формальною специфікацією, але вона більш деталізована та комплексна, ніж книга.
learn-reference-button = Читати Reference
learn-nomicon-alt = Дві руки тримають вогонь
learn-nomicon = Rustonomicon - це ваш путівник у темне мистецтво небезпечного Rust. Іноді його називають "'nomicon".
learn-nomicon-button = Читати 'nomicon
translated-nomicon = { "" }
translated-nomicon-button = { "" }
learn-unstable-alt = Рука випускає іскри
learn-unstable = Unstable Book містить документацію про нестабільні можливості, які ви можете використовувати тільки в нічній версії Rust.
learn-unstable-button = Читати Unstable Book

## learn/get-started.hbs

learn-get-started-page-title = { getting-started }
learn-setup = Швидко налаштуйте середовище розробки Rust і напишіть невеличкий додаток!
learn-install-heading = Встановити Rust
learn-play = Ви можете спробувати Rust онлайн у Rust Playground, не встановлюючи нічого на свій комп'ютер.
learn-play-button = Спробувати Rust без встановлення
learn-install-rustup-header = Rustup: Інсталятор Rust та інструмент для управління версіями
learn-install-rustup = Основним способом інсталяції Rust, який використовують люди, є Rustup - інструмент для інсталяції та управління версіями Rust.
learn-install-rustup-update-header = Чи оновлено Rust?
learn-install-rustup-update = Rust оновлюється досить часто. Якщо ви встановлювали Rustup деякий час тому, є ймовірність, що версія Rust застаріла. Отримайте актуальну версію Rust, запустивши команду { $update-command }.
learn-install-rustup-button = Дізнатися більше про процес встановлення
learn-install-cargo-header = Cargo: Менеджер пакетів та інструмент збірки для Rust
learn-install-cargo =
    <p>При встановленні через Rustup, ви отримуєте останню стабільну версію пакетного менеджера та інструменту збірки Rust, відомого, як Cargo. Cargo робить багато речей:</p>
    <ul>
      <li>збирає ваш проект за допомогою <code>cargo build</code></li></li>
      <li>запускає ваш проект з <code>cargo run</code></li></li>
      <li>тестує ваш проект з <code>cargo test</code></li></li>
      <li>збирає документацію для вашого проекту з <code>cargo doc</code></li></li>
      <li>публікує бібліотеку на <a href="https://crates.io">crates.io</a> з <code>cargo publish</code></li>
    </ul>
    <p>Щоб упевнитися, що Rust і Cargo встановлені, ви можете запустити в терміналі таку команду:</p>
    <p><code>cargo --version</code></p></p>
learn-install-cargo-button = Читати книгу з cargo
learn-install-other = Інші інструменти
learn-install-editors = Підтримка Rust є в багатьох редакторах:
learn-generating = Створення нового проекту
learn-generating-steps = learning-generating-steps =
    <p>Давайте напишемо невеликий додаток із нашим новим оточенням розробника. Щоб почати, ми використовуємо Cargo для створення нового проекту. Запустіть у вашому терміналі:</p>
    <p><code>cargo new hello-rust</code></p>
    <p>Ця команда створить нову директорію на ім'я <code>hello-rust</code> з такими файлами:</p>
    { $tree }
    <p><code>Cargo.toml</code> - це файл маніфесту. Тут зберігаються метадані вашого проєкту, такі як опис.</p>
    <p>У файлі <code>src/main.rs</code> ви пишете код програми.</p>
    <hr/>
    <p><code>cargo new</code> створив для нас проєкт "Hello, world!". Для запуску цієї програми ми перейдемо в директорію, яка була створена, і запустимо в терміналі:</p>
    <p><code>cargo run</code></p>.
    <p>Ви повинні побачити наступне:</p>
    { $output }
learn-dependencies = Додавання залежностей
learn-dependencies-steps =
    <p>Давайте додамо залежність у наш додаток. Ви можете знайти різного роду бібліотеки на <a href="https://crates.io">crates.io</a>, реєстрі пакетів для Rust. У Rust ми зазвичай називаємо пакет "crates".</p>
    <p>У цьому проєкті, ми використовуємо пакет з іменем <a href="https://crates.io/crates/ferris-says"><code>ferris-says</code></a>.
    <p>У нашому <code>Cargo.toml</code> файлі ми додамо таку інформацію (яку ми отримали зі сторінки пакета):</p>
    { $cargotoml }
    <p>Тепер ми можемо запустити:</p>
    <code>cargo build</code>
    <p>...і Cargo встановить наші залежності.</p>.
    <p>Ви побачите, що ця команда створила новий файл, <code>Cargo.lock</code>. Цей файл являє собою журнал точних версій залежностей, які ми використовуємо локально.</p>
    <p>Щоб використати нашу залежність, ми можемо відкрити файл <code>main.rs</code>, видалити все, що там є (це просто ще один приклад) і додати наступний рядок:</p>
    <pre><code>use ferris_says::say;</code></pre></pre>
    <p>Цей рядок означає, що ми тепер можемо використовувати функцію <code>say</code>, яку нам надав пакет <code>ferris-says</code>.</p>
learn-app = Невеликий додаток на Rust
learn-app-steps =
    <p>Тепер давайте напишемо невеликий застосунок із нашою новою залежністю. У файл <code>main.rs</code> додайте такий код:</p>
    { $code }
    <p>Після того, як ми це збережемо, ми можемо запустити наш додаток набравши:</p>
    <p><code>cargo run</code></p>
    <p>За умови, що все пішло добре, ви маєте побачити, що ваш застосунок вивів на екран таке:</p>
    { $output }
learn-read-docs-header = Дізнатися більше!
learn-read-docs = Тепер ви Растаціанін! Ласкаво просимо! Ми так раді бачити вас. Коли ви будете готові, перейдіть на нашу сторінку навчання, де ви можете знайти безліч книг, які допоможуть вам продовжити вашу пригоду в Rust.
learn-read-docs-button = дізнатися більше!
learn-ferris-who = Хто цей краб, Ferris?
learn-ferris =
    <p>Ferris (Ферріс) - це неофіційний талісман спільноти Rust. Багато програмістів на Rust називають себе "Растаціане", обігруючи слово "<a href="https://en.wikipedia.org/wiki/Crustacean">crustacean</a>".</p>
    <p>Ferris - це ім'я, що обігрує прикметник "ferrous" ("залізистий"), який означає "той, що містить залізо". Оскільки Rust (один із перекладів якого - "іржа") утворюється на залізі, назва нашого талісмана виглядає кумедною!</p> <p>.
    <p>Ви можете знайти більше зображень Ферріса на <a href="https://rustacean.net/">rustacean.net</a>.
learn-ferris-alt = анімація, на якій Ferris ходить з боку в бік

## tools/index.hbs

tools-page-title = Інструменти
tools-editor-support-heading = Підтримка першокласних редакторів
tools-editor-support-description = Незалежно від того, чи віддаєте перевагу ви працювати з кодом з командного рядка або використовувати багаті можливості графічного редактора, для цього інструменту існує підтримка Rust. Або ви можете створити свій власний, використовуючи <a href="https://github.com/rust-analyzer/rust-analyzer">rust-analyzer</a>.
tools-build-heading = Принесіть спокій у ваші збірки
tools-build-description = Cargo - це інструмент збірки для Rust. Він збирає всі загальні дії в одну команду. Шаблонність не потрібна.
tools-build-install-heading = Встановлення
tools-build-install-description = З десятками тисяч пакетів, є непоганий шанс, що <a href="https://crates.io">crates.io</a> містить рішення, яке ви шукаєте. Встаньте на плечі гігантів і рухайте свою команду від повторення до інновацій.
tools-build-test-heading = Тестування
tools-build-test-description = Станьте впевненим у своєму коді завдяки чудовим інструментам тестування Rust. <code class="nowrap">cargo test</code> - уніфіковане рішення для тестування в Rust. Пишете ви тести після вашого коду чи в окремому файлі, <code class="nowrap">cargo test</code> надає рішення для всіх потреб тестування.
tools-build-deploy-heading = Розгортання
tools-build-deploy-description = <code class="nowrap">cargo build</code> створює бінарні файли для всіх платформ. З цією простою командою ваш код може компілюватися для Windows, Linux, macOS та інтернету. Усе це робиться за допомогою сучасного інтерфейсу, без необхідності в скриптах збірки.
tools-automation-heading = Швидкість за рахунок автоматизації
tools-automation-description = Промислові інструменти Rust роблять співпрацю безбоязливою, даючи змогу командам зосередитися на справді важливих завданнях.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt автоматично форматує Rust код, полегшуючи його читання, написання та підтримку. І що важливіше: тепер не треба сперечатися про місце розташування пробілів і дужок.
tools-automation-rustfmt-link = Перейти в репозиторій
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>"Схоже, що ви пишете Iterator"</i><br>Clippy допомагає розробникам усіх рівнів досвіду писати ідіоматичний код і забезпечує дотримання стандартів.
tools-automation-clippy-link = Перейти до репозиторію
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = За допомогою конструктора документації Cargo, усі API будуть задокументовані. Документація доступна локально за допомогою <code class="nowrap">cargo doc</code> та онлайн для публічних пакетів на <a href="https://docs.rs">docs.rs</a>.
tools-automation-cargo-doc-link = Перейти на сайт

## tools/install.hbs

tools-install-page-title = Встановлення Rust
install-using-rustup-heading = Використовуючи rustup (рекомендується)
install-rustup32-button = Завантажити <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span>
install-rustup64-button = Завантажити <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64-bit)</span>
install-notes-heading = Примітки про встановлення Rust
install-notes-getting-started-description = Якщо ви щойно почали працювати з Rust і хочете глибшого занурення, подивіться сторінку про <a href="{ $getting-started-href }">початок роботи</a>.
install-notes-rustup-heading = Управління інструментами з <code>rustup</code>
install-notes-rustup-description =
    <p>
      Rust встановлюється та керується за допомогою
      <a href="https://rust-lang.github.io/rustup/"><code>rustup</code></a>. Rust має 6-тижневий
      <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
        процес випуску
      </a> і підтримує
      <a href="https://forge.rust-lang.org/release/platform-support.html">велику кількість платформ</a>, тож велика кількість збірок Rust доступна в будь-який час. <code>rustup</code> узгоджено керує цими збірками на кожній платформі, підтримуваній Rust, включно зі встановленням Rust
      з beta і nightly каналів випусків, а також підтримує додаткові цілі для крос-компіляції.
    </p>
    <p>
      Якщо ви раніше встановлювали <code>rustup</code>, то ви можете оновити інструменти розробника запустивши <code>rustup update</code>.
    </p>
    <p>
    Для додаткової інформації дивіться
      <a href="https://rust-lang.github.io/rustup/">
      документацію щодо <code>rustup</code></a>.
    </p>
install-notes-uninstall-heading = Видалити Rust
install-notes-uninstall-description =
    <p>
     Якщо ви з якоїсь причини хочете видалити Rust, ви можете запустити
      <code>rustup self uninstall</code>.
      Нам буде тебе не вистачати!
    </p>
install-notes-path-heading = Налаштування змінної оточення <code>PATH</code>
install-notes-path-description =
    <p>
      У середовищі розробки Rust, усі інструменти встановлюються в директорію 
      <span class="platform-specific not-win di">
        <code>~/.cargo/bin</code>
      </span>
      <span class="platform-specific win dn">
        <code>%USERPROFILE%\.cargo\bin</code>
      </span>, де ви можете знайти набір інструментів Rust,
      включаючи <code>rustc</code>, <code>cargo</code> і <code>rustup</code>.
    </p>
    <p>
      Відповідно, розробники на Rust зазвичай включають її в
      <a href="https://en.wikipedia.org/wiki/PATH_(variable)">змінну оточення
      <code>PATH</code></a>. У процесі встановлення
      <code>rustup</code> намагається сконфігурувати <code>PATH</code>.
      Через різницю між платформами, командними оболонками та багами в
      <code>rustup</code>, зміна <code>PATH</code> може не принести
      результату до тих пір, поки консоль не буде перезапущена або користувач не перезайде в систему, а може і не вдасться взагалі.
    </p>
    <p>
      Якщо після встановлення запуск команди <code>rustc --version</code> у консолі
      зазнає невдачі, це може бути найімовірнішою причиною.
    </p>
install-notes-windows-heading = Особливості Windows
install-notes-windows-description =
    <p>
      На Windows, Rust додатково вимагає інструменти збірки C++ для Visual Studio 2013 або пізнішої версії. Найпростіший спосіб отримати ці інструменти - це встановлення
      <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
        Microsoft Visual C++ Build Tools 2019
      </a>, яка надає тільки інструменти збірки Visual C++. Як альтернативу цьому способу, ви можете <a href="https://www.visualstudio.com/downloads/">встановити</a>
      Visual Studio 2019, Visual Studio 2017, Visual Studio 2015 або Visual
      Studio 2013 і в процесі встановлення вибрати "C++ tools".
    </p>
    <p>
      Для отримання додаткової інформації про налаштування Rust у Windows, дивіться
      <a href="https://rust-lang.github.io/rustup/installation/windows.html">
      Windows-специфічну документацію <code>rustup</code></a>.
    </p>
install-other-methods-heading = Інші методи встановлення
install-other-methods-description = Для більшості розробників, процес інсталяції, за допомогою <code>rustup</code>, описаний вище, є найкращим способом інсталяції Rust. Однак, Rust також може бути встановлений за допомогою інших методів.
install-other-methods-link = Дізнайтеся більше

## components/tools/rustup.hbs

tools-rustup-unixy = Здається, у вас запущена macOS, Linux або інша Unix-подібна ОС. Щоб завантажити Rustup і встановити Rust, запустіть наступне у вашому терміналі та дотримуйтесь інструкцій на екрані.
tools-rustup-windows-2 = Схоже, ви працюєте під управлінням Windows. Щоб почати використовувати Rust, завантажте інсталятор, потім запустіть програму і дотримуйтесь інструкцій на екрані. Можливо, Вам буде потрібно встановити<a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/">Visual Studio C++ Build tools</a> при появі відповідного запиту. Якщо ви не працюєте в Windows, дивіться <a href="https://forge.rust-lang.org/infra/other-installation-methods.html">"інші методи встановлення"</a>.
tools-rustup-wsl-heading = Windows Subsystem for Linux
tools-rustup-wsl = Якщо ви використовуєте Windows Subsystem for Linux, для інсталяції Rust запустіть наступне у вашому терміналі, а потім дотримуйтесь інструкцій на екрані.
tools-rustup-unknown = Rust запускається на Windows, Linux, macOS, FreeBSD і NetBSD. Якщо ви використовуєте одну з цих платформ і бачите це, то будь ласка, повідомте про проблему та наступні значення:
tools-rustup-report = Повідомити про проблему
tools-rustup-manual-unixy = Якщо ви використовуєте Unix, то для встановлення Rust запустіть у терміналі наступну команду і дотримуйтесь інструкцій на екрані.
tools-rustup-manual-windows = Якщо у вас запущено Windows,<br>скачайте і запустіть <a href="https://win.rustup.rs">rustup-init.exe</a> і потім дотримуйтесь інструкцій на екрані.
tools-rustup-manual-default = Якщо ви використовуєте Unix, такий як WSL, Linux або macOS, то для встановлення Rust<br>запустіть наступну команду у вашому терміналі та дотримуйтесь інструкцій на екрані.
tools-rustup-manual-default-windows = Якщо у вас запущено Windows,<br>скачайте і запустіть <a href="https://win.rustup.rs">rustup-init.exe</a>, а потім дотримуйтесь інструкцій на екрані.

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany
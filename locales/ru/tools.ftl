## tools/index.hbs

tools-page-title = Инструменты
tools-editor-support-heading = Поддержка первоклассных редакторов
tools-editor-support-description = Не зависимо от того, предпочитаете ли вы работать с кодом из командной строки или использовать богатые возможности графического редактора, для этого инструмента существует поддержка Rust. Или вы можете создать свой собственный, используя <a href="https://github.com/rust-lang/rls">Rust Language Server</a>.
tools-build-heading = Принесите спокойствие в ваши сборки
tools-build-description = Cargo - это инструмент сборки для Rust. Он собирает все общие действия в одну команду. Шаблонность не нужна.
tools-build-install-heading = Установка
tools-build-install-description = С десятками тысяч пакетов, есть неплохой шанс, что <a href="https://crates.io">crates.io</a> содержит решение, которое вы ищете. Встаньте на плечи гигантов и двигайте свою команду от повторения к инновациям.
tools-build-test-heading = Тестирование
tools-build-test-description = Станьте уверенным в своём коде благодаря превосходным инструментам тестирования Rust. <code class="nowrap">cargo test</code> - унифицированное решение для тестирования в Rust. Пишете ли вы тесты после вашего кода или в отдельном файле, <code class="nowrap">cargo test</code> предоставляет решение для всех нужд тестирования.
tools-build-deploy-heading = Развёртывание
tools-build-deploy-description = <code class="nowrap">cargo build</code> создаёт бинарные файлы для всех платформ. С этой простой командой ваш код может компилироваться для Windows, Linux, macOS и интернета. Всё это делается с помощью современного интерфейса, без необходимости в скриптах сборки.
tools-automation-heading = Скорость за счёт автоматизации
tools-automation-description = Промышленные инструменты Rust делают сотрудничество безбоязненным, позволяя командам сосредоточиться на действительно важных задачах.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description = Rustfmt автоматически форматирует Rust код, облегчая его чтение, написание и поддержку. И что более важно: теперь не надо спорить о местоположении пробелов и скобок.
tools-automation-rustfmt-link = Перейти в репозиторий
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description = <i>"Похоже, что вы пишете Iterator"</i><br>Clippy помогает разработчикам всех уровней опыта писать идиоматический код и обеспечивает соблюдение стандартов.
tools-automation-clippy-link = Перейти в репозиторий
tools-automation-cargo-doc-heading = Cargo Doc
tools-automation-cargo-doc-description = С помощью конструктора документации Cargo, все API будут задокументированы. Документация доступна локально при помощи <code class="nowrap">cargo doc</code> и онлайн для публичных пакетов на <a href="https://docs.rs">docs.rs</a>.
tools-automation-cargo-doc-link = Перейти на сайт

## tools/install.hbs

tools-install-page-title = Установка Rust
install-using-rustup-heading = Используя rustup (рекомендуется)
install-rustup32-button = Загрузить <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span>
install-rustup64-button = Загрузить <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64-bit)</span>
install-notes-heading = Примечания об установке Rust
install-notes-getting-started-description = Если вы только начали работать с Rust и хотите более глубокого погружения, посмотрите страницу о <a href="{ $getting-started-href }">начале работы</a>.
install-notes-rustup-heading = Управление инструментами с <code>rustup</code>
install-notes-rustup-description =
    <p>
      Rust устанавливается и управляется при помощи
      <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a>. Rust имеет 6-недельный
      <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
        процесс выпуска
      </a> и поддерживает
      <a href="https://forge.rust-lang.org/release/platform-support.html">большое количество платформ</a>, так что большое количество сборок Rust доступно в любое время. <code>rustup</code> согласованно управляет этими сборками на каждой платформе, поддерживаемой Rust, включая установку Rust
      из beta и nightly каналов выпусков, а также поддерживает дополнительные цели для кросс-компиляции.
    </p>
    <p>
      Если вы ранее устанавливали <code>rustup</code>, то вы можете обновить инструменты разработчика запустив <code>rustup update</code>.
    </p>
    <p>
    Для дополнительной информации смотрите
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
      документацию по <code>rustup</code></a>.
    </p>
install-notes-uninstall-heading = Удалить Rust
install-notes-uninstall-description =
    <p>
     Если вы по какой-то причине хотите удалить Rust, вы можете запустить
      <code>rustup self uninstall</code>.
      Нам будет тебя не хватать!
    </p>
install-notes-path-heading = Настройка переменной окружения <code>PATH</code>
install-notes-path-description =
    <p>
      В среде разработки Rust, все инструменты устанавливаются в директорию 
      <span class="platform-specific not-win di">
        <code>~/.cargo/bin</code>
      </span>
      <span class="platform-specific win dn">
        <code>%USERPROFILE%\.cargo\bin</code>
      </span>, где вы можете найти набор инструментов Rust,
      включая <code>rustc</code>, <code>cargo</code> и <code>rustup</code>.
    </p>
    <p>
      Соответственно, разработчики на Rust обычно включают её в
      <a href="https://en.wikipedia.org/wiki/PATH_(variable)">переменную окружения
      <code>PATH</code></a>. В процессе установки
      <code>rustup</code> пытается сконфигурировать <code>PATH</code>.
      Из-за разницы между платформами, командными оболочками и багами в
      <code>rustup</code>, изменение <code>PATH</code> может не принести
      результата до тех пор, пока консоль не будет перезапущена или пользователь не перезайдёт в систему, а может и не удастся вообще.
    </p>
    <p>
      Если после установки запуск команды <code>rustc --version</code> в консоли
      терпит неудачу, это может быть наиболее вероятной причиной.
    </p>
install-notes-windows-heading = Особенности Windows
install-notes-windows-description =
    <p>
      На Windows, Rust дополнительно требует инструменты сборки C++ для Visual Studio 2013 или более поздней версии. Самый простой способ получить эти инструменты - это установка
      <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
        Microsoft Visual C++ Build Tools 2019
      </a>, которая предоставляет только инструменты сборки Visual C++. В качестве альтернативы этому способу, вы можете <a href="https://www.visualstudio.com/downloads/">установить</a>
      Visual Studio 2019, Visual Studio 2017, Visual Studio 2015 или Visual
      Studio 2013 и в процессе установки выбрать "C++ tools".
    </p>
    <p>
      Для получения дополнительной информации о настройке Rust в Windows, смотрите
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
      Windows-специфичную документацию <code>rustup</code></a>.
    </p>
install-other-methods-heading = Другие методы установки
install-other-methods-description = Для большинства разработчиков, процесс установки, при помощи <code>rustup</code>, описанный выше, является предпочтительным способом установки Rust. Однако, Rust также может быть установлен при помощи других методов.
install-other-methods-link = Узнайте больше

## components/tools/rustup.hbs

tools-rustup-unixy = Кажется у вас запущена macOS, Linux или другая Unix-подобная ОС. Для загрузки Rustup и установки Rust, запустите следующее в вашем терминале и следуйте инструкциям на экране.
tools-rustup-windows-2 = Похоже, вы работаете под управлением Windows. Чтобы начать использовать Rust, загрузите установщик, затем запустите программу и следуйте инструкциям на экране. Возможно, Вам потребуется установить<a href="https://visualstudio.microsoft.com/visual-cpp-build-tools/">Visual Studio C++ Build tools</a> при появлении соответствующего запроса. Если вы не работаете в Windows, смотрите <a href="https://forge.rust-lang.org/infra/other-installation-methods.html">"другие методы установки"</a>.
tools-rustup-wsl-heading = Windows Subsystem for Linux
tools-rustup-wsl = Если вы используете Windows Subsystem for Linux, для установки Rust запустите следующее в вашем терминале и затем следуйте инструкциям на экране.
tools-rustup-unknown = Rust запускается на Windows, Linux, macOS, FreeBSD и NetBSD. Если вы используете одну из этих платформ и видите это, то пожалуйста, сообщите о проблеме и следующих значениях:
tools-rustup-report = Сообщить о проблеме
tools-rustup-manual-unixy = Если вы используете Unix, то для установки Rust<br>запустите в терминале следующую команду и следуйте инструкциям на экране.
tools-rustup-manual-windows = Если у вас запущен Windows,<br>скачайте и запустите <a href="https://win.rustup.rs">rustup‑init.exe</a> и затем следуйте инструкциям на экране.
tools-rustup-manual-default = Если вы используете Unix, такой как WSL, Linux или macOS, то для установки Rust<br>запустите следующую команду в вашем терминале и следуйте инструкциям на экране.
tools-rustup-manual-default-windows = Если у вас запущен Windows,<br>скачайте и запустите <a href="https://win.rustup.rs">rustup‑init.exe</a>, а затем следуйте инструкциям на экране.

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

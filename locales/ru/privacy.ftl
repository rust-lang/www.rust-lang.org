### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Уведомление о конфиденциальности Rust
policies-privacy-page-version = <p>Версия { $version } от <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro =
    <p>¶
      Проект Rust контролирует ряд проектов, в том числе¶
      <a href="{ $baseurl }/">Rust website</a>,¶
      <a href="https://crates.io">crates.io</a>, and¶
      <a href="https://docs.rs">docs.rs</a>. Это уведомление о конфиденциальности объясняет, что¶
      мы делаем с личной информацией.¶
    </p>
policies-privacy-page-rust-lang-org-desc =
    <p>
      Сайт Rust, находящийся по адресу <a href="{ $baseurl }/">rust-lang.org</a> - это проект
      <a href="{ $baseurl }/governance/teams/core">Core team</a> и
      <a href="{ $baseurl }/governance/teams/community">Community team.</a>
    </p>
    
    <dl>
      <dt>Журнал посещений:</dt>
      <dd>
        Когда вы посещаете rust-lang.org, мы получаем ваш IP адрес как часть стандартных журналов регистрации сервера. Мы храним эти журналы 1 год.
      </dd>
    </dl>
policies-privacy-page-crates-io-desc =
    <p>
      <a href="https://crates.io">Crates.io</a> управляется членами команд
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a> и
      <a href="{ $baseurl }/governance/teams/core">Rust Core</a>.
    </p>
    
    <dl>
      <dt>Вход через GitHub:</dt>
      <dd>
        <p>
          Для входа и использования сервиса, Crates.io требует от пользователей наличия
          <a href="https://github.com">GitHub аккаунта</a>. Когда вы входите на Crates.io
          при помощи Github аккаунта, мы получаем ваш аватар и никнейм на GitHub.
          Если на вашем публичном профиле доступны имя или публичный email, то мы также получаем и эту информацию.
        </p>
      </dd>
    
      <dt>Email адреса:</dt>
      <dd>
        <p>
          Для публикации пакетов, у вас должен быть верифицированый email. Мы получаем любой публичный адрес электронной почты, привязанный к вашему аккаунту на Github. Вы также можете выбрать другой адрес, который будет привязан к вашей активности на Crates.io. Мы будем использовать ваш адрес электронной почты только для связи с вами по вопросам вашего аккаунта.
        </p>
      </dd>
    
      <dt>Логи посещения:</dt>
      <dd>
        <p>
          Когда вы заходите на crates.io, мы получаем ваш IP адрес и заголовок с user-agent как часть стандартных логов сервера. Мы храним эти логи 1 год.
        </p>
      </dd>
    
      <dt>Информация, загруженная в пакеты:</dt>
      <dd>
        <p>
          Все пакеты на crates.io публичны, включая список имён владельцев пакета и даты загрузки. Любой можем просмотреть или загрузить содержимое пакета. В силу публичности crates.io, любые персональные данные, которые вы включили в Cargo.toml загруженного пакета, публично доступны. Например, если email автора указан в поле `authors` файла Cargo.toml, то этот email доступен публично.
        </p>
        <p>
          В силу публичности сервиса, будьте внимательны при добавлении в пакет любой приватной информации - эта информация может индексироваться поисковыми системами или использоваться третьими сторонами. Чувствительная информация не должна быть включена в файлы пакета.
        </p>
      </dd>
    
      <dt>Публикация данных, относящихся к сайту: </dt>
      <dd>
        <p>
          Crates.io использует Google Visualization API для создания графика загрузок за 90 дней для каждого пакета. Эти графики можно найти внизу страницы каждого пакета.
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc =
    <p>
      <a href="https://docs.rs">Docs.rs</a> управляется участниками
      <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">Rustdoc team</a>
      и <a href="{ $baseurl }/governance/teams/core">Rust core team</a>. Проект собирает и использует данные так, как описано в уведомлении о конфиденциальности.
    </p>
    
    <p>
      Docs.rs - это open source проект хостинга документации пакетов для языка программирования Rust. Он автоматически собирает документацию пакетов, опубликованных на <a href="https://crates.io">crates.io</a> используя nightly версию компилятора Rust. Вся информация, опубликованная на docs.rs также публично доступная на crates.io.
    </p>
policies-privacy-page-forums-title = Форумы
policies-privacy-page-forums-desc =
    <p>
      <a href="{ $baseurl }/governance/teams/community">The Rust Community team</a>
      управляет
      <a href="https://users.rust-lang.org">пользовательским форумом (URLO)</a> и
      <a href="https://internals.rust-lang.org">внутренним форумом (IRLO)</a>. Посты на этих форумах публичные. Если вы зарегистрировали для участия в этих форумах, мы получим ваше имя и email. Как администраторы форумов, мы имеем доступ к информации о ваших действиях с ним, таких как публикация постов, их чтение и проведённое на сайте время.
    </p>
policies-privacy-page-third-parties-title = Сторонние сервисы
policies-privacy-page-third-parties-desc =
    <p>
      Пользовательский (URLO) и внутренний (IRLO) форумы на rust-lang.org используют
      <a href="https://www.discourse.org/">Discourse</a> и используют их платформу для общения. Политика конфиденциальности Discourse находится
      <a href="https://www.discourse.org/privacy">здесь</a>.
    </p>
    
    <p>
      Мы используем Mailgun для отправки email. Политика конфиденциальности Mailgun находится
      <a href="https://www.mailgun.com/privacy-policy">здесь</a>.
    </p>
    
    <p>
      Авторизация через GitHub используется в crates.io и (опционально) на форумах. Политику конфиденциальности GitHub можно найти
      <a href="https://help.github.com/en/articles/github-privacy-statement">здесь</a>.
    </p>
    
    <p>
      Некоторые члены команды Rust используют платформы Zulip и Discord для сотрудничества с сообществом. Политика конфиденциальности Zulip доступна
      <a href="https://zulipchat.com/privacy/">здесь</a>, а политика конфиденциальности Discord - 
      <a href="https://discordapp.com/privacy">здесь</a>.
    </p>
policies-privacy-page-contact-title = Контакты
policies-privacy-page-contact-desc =
    <p>
      Для запросов доступа к объекту данных или других вопросов о приватности, пожалуйста напишите на email <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>
    </p>
    
    <p>Также вы можете связаться с нами по адресу:</p>
    
    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Уведомление о конфиденциальности Rust
policies-privacy-page-version = <p>Версия { $version } от <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro =
    <p>
      Проект Rust контролирует ряд проектов, в том числе
      <a href="{ $baseurl }/">сайт Rust</a>,
      <a href="https://crates.io">crates.io</a> и
      <a href="https://docs.rs">docs.rs</a>. Это уведомление о конфиденциальности объясняет, что
      мы делаем с личной информацией.
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
policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      <a href="https://crates.io">Crates.io</a> управляется участниками команд
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a> и
      <a href="{ $baseurl }/governance/teams/core">Rust core</a>.
    </p>
    
    <dl>
      <dt>Вход при помощи GitHub:</dt>
      <dd>
        <p>
          Crates.io требует от пользователей наличия
          <a href="https://github.com">аккаунта на GitHub</a> для входа и 
          использования сервиса. Когда вы входите на Crates.io при помощи
          GitHub аккаунта, мы получаем ваши имя пользователя и аватар на GitHub.
          Если вы открыли доступ к отображаемому имени или публичному email адресу
          на вашему публичном GitHub профиле, мы также получаем эту информацию.
        </p>
      </dd>
    
      <dt>Email адреса:</dt>
      <dd>
        <p>
          У вас должен быть подтвержденный email адрес для публикации пакетов.
          Мы получаем любые публичные email адреса, привязанные к вашему GitHub
          аккаунту. Вы также можете выбрать для отправки другой адрес для связи
          вашей активности на Crates.io. Мы будем использовать ваш email адрес
          только для связи с вами по вопросам вашего аккаунта.
        </p>
      </dd>
    
      <dt>Журнал посещений:</dt>
      <dd>
        <p>
          Когда вы посещаете Crates.io, мы получаем ваш IP адрес как часть 
          стандартных журналов регистрации сервера. Мы храним эти журналы 1 год. 
        </p>
      </dd>
    
      <dt>Данные, отгружаемые в пакетах:</dt>
      <dd>
        <p>
          Все пакеты на Crates.io публичные, включая список владельцев пакета 
          и даты загрузки пакета. Любой может видеть или загружать содержимое 
          пакета. Из-за публичной сущности Crates.io, любые персональные 
          данные, которые вы могли включить в файл Cargo.toml, загруженного
          пакета, будут публичными. Например, если email адрес будет находится
          в поле `authors` в Cargo.toml, то этот адрес будет также публичным.
        </p>
        <p>
          В связи с его публичным характером, имейте в виду, если вы включаете
          личную информацию в пакет, эта информация может быть проиндексирована
          поисковиками или использована третьими лицами. Конфиденциальная информация не
          должна включаться в пакет.
        </p>
      </dd>
    
      <dt>Публикация данных, связанных с сайтом: </dt>
      <dd>
        <p>
          Crates.io использует Google Visualization API для каждого пакета, чтобы
          создать графики о количестве загрузок за 90 дней. Эти графики можно увидеть
          внизу страницы каждого пакета.
        </p>
      </dd>
    
      <dt>Мониторинг ошибок:</dt>
      <dd>
        <p>
          Crates.io использует сервис Sentry для мониторинга ошибок, который помогает
          команде Rust исследовать и исправлять проблемы производительности.
          Sentry отправляет информацию о том как вы взаимодействуете с сайтом
          и действиях, которые привели к возникновению ошибки. Дополнительно,
          Sentry использует ваш IP как часть процесса, но мы настроили Sentry
          так чтобы эти данные удалялись сразу после получения.
          Прочитайте политику Sentry работы с личной информацией <a href="https://sentry.io/privacy/">здесь</a>.
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc--2020-09 =
    <p>
      <a href="https://docs.rs">Docs.rs</a> управляется участниками
      <a href="{ $baseurl }/governance/teams/dev-tools#docs-rs">команды docs.rs</a>
      и <a href="{ $baseurl }/governance/teams/core">Rust Core Team</a>.
    </p>
    
    <dl>
      <dt>Журнал посещений:</dt>
      <dd>
        <p>
          Когда вы посещаете docs.rs, мы получаем ваш IP адрес как часть 
          стандартных журналов регистрации сервера. Мы храним эти журналы 1 год. 
        </p>
      </dd>
    </dl>
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

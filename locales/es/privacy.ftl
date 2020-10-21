### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Aviso de privacidad de Rust
policies-privacy-page-version = <p>Versión { $version }, con fecha <time datetime="{ $date }">{ $date }</time>.</p>
policies-privacy-page-intro =
    <p>
      El proyecto Rust Project supervisa una serie de sitios web, incluyendo el
      <a href="{ $baseurl }/">website de Rust</a>,
      <a href="https://crates.io">crates.io</a> y
      <a href="https://docs.rs">docs.rs</a>. Este aviso de privacidad detalla qué hacemos con los datos personales.
    </p>
policies-privacy-page-rust-lang-org-desc =
    <p>
      El website de Rust en <a href="{ $baseurl }/">rust-lang.org</a> es un proyecto del
      <a href="{ $baseurl }/governance/teams/core">equipo <em>Core</em></a> y el
      <a href="{ $baseurl }/governance/teams/community">equipo de Comunidad.</a>
    </p>
    
    <dl>
      <dt>Registro de visitas:</dt>
      <dd>
        Cuando visitas rust-lang.org, almacenamos tu dirección IP como
        parte de nuestros logs estándares de servidor. Mantenemos
        dichos logs durante 1 año.
      </dd>
    </dl>
policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      <a href="https://crates.io">Crates.io</a> lo administran los equipos de
      <a href="{ $baseurl }/governance/teams/crates-io">crates.io</a> y
      <a href="{ $baseurl }/governance/teams/core">el equipo <em>Core</em></a>.
    </p>
    
    <dl>
      <dt>Iniciar sesión con GitHub:</dt>
      <dd>
        <p>
          Crates.io requiere a los usuarios que posean una <a href="https://github.com">cuenta de GitHub</a>
          para poder iniciar sesión y usar el servicio. Cuando inicias sesión en Crates.io
          usando una cuenta de GitHub, accedemos a tu nombre de usuario y avatar.
          Si muestras en tu perfil público un nombre o una dirección de email pública,
          también accedemos a dicha información.
        </p>
      </dd>
    
      <dt>Direcciones de email:</dt>
      <dd>
        <p>
          Necesitas tener una dirección de email verificada para publicar una <em>crate</em>.
          Accedemos a todas las direcciones de email públicas de tu cuenta de GitHub.
          Puedes también elegir una dirección distinta para que se asocie con tu actividad
          en Crates.io. Solo usaremos tu dirección de email para contactarte sobre tu cuenta.
        </p>
      </dd>
    
      <dt>Registro de visitas:</dt>
      <dd>
        <p>
          Cuando visitas Crates.io, accedemos a tu dirección IP y a tu cabecera de <em>user-agent</em>
          como parte de nuestros logs estándar de servidor. Almacenamos dichos logs durante 1 año.
        </p>
      </dd>
    
      <dt>Información subida en <em>crates</em>:</dt>
      <dd>
        <p>
          Todas las <em>crates</em> en Crates.io son públicas, incluyendo
          los nombres de usuario de los propietarios de la <em>crate</em> y la fecha
          en la que se subió. Los contenidos de una <em>crate</em> pueden ser vistos
          o descargados por cualquiera. Dada la naturaleza pública de Crates.io,
          cualesquiera datos personales que incluyas en un fichero Cargo.toml subido
          a una <em>crate</em> será públicamente accesible. Por ejemplo, si una dirección
          de email aparece en el campo `authors` en dicho fichero, esta será pública también.
        </p>
        <p>
          Debido a esta naturaleza pública, sé consciente de que si incluyes información
          privada en una <em>crate</em>, puede ser indexada por motores de búsqueda o usada
          por terceros. No se debe incluir información sensible en el fichero de una <em>crate</em>.
        </p>
      </dd>
    
      <dt>Publicación de datos relacionados: </dt>
      <dd>
        <p>
          Crates.io utiliza la API de Google Visualization para crear gráficas para cada
          <em>crate</em> que muestran las descargas en los últimos 90 días. Estas gráficas
          pueden verse al final de la página de cada <em>crate</em>.
        </p>
      </dd>
    
      <dt>Monitorización de errores:</dt>
      <dd>
        <p>
          Crates.io utiliza Sentry, un servicio de monitorización de errores, para
          ayudar al equipo de Rust a descubrir y mejorar el rendimiento del código.
          Cuando se produce un error, Sentry recibe información básica de cómo has
          interaccionado en el sitio web y las acciones que lo causaron. Además,
          tu dirección IP puede ser revelada a Sentry como parte del parte de error,
          pero lo hemos configurado para que sea borrada inmediatamente.
          <a href="https://sentry.io/privacy/">Política de privacidad de Sentry</a>.
        </p>
      </dd>
    </dl>
policies-privacy-page-docs-rs-desc--2020-09 =
    <p>
      <a href="https://docs.rs">Docs.rs</a> lo administran el
      <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">equipo de Rustdoc</a>
      y el <a href="{ $baseurl }/governance/teams/core">equipo de <em>core</em> de Rust</a>.
      El proyecto recolecta y usa datos tal y como se describe en este aviso de privacidad.
    </p>
    
    <dl>
      <dt>Registros de visitas:</dt>
      <dd>
        <p>
          Cuando visitas docs.rs, recibimos tu dirección IP y tu cabecera user-agent
          como parte de nuestro registros de visitas estándar. Guardamos dichos registros
          durante 1 año.
        </p>
      </dd>
    </dl>
policies-privacy-page-forums-title = Foros
policies-privacy-page-forums-desc =
    <p>
      El <a href="{ $baseurl }/governance/teams/community">equipo de comunidad</a>
      administra el
      <a href="https://users.rust-lang.org">foro de Usuarios</a> y el
      <a href="https://internals.rust-lang.org">foro de <em>Internals</em></a>.
      Las entradas en estos foros son públicas. Si te registras para participar en
      estos, registramos tu dirección de email y tu nombre. Como administradores del
      foro, tenemos acceso a la información de uso sobre tus interacciones con el mismo,
      como entradas publicadas y leídas, y el tiempo transcurrido en el sitio web.
    </p>
policies-privacy-page-third-parties-title = Servicios de terceros
policies-privacy-page-third-parties-desc =
    <p>
      El foro de Usuarios y el de <em>Internals</em> en rust-lang.org
      están hospedados por <a href="https://www.discourse.org/">Discourse</a>
      y utilizan su plataforma de discusión de código abierto.
      La política de privacidad de Discourse está disponible
      <a href="https://www.discourse.org/privacy">aquí</a>.
    </p>
    
    <p>
      Utilizamos Mailgun para enviar emails. La política de privacidad de Mailgun
      está disponible <a href="https://www.mailgun.com/privacy-policy">aquí</a>.
    </p>
    
    <p>
      El acceso a GitHub se usa para autenticarse en Crates.io y (opcionalmente)
      en los foros. La política de privacidad puede encontrarse
      <a href="https://help.github.com/en/articles/github-privacy-statement">aquí</a>.
    </p>
    
    <p>
      Algunos miembros del equipo de Rust usan las plataformas de Zulip y Discord
      para la colaboración de la comunidad. La política de privacidad de Zulip
      está disponible <a href="https://zulipchat.com/privacy/">aquí</a>.
      La política de privacidad de Discord está disponible
      <a href="https://discordapp.com/privacy">aquí</a>.
    </p>
policies-privacy-page-contact-title = Contacto
policies-privacy-page-contact-desc =
    <p>
      Para peticiones de acceso a datos del interesado, u otras preguntas
      sobre este aviso de privacidad, escribe a
      <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>.
    </p>
    
    <p>Alternativamente, puedes contactarnos en:</p>
    
    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

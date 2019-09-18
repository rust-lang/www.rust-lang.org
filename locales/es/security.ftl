### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Política de seguridad
security-reporting-heading = Informar
security-reporting-link = Escribe a { ENGLISH("security@rust-lang.org") }
security-reporting-description =
    <p>La seguridad es uno de los principios fundamentales de Rust, y con ese objetivo, nos gustaría garantizar que Rust tiene una implementación segura. Te agradecemos que nos informes responsablemente de cualquier problema que puedas encontrar.</p>
    <p>Todos los errores de seguridad en la distribución de Rust deben ser comunicados por email a { -security-at-rust-lang-org-anchor }. Esta lista se envía a un pequeño equipo de seguridad. Tu notificación tendrá un acuso de recibo en las siguientes 24 horas, y recibirás una respuesta más detallada por email en 48 horas indicando los siguientes pasos en la gestión de tu caso. Si prefieres, puedes encriptar tu notificación usando <a href="{ -rust-security-team-key-href }">nuestra clave pública</a>. Esta clave también está en <a href="{ -rust-pgp-key-mit-keyserver-href }">el servidor de claves del MIT</a> y <a href="#security-pgp-key">reproducida más abajo</a>.</p>
    <p>Esta dirección de email recibe una gran cantidad de spam, así que asegúrate que usas una línea de asunto descriptiva para evitar que tu notificación se pierda. Después del informe inicial en respuesta a tu notificación, el equipo de seguridad se esforzará en mantenerte informado del progreso hecho para arreglar el problema y su anuncio público. Como se recomienda en <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>, estos informes se enviarán por lo menos cada cinco días. En realidad es más probable que sea cada 24-48 horas.</p>
    <p>Si no has recibido respuesta a tu email en 48 horas, o no has oído nada del equipo de seguridad durante los últimos cinco días, hay unos cuantos pasos que puedes seguir (en orden):</p>
    <ul>
      <li>Contactar con el coordinador de seguridad ({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">clave pública</a>)) directamente.</li>
      <li>Contactar con el contacto de reserva ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">clave pública</a>)) directamente.</li>
      <li>Publicar en el <a href="{ -internals-rust-lang-org-href }">foro de asuntos internos</a></li>
    </ul>
    <p>Por favor, ten en cuenta que las discusiones en los foros son públicas. Cuando se escala un error en esos medios, no discutas ahí directamente tu problema. Simplemente indica que estás intentando ponerte en contacto con alguien del equipo de seguridad.</p>
security-disclosure-heading = Política de divulgación
security-disclosure-description =
    <p>El proyecto Rust tiene un proceso de divulgación de 5 pasos.</p>
    <ol>
      <li>El informe de seguridad se recibe y se le asigna un gestor principal. Esta persona coordinará el proceso de reparación y lanzamiento.</li>
      <li> El problema se confirma y se determina una lista de todas las versiones afectadas.</li>
      <li>El código es auditado para encontrar otros problemas similares.</li>
      <li>Se preparan soluciones para todas las versiones que aún están en mantenimiento. Estas correcciones no se integran con el repositorio público, sino que se mantienen localmente a la espera de ser anunciadas.</li>
      <li>En la fecha de publicación, la <a href="{ -rustlang-security-announcements-google-groups-forum-href }"> lista de correo de seguridad de Rust</a> recibe una copia del anuncio. Los cambios se integran en el repositorio público y las nuevas compilaciones se despliegan en rust-lang.org. Dentro de las 6 horas posteriores a la notificación en la lista de correo, se publicará una copia del aviso en el blog de Rust.</li>
    </ol>
    <p>Este proceso puede llevar algún tiempo, especialmente cuando se requiere coordinación con los responsables de otros proyectos. Se hará todo lo posible para gestionar el error de la manera más oportuna posible, sin embargo, es importante que sigamos el proceso de publicación anterior para garantizar que la divulgación se lleve a cabo de manera coherente.</p>
security-receiving-heading = Recibir actualizaciones de seguridad
security-receiving-description =
    <p>La mejor manera de recibir todos los anuncios de seguridad es suscribirse a la <a href="{ -rust-security-announcements-mailing-list-href }">lista de correo de anuncios de seguridad de Rust</a> (o como alternativa enviando un email a { -rustlang-security-announcements-subscribe-anchor }). La lista de correo tiene muy poco tráfico y recibe las notificaciones públicas en el momento en que se levanta el embargo.</p>
    <p>Anunciaremos vulnerabilidades 72 horas antes de que el embargo se levante a { -distros-openwall-email-anchor }, de manera que las distribuciones de Linux puedan actualizar sus paquetes.</p>
security-pgp-key-heading = Clave PGP en texto plano

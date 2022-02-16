### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Política de seguridad
security-reporting-heading = Informar
security-reporting-link = Escribe a { ENGLISH("security@rust-lang.org") }
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

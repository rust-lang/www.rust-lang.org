### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Política de segurança
security-reporting-heading = Denunciando
security-reporting-link = email { ENGLISH("security@rust-lang.org") }
security-disclosure-heading = Política de divulgação de vulnerabilidades
security-disclosure-description =
    <p>O projeto Rust possui um programa de divulgação em 5 passos.</p>
    <ol>
      <li>O relatório de segurança é recebido e um contato primário é designado. Essa pessoa coordenará a correção e o processo de divulgação.</li>
      <li>O problema é confirmado e é determinada uma lista de todas as versões afetadas.</li>
      <li>O código é auditado para encontrar qualquer problema similar em potencial.</li>
      <li>Correções são preparadas para todas as distribuições ainda sob manutenção. Essas correções não são publicadas nos repositórios publicos, mas mantidas pendentes localmente até o anúncio publico.</li>
      <li>Na data de embargo, a <a href="{ -rustlang-security-announcements-google-groups-forum-href }">lista de emails sobre segurança Rust </a> recebe uma cópia do anúncio. As mudanças são publicadas no repositório público e novos binários são publicados no site rust-lang.org.  Dentro de 6 horas da notificação na lista de emails, uma copia de orientação será publicada no blog do Rust.</li>
    </ol>
    <p>Esse processo pode demorar um pouco, especialmente quando é necessário a coordenação com pessoas responsáveis de outros projetos. Será dado todo esforço para tratar dessas falhas no melhor tempo possível, entretanto é importante seguir o processo de distribuição acima para garantir que a divulgação seja lidada de maneira consistente.</p>
security-receiving-heading = Recebendo atualizações de segurança
security-receiving-description =
    <p>A melhora maneira de receber todos os anúncios de segurança é se inscrever na <a href="{ -rust-security-announcements-mailing-list-href }">Lista de anúncios de segurança de Rust </a> (alternativamente enviando um email para { -rustlang-security-announcements-subscribe-anchor }). A lista de email é de pouco volume, e notificações são enviadas apenas quando o embargo é encerrado.</p>
    <p>Nos anunciaremos vulnerabilidades 72 horas antes do fim do embargo para { -distros-openwall-email-anchor }, para que distribuições Linux possam atualizar seus pacotes.</p>
security-pgp-key-heading = Chave PGP em texto puro

### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Política de segurança
security-reporting-heading = Denunciando
security-reporting-link = email { ENGLISH("security@rust-lang.org") }
security-reporting-description =
    <p>Essa página é traduzida pela comunidade, e a tradução é mantida na base do melhor esforço. Se refira ao <a href="https://www.rust-lang.org/policies/security">documento original</a> para saber os termos oficiais que serão garantidos.</p>
    
    <p>Segurança é um dos princípios primários do projeto Rust, e por causa disso, gostaríamos de garantir que Rust possui uma implementação segura. Obrigado por dedicar tempo para informar qualquer problema que você encontre.</p>
    <p>Todos os problemas de segurança na distribuição do Rust deve ser reportado pelo email { -security-at-rust-lang-org-anchor }. Está lista é entregue a uma pequena equipe de segurança. Seu email será reconhecido por alguém dentro de 24 horas, e você receberá uma resposta mais detalhada no seu email dentro de 48 horas indicando os próximos passos sobre como lidar com o seu relato. Caso você queira, você pode encriptar seu relato usando <a href="{ -rust-security-team-key-href }">nossa chave pública</a>. Essa chave também está disponível no <a href="{ -rust-pgp-key-mit-keyserver-href }">servidor de chaves do MIT</a> e <a href="#security-pgp-key">reproduzida abaixo</a>.</p>
    <p>Esse email recebe uma grande quantidade de spam, então use um titulo descritivo para evitar que seu relatório passe despercebido. Depois da primeira resposta do seu relatório, a Equipe de Segurança se esforçará a te manter informado sobre o progresso realizado para corrigir os problemas e sobre os anúncios completos. Como recomendado pela <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>, essas atualizações serão enviadas a cada 5 dias. Na realidade, será algo a cada 24-48 horas.</p>
    <p>Caso você nãp tenha recebido uma resposta para seu email dentro das 48 horas, ou não tenha recebido atualizações da equipe de segurança por 5 dias, existem alguns passos que você pode seguir (em ordem):</p>
    <ul>
      <li>Contate a pessoa em posição de coordenação ({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">chave pública</a>)) diretamente.</li>
      <li>Contate o nosso contato backup ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">chave pública</a>)) diretamente.</li>
      <li>Escreva um post no <a href="{ -internals-rust-lang-org-href }">fórum interno</a></li>
    </ul>
    <p>Note por favor que as discussões no fórum são áreas publicas. Quando escalar o problema por esses meios, não discute diretamente seu problema. Apenas diga que você está tentando entrar em contato com alguém da Equipe de Segurança.</p>
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

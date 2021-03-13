### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Aviso de Privacidade de Rust
policies-privacy-page-version = <p>Versão { $version }, em <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro =
    <p>
      O Project Rust acompanha diversos projetos, incluindo
      <a href="{ $baseurl }/">o website sobre Rust<a>,
      <a href="https://crates.io">crates.io</a>, e
      <a href="https://docs.rs">docs.rs</a>. Esse aviso sobre privacidade explica o que é feito com informações pessoais.
    </p>
policies-privacy-page-rust-lang-org-desc =
    <p>
      O site sobre Rust em <a href="{ $baseurl }/">rust-lang.org</a> é um projeto
      da <a href="{ $baseurl }/governance/teams/core">equipe Core</a> e da
      <a href="{ $baseurl }/governance/teams/community">equipe de Comunidade.</a>
    </p>
    
    <dl>
      <dt>Visitor logs:</dt>
      <dd>
        When you visit rust-lang.org, we receive your IP address as part of
        our standard server logs. We store these logs for 1 year.
      </dd>
    </dl>
policies-privacy-page-crates-io-desc--2020-09 =
    <p>
      <a href="https://crates.io">Crates.io</a> é gerenciado por membros dos times
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a> e
      <a href="{ $baseurl }/governance/teams/core">principal</a>.
    </p>
    
    <dl>
      <dt>Acessando com o GitHub:</dt>
      <dd>
        <p>
          Crates.io requer que os usuários tenham uma
          <a href="https://github.com">conta no GitHub</a>
          para poder acessar e usar o serviço. Quando você acessa o Crates.io
          usando uma conta do GitHub, nós recebemos seu usuário e avatar do GitHub. Se
          você compartilha um nome de exibição ou endereço de email em seu perfil público
          do GitHub, nós também recebemos essas informações.
        </p>
      </dd>
    
      <dt>Endereços de email:</dt>
      <dd>
        <p>
          Você precisa ter um endereço de email verificado para publicar uma <i>crate</i>. Nós recebemos
          qualquer endereço de email público associado a sua conta do GitHub. Você também pode
          escolher submeter um endereço diferente para associar a sua atividade no Crates.io. Nós iremos
          usar o seu endereço de email somente para contatá-lo sobre sua conta.
        </p>
      </dd>
    
      <dt>Logs de visitante:</dt>
      <dd>
        <p>
          Quando você visita Crates.io, nós recebemos seu endereço IP e o cabeçalho <i>user-agent</i>
          como parte dos nossos logs padrões de servidor. Armazenamos esses logs por 1 ano.
        </p>
      </dd>
    
      <dt>Informação enviada com as crates:</dt>
      <dd>
        <p>
          Todas as <i>crates</i> no Crates.io são públicas, incluindo a lista de nomes dos mantenedores e a data de envio da <i>crate</i>.
          Qualquer um pode ver ou baixar o conteúdo de uma <i>crate</i>. Por conta da natureza pública do Crates.io, qualquer
          informação pessoal que você possa incluir em um arquivo Cargo.toml enviado junto a uma crate estará disponível publicamente.
          Por exemplo, se um endereço de email está no campo `authors` no arquivo Cargo.toml, esse endereço também estará público.
        </p>
        <p>
          Devida a sua natureza pública das <i>crates</i>, verifique se você incluiu
          alguma informação privada. Essas informações podem ser indexadas por motores de
          busca ou usadas por terceiros. Dados sensíveis não devem ser incluídos nos
          arquivos de uma <i>crate</i>.
        </p>
      </dd>
    
      <dt>Publicação de dados relacionados ao site: </dt>
      <dd>
        <p>
          O Crates.io usa a Google Visualization API  para criar gráficos para cada
          <i>crate</i>, mostrando a quantidade de downloads nos últimos 90 dias. Esses
          gráficos podem ser vistos na parte inferior de cada página de <i>crate</i>.
        </p>
      </dd>
    
      <dt>Monitoramento de erros:</dt>
      <dd>
        <p>
          O Crates.io usa o Sentry, um serviço de monitoramento de erros, para ajudar o
          time Rust a descobrir e corrigir a performance do código. Quando um erro ocorre,
          o Sentry recebe informações basicas sobre como você interagiu com o site e
          quais acões levaram ao erro. Adicionalmente, seu endereço IP pode ser divulgado
          para o Sentry como parte do processo de comunicação do erro, mas nós
          configuramos o serviço para deletar seu endereço assim que ele é recebido. Leia
          a <a href="https://sentry.io/privacy/">Política de Privacidade do Sentry
         aqui</a>.
        </p>
      </dd>
    </dl>
policies-privacy-page-forums-title = Fóruns
policies-privacy-page-third-parties-title = Serviços terceiros
policies-privacy-page-contact-title = Contato

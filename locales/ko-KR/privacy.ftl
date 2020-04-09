### Translation file for page: https://www.rust-lang.org/policies/privacy

## templates/policies/privacy.hbs

policies-privacy-page-title = Rust Privacy Notice

policies-privacy-page-version =
    <p>Version { $version }, dated <time datetime="{ $date }">{ $date }</time></p>

policies-privacy-page-intro =
    <p>
      러스트 프로젝트는
      <a href="{ $baseurl }/">러스트 홈페이지</a>,
      <a href="https://crates.io">crates.io</a>, 그리고
      <a href="https://docs.rs">docs.rs</a>를 포함 많은 프로젝트를 감독합니다.
      이 개인 정보 공지는 우리가 개인 정보로 무엇을 하는 설명합니다.
    </p>

policies-privacy-page-rust-lang-org-desc =
    <p>
      <a href="{ $baseurl }/">rust-lang.org</a>의 러스트 홈페이지는
      <a href="{ $baseurl }/governance/teams/core">코어 팀</a>과
      <a href="{ $baseurl }/governance/teams/community">커뮤니티 팀</a>의 프로젝트입니다.
    </p>

    <dl>
      <dt>방문자 기록:</dt>
      <dd>
        rust-lang.org를 방문하면, 우리는 표준 서버 로그의 일부로써 여러분의 IP 주소를 받습니다.
        그리고 이 기록을 1년간 보관합니다.
      </dd>
    </dl>

policies-privacy-page-crates-io-desc =
    <p>
      <a href="https://crates.io">Crates.io</a>는
      <a href="{ $baseurl }/governance/teams/crates-io">Crates.io</a>과
      <a href="{ $baseurl }/governance/teams/core">러스트 코어 팀</a>의 멤버들에 의해 운영됩니다.
    </p>

    <dl>
      <dt>깃허브로 로그인:</dt>
      <dd>
        <p>
          Crates.io는 사용자가 서비스에 로그인하기 위해
          <a href="https://github.com">깃허브 계정</a>을 가지고 있어야 합니다.
          여러분이 깃허브 계정을 사용하여 Crates.io에 로그인하면, 우리는 여러분의 깃허브 사용자 이름과 아바타 정보를 받습니다.
          깃허브 공개 프로필에서 표시 이름이나 메일 주소를 공유하면 해당 정보도 수신됩니다.
        </p>
      </dd>

      <dt>이메일 주소:</dt>
      <dd>
        <p>
          크레이트를 게시하려면 확인된 이메일 주소가 있어야 합니다. 
          우리는 깃허브 계정과 관련된 모든 메일 주소를 받습니다. 
          또한 Crates.io 활동과 연결할 다른 주소를 제출하도록 선택할 수 있습니다. 
          우리는 오직 여러분의 이메일 주소를 여러분에게 연락하기 위해 사용할 것이다.
        </p>
      </dd>

      <dt>방문자 기록:</dt>
      <dd>
        <p>
          Crates.io를 방문하면, 우리는 표준 서버 로그의 일부로써 여러분의 IP 주소 사용자 에이전트 헤더를 받습니다.
          그리고 이 기록을 1년간 보관합니다.
        </p>
      </dd>

      <dt>크레이트에 업로드 된 정보:</dt>
      <dd>
        <p>
          Crates.io의 모든 크레이트는 크레이트 소유자의 사용자 이름 목록과 크레이트 업로드 날짜를 포함하여 공개되어 있습니다.
          누구나 크레이트의 내용을 보거나 다운로드 할 수 있습니다.
          Crates.io의 공공성 때문에, 크레이트에 업로드된 Cargo.toml 파일에 포함할 수 있는 모든 개인 데이터가 공개될 것입니다.
          예를 들어, 메일 주소가 Cargo.toml 파일의 "auters" 필드에 있는 경우 해당 메일 주소도 공개됩니다.
        </p>
        <p>
          공공성 때문에 크레이트에 개인 정보를 포함시킬 경우 검색 엔진에 의해 정보가 색인화되거나 제3자가 사용할 수 있다는 점에 유의하세요.
          중요한 정보는 크레이트 파일에 포함되지 않아야 합니다.
        </p>
      </dd>

      <dt>사이트 관련 데이터 개시: </dt>
      <dd>
        <p>
          Crates.io은 구글 시각화 API를 사용하여 지난 90일 동안의 다운로드를 보여주는 각 상자에 대한 그래프를 생성합니다.
          그 그래프는 각 크레이트 페이지의 하단에서 볼 수 있습니다.
        </p>
      </dd>
    </dl>

policies-privacy-page-docs-rs-desc =
    <p>
      <a href="https://docs.rs">Docs.rs</a>는
      <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">러스트문서 팀</a>
      과 <a href="{ $baseurl }/governance/teams/core">러스트 코어 팀</a>이 관리하고 있습니다.
      이 프로젝트는 개인 정보 보호 고지서에 설명된 대로 데이터를 수집하여 사용합니다.
    </p>

    <p>
    Docs.rs은 러스트 프로그래밍 언어의 크레이트 설명서를 호스트하는 오픈 소스 프로젝트입니다.
    그것은 러스트 컴파일러의 나이틀리 릴리즈를 이용하여 <a href="https://crates.io">crates.io</a>에 발매된 크레이트의 문서를 자동으로 만듭니다.
    docs.rs에 게시된 상자의 모든 정보는 crates.io에서 공개됩니다.

    </p>


policies-privacy-page-forums-title = 포럼
policies-privacy-page-forums-desc =
    <p>
      <a href="{ $baseurl }/governance/teams/community">The Rust Community team</a>은
      <a href="https://users.rust-lang.org">사용자 포럼</a>과
      <a href="https://internals.rust-lang.org">국제 포럼</a>을 관리합니다.
      이 포럼의 게시물은 공개적입니다. 당신이 이 포럼에 참가하기 위해 등록한다면, 우리는 당신의 메일 주소와 이름을 수집합니다.
      포럼의 관리자로서 우리는 게시 및 게시물 읽기 같은 사이트에서 보내는 시간을 포럼과의 상호 작용에 관한 사용 정보에 접근할 수 있습니다.
    </p>

policies-privacy-page-third-parties-title = 써드 파티 서비스
policies-privacy-page-third-parties-desc =
    <p>
      rust-lang.org의 사용자 포럼 국제 포럼은 <a href="https://www.discourse.org/">Discourse</a>이
      주최하고 Discourse의 오픈 소스 토론 플랫폼을 사용합니다.
      Discourse의 개인 정보 보호 정책은 <a href="https://www.discourse.org/privacy">여기</a>에서 확인할 수 있습니다.
    </p>

    <p>
      우리는 메일을 보내기 위해 메일건을 사용합니다. 메일건의 개인 정보 보호 정책은
      <a href="https://www.mailgun.com/privacy-policy">여기</a>에서 확인할 수 있습니다.
    </p>

    <p>
      깃허브 로그인은 Crates.io 및 포럼(의 프로그램) 인증에 사용됩니다.
      깃허브의 개인 정보 보호 정책은 <a href="https://help.github.com/en/articles/github-privacy-statement">여기</a>에서 확인할 수 있습니다.
    </p>

    <p>
      일부 러스트 팀 구성원들은 지역사회 협력을 위해 줄립과 디스코드를 사용합니다.
      줄립의 프라이버시 알림은 <a href="https://zulipchat.com/privacy/">여기</a>에서 확인할 수 있습니다.
      디스코드의 개인 정보 보호 정책은 <a href="https://discordapp.com/privacy">여기</a>에서 확인할 수 있습니다.
    </p>

policies-privacy-page-contact-title = 연락
policies-privacy-page-contact-desc =
    <p>
      데이터 주체 액세스 요청 또는 이 개인 정보 보호 통지에 대한 문의는
      <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a>으로 이메일을 보내주세요.
    </p>

    <p>또는 여기서 우리를 만날 수 있습니다.</p>

    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

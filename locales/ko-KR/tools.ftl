## tools/index.hbs

tools-page-title = Tools

tools-editor-support-heading = 퍼스트 클래스 에디터 지원
tools-editor-support-description = 커맨드 라인에서 코드를 사용하는 것이 좋든, 풍부한 그래픽 편집기를 사용하는 것이 좋든, 여러가지 선택지가 있습니다.
        또는 <a href="https://github.com/rust-lang/rls">러스트 언어 서버</a>를 이용해서 직접 만들 수 있습니다.

tools-build-heading = 빌드에 안정성을 추가하기
tools-build-description = 카고는 러스트를 위한 빌드 툴입니다. 이것은 모든 일반적인 행동을 하나의 명령어로 묶어줍니다. 상용 코드가 필요하지 않습니다.

tools-build-install-heading = 설치
tools-build-install-description = 수만개의 패키지로 가득한 <a href="https://crates.io">crates.io</a>가
        여러분이 찾고 있는 솔루션을 가지고 있을 확률이 큽니다.
        거인의 어깨 위에 서서, 여러분의 팀을 반복에서 혁신으로 옮기세요.

tools-build-test-heading = 테스트
tools-build-test-description = 러스트의 우수한 테스트 도구를 통해 코드에 자신감을 불어넣으세요.
        <code class="nowrap">cargo test</code>는 러스트의 테스트 통합 솔루션입니다.
        코드 옆에 또는 별도의 파일로 테스트를 작성하세요. 모든 테스트 요구 사항에 대한 솔루션을 제공할 것입니다..

tools-build-deploy-heading = 배치
tools-build-deploy-description = <code class="nowrap">cargo build</code>는 모든 플랫폼에 대해 희박한 바이너리를 만듭니다.
        단일 명령으로 여러분의 코드는 윈도우즈, 리눅스, OSX 및 웹(맞춤 빌드 파일이 필요 없는 최신 인터페이스의 모든 부분)을 대상으로 할 수 있습니다.

tools-automation-heading = 자동화를 통한 속도
tools-automation-description = 러스트의 업계 수준의 도구는 협업을 두려움 없이 만들어 팀들이 중요한 작업에 집중할 수 있도록 합니다.

tools-automation-rustfmt-heading = 러스트포맷
tools-automation-rustfmt-description = 러스트포맷(rustfmt)은 자동으로 러스트 코드를 포맷하여 읽기, 쓰기, 유지보수를 용이하게 합니다.
        그리고 가장 중요한 것은 간격이나 준비 자세에 대해 다시는 논하지 말라는 것입니다.
tools-automation-rustfmt-link = 리포지토리 방문하기

tools-automation-clippy-heading = 클리
tools-automation-clippy-description = <i>“이터레이터를 쓰시네요.”</i> <br> 클리피는 모든 경험 수준의 개발자들이 관용 코드를 작성하고 표준을
        시행하도록 돕습니다.
tools-automation-clippy-link = 리포지토리 방문하기

tools-automation-cargo-doc-heading = 카고 독
tools-automation-cargo-doc-description = 카고의 독빌더는 API가 문서화되지 않도록 합니다. 이것은 <code class="nowrap">cargo doc</code>을 통해,
         그리고 <a href="https://docs.rs">docs.rs</a>를 통해 공공 크레이트를 위해 온라인으로 로컬에서 이용할 수 있습니다.
tools-automation-cargo-doc-link = 사이트 방문하기


## tools/install.hbs

tools-install-page-title = Install Rust

install-using-rustup-heading = 러스트업 사용하기(추천)

install-rustup32-button = <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span> 다운로드

install-rustup64-button = <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64-bit)</span> 다운로드

install-notes-heading = 러스트 설치 방법

install-notes-getting-started-description = 이제 막 러스트를 시작하고, 보다 자세한 내용을 보려면
        <a href="{ $getting-started-href }">러스트 시작하기</a> 페이지를 참고하세요.

install-notes-rustup-heading = <code>rustup</code>으로 툴체인 관리하
install-notes-rustup-description = 
        <p>
          러스트는
          <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a> 툴에 의해서 설치되고 관리됩니다.
          러스트는 6주간의
          <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
            빠른 릴리즈 과정
          </a>이 있고,
          <a href="https://forge.rust-lang.org/platform-support.html">수많은 좋은 플랫폼</a>을 지원하므로,
           언제든지 이용할 수 있는 러스트의 빌드들도 많습니다. <code>rustup</code>은 러스트가 지원하는 모든 플랫폼에서 이러한 빌드를
           일관성있게 관리하여 베타 및 나이틀리 릴리즈 채널에서 러스트를 설치할 수 있을 뿐만 아니라 추가 교차 컴파일 대상도 지원할 수 있습니다.
        </p>
        <p>
          여러분이 이전에 <code>rustup</code>로 러스트를 설치하셨다면,
          <code>rustup update</code> 명령어를 실행하여 최신 버전으로 업데이트할 수 있습니다.
        </p>
        <p>
          더 많은 정보를 보시려면
          <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
          <code>rustup</code> documentation</a>을 참고하세요.
        </p>

install-notes-path-heading = <code>PATH</code> 환경 변수 설정하기
install-notes-path-description = 
        <p>
         모든 러스트 개발 환경에서, 모든 툴
          <span class="platform-specific not-win di">
            <code>~/.cargo/bin</code>
          </span>
          <span class="platform-specific win dn">
            <code>%USERPROFILE%\.cargo\bin</code>
          </span> 디렉토리에 설치되며, 여기에서 <code>rustc</code>, <code>cargo</code>, 그리고 <code>rustup</code>를 포함한
          러스트 툴 체인들을 찾아볼 수 있습니다.
        </p>
        <p>
          따라서, 러스트 개발자들은 그들의
          <a href="https://en.wikipedia.org/wiki/PATH_(variable)">
          <code>PATH</code> 환경 변수</a>에 이 디렉토리를 포함시키는 것이 관례입니다. 설치 중에 <code>rustup</code>이 <code>PATH</code> 환경 변수
          구성을 시도할 것입니다. 플랫폼, 커맨드 쉘 및 <code>rustup</code>속 버그 간 차이 때문에, <code>PATH</code>의 수정은 콘솔을 다시 시작하거나,
          사용자가 로그아웃할 때까지 효력이 발생하거나, 전혀 성공하지 못할 수도 있습니다.
        </p>
        <p>
          설치 이후, 콘솔에서 <code>rustc --version</code> 명령어 실행에 실패한다면, 이것이 거의 대부분의 이유일 것입니다.
        </p>

install-notes-windows-heading = Windows considerations
install-notes-windows-description =
        <p>
          On Windows, Rust additionally requires the C++ build tools
          for Visual Studio 2013 or later. The easiest way to acquire the build
          tools is by installing
          <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
            Microsoft Visual C++ Build Tools 2019
          </a>
          which provides just the Visual C++ build tools. Alternately, you
          can <a href="https://www.visualstudio.com/downloads/">install</a>
          Visual Studio 2019, Visual Studio 2017, Visual Studio 2015, or Visual
          Studio 2013 and during install select the “C++ tools.”
        </p>
        <p>
          For further information about configuring Rust on Windows see the
          <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
          Windows-specific <code>rustup</code> documentation</a>.
        </p>

install-other-methods-heading = 다른 설치 방법
install-other-methods-description = <code>rustup</code>과 같이 위에서 설명한 설치 방법은 대부분, 개발자가 러스트를 설치할 때 선호하는 방법입니다.
        그러나 러스트는 다른 방법으로도 설치할 수 있습니다.
install-other-methods-link = 더 알아보기

## components/tools/rustup.hbs

tools-rustup-unixy = 맥, 리눅스 또는 유닉스와 유사한 운영체제를 실행하고 있는 경우, 러스트업을 다운로드하고 러스트를 설치하려면 터미널에서 다음을 실행한 후 화면의 지침을 따르세요. 윈도우 환경에 있는 경우 <a href="https://forge.rust-lang.org/infra/other-installation-methods.html">"다른 설치 방법"</a>을 참고하세요.
tools-rustup-windows = 윈도우 환경에서 실행하고 있는 경우, 러스트 사용을 시작하려면 설치 프로그램을 다운로드한 다음 프로그램을 실행하고 화면의 지침을 따르세요. 윈도우 환경이 아닌 경우 <a href="https://forge.rust-lang.org/infra/other-installation-methods.html">"다른 설치 방법"</a>을 참고하세요.
tools-rustup-wsl-heading = 리눅스를 위한 윈도우 서브 시스템
tools-rustup-wsl = 리눅스를 위한 윈도우 서브 시스템 사용자인 경우 터미널에서 다음을 실행하고 화면의 지침에 따라 러스트를 설치하세요.
tools-rustup-unknown = 러스트는 윈도우, 리눅스, 맥, FreeBSD, NetBSD에서 실행됩니다. 이러한 플랫폼 중 하나에 있으며 이러한 플랫폼이 있는 경우 다음 값을 사용하여 문제를 보고하세요.
tools-rustup-report = 이슈 신고하기
tools-rustup-manual-unixy = 유닉스를 실행중인 경우 러스트를 설치하려면, <br>터미널에서 다음을 실행한 후 화면의 지침을 따르세요.
tools-rustup-manual-windows = 윈도우 환경에서 실행중인 경우, <br> <a href="https://win.rustup.rs">rustup‑init.exe</a>를 다운로드한 다음 프로그램을 실행하고 화면의 지침을 따르세요.
tools-rustup-manual-default = WSL과 같은 유닉스, 리눅스 또는 맥에서 러스트를 설치하려면,<br> 터미널에서 다음을 실행한 후 화면의 지침을 따르세요.
tools-rustup-manual-default-windows = 윈도우 환경에서 실행중인 경우, <br><a href="https://win.rustup.rs">rustup‑init.exe</a>를 다운로드한 다음 프로그램을 실행하고 화면의 지침을 따르세요.

## components/tools/editors.hbs

tools-editor-vscode = VS 코드
tools-editor-sublime = 서브라임 텍스트 3
tools-editor-atom = 아톰
tools-editor-idea = 인텔리J (역자 추천)
tools-editor-eclipse = 이클립스
tools-editor-vim = 빔
tools-editor-emacs = 이맥스
tools-editor-geany = 지니

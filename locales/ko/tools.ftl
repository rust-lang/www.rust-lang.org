## tools/index.hbs

tools-page-title = 도구
tools-editor-support-description =
    코드를 명령줄에서 작성하든, 그래픽 편집기를 사용하든,
    선택한 편집기에서 Rust 연동 기능을 사용할 수 있습니다. 아니면 직접
    <a href="https://github.com/rust-lang/rls">Rust 언어 서버</a>를 이용해 만들어낼 수도 있습니다.
tools-build-install-heading = 설치
tools-build-install-description = <a href="https://crates.io">crates.io</a> 에는 수만 개의 패키지와 함께 당신이 찾고 있는 해결책이 있습니다. 거인의 어깨에 올라, 팀에서 하는 반복적인 행위를 혁신으로 옮기세요.
tools-build-test-heading = 테스트
tools-build-deploy-heading = 배포
tools-automation-description = Rust가 제공하는 산업 수준의 도구는 협업을 두려워하지 않고 팀이 중요한 작업에만 집중할 수 있도록 합니다.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-link = 저장소로 이동
tools-automation-clippy-heading = Clippy
tools-automation-clippy-link = 저장소로 이동

## tools/install.hbs

tools-install-page-title = 러스트 설치
install-rustup32-button = <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(32-bit)</span> 다운로드
install-rustup64-button = <span class="nowrap">rustup-init.exe</span> <span class="nowrap">(64-bit)</span> 다운로드
install-notes-heading = Rust 설치에 대한 참고사항
install-notes-getting-started-description = Rust를 처음 시작하시고 좀 더 자세한 안내를 원하신다면, <a href="{ $getting-started-href }">getting started</a> 페이지를 봐 주세요.
install-notes-rustup-heading = <code>rustup</code>으로 툴체인 관리
install-notes-path-description =
    <p>
      Rust 개발 환경 안에서는 모든 도구들이
      <span class="platform-specific not-win di">
        <code>~/.cargo/bin</code>
      </span>
      <span class="platform-specific win dn">
        <code>%USERPROFILE%\.cargo\bin</code>
      </span> 디렉토리에 설치되므로, 이곳이 
      <code>rustc</code>, <code>cargo</code>, <code>rustup</code> 등을 포함한 Rust 툴체인을 찾을 수 있는 곳입니다.
    </p>
    <p>
      따라서, Rust 개발자들은 관례적으로 이 디렉토리를
      <a href="https://en.wikipedia.org/wiki/PATH_(variable)">
      <code>PATH</code> 환경 변수</a>에 포함시키곤 합니다.
      <code>rustup</code>은 설치 과정 도중에 <code>PATH</code>를 설정하려고 시도할 수 있습니다.
      여러 플랫폼과 명령 셸 사이의 차이점, 또는 <code>rustup</code>의 버그로 인해, 재시작이나 로그아웃하기 전까지 <code>PATH</code>를 변경한 내용이 반영되지 않거나, 변경이 성공하지 못할 수도 있습니다.
    </p>
    <p>
      만약, 설치 이후에 콘솔에서 <code>rustc --version</code>이 동작하지 않는다면, 이런 이유일 가능성이 높습니다.
    </p>
install-notes-windows-heading = Windows 고려사항
install-other-methods-link = 더 알아보기

## components/tools/rustup.hbs

tools-rustup-wsl-heading = Linux용 Windows 하위 시스템 (WSL)

## components/tools/editors.hbs

tools-editor-vscode = VS Code
tools-editor-sublime = Sublime Text 3
tools-editor-atom = Atom
tools-editor-idea = IntelliJ IDEA
tools-editor-eclipse = Eclipse
tools-editor-vim = Vim
tools-editor-emacs = Emacs
tools-editor-geany = Geany

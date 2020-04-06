## learn/index.hbs

learn-page-title = Learn Rust
learn-begin = 러스트 시작하기

learn-book = “그 책”이라는 닉네임을 가진 <cite>The Rust Programming Language</cite>은 언어의 기초부터 전반적인 내용까지 담고잇습니다. 읽다보면 중간에 몇 개의 프로젝트를 만들게 되고, 마지막에 이르러서는 언어를 확실하게 파악하게 될 겁니다.
learn-book-button = "그 책" 읽기!
learn-rustlings = 또는 러스트 툴체인의 다운로드 및 설정 과정을 안내하고, 커맨드 라인에서 러스트 구문을 읽고 쓰는 기초를 알려줍니다. 이것은 여러분의 환경에서 작용하는 <cite>Rust by Example</cite>의 대안입니다.
learn-rustlings-button = 러스틀링 코스!
learn-rbe = 한 언어에 대해서 수백 페이지의 분량을 읽는 것이 여러분의 스타일이 아니라면, <cite>Rust by Example</cite>이 딱입니다. 책이 많은 단어로 코드에 대해 이야기하는 동안에, RbE는 많은 코드를 자랑하고, 대화를 최소한으로 유지합니다. 또한 예제도 포함되어 있습니다!
learn-rbe-button = 예제로 보는 러스트!

learn-use = 함께 성장하기

learn-doc-heading = 핵심 문서 읽기
learn-doc = 이 곳의 모든 문서는 <code>rustup doc</code>를 이용하여 로컬에서 사용 가능하며, 여러분을 위해 네트워크의 연결 없이 여러분의 브라우저로 열릴 것입니다!

learn-doc-std = 표준 라이브러리 API에 대한 포괄적인 가이드
learn-doc-std-button = 표준 라이브러리

learn-doc-edition = 러스트 에디션 안내
learn-doc-edition-button = 에디션 가이드

learn-doc-cargo = 러스트의 패키지 매니저와 빌드 시스템
learn-doc-cargo-button = 카고 (cargo)

learn-doc-rustdoc = 여러분의 크레이트를 위해 멋진 문서를 작성하는 방법
learn-doc-rustdoc-button = 러스트독 (rustdoc)

learn-doc-rustc = 러스트 컴파일러에서 사용할수있는 노브를 숙지하세요.
learn-doc-rustc-button = 러스트씨 (rustc)

learn-doc-error = 여러분이 컴파일러에서 보게 될 에러들에 대한 깊은 설명
learn-doc-error-button = 컴파일러 에러 색인


learn-domain = 애플리케이션 도메인에서 기술 구축

learn-domain-cli-button = 커맨드 라인 북
learn-domain-cli = 러스트에서 효율적인 커맨드 라인 앱을 개발하는 방법을 배우세요.

learn-domain-wasm-button = 웹 어셈블리 북
learn-domain-wasm = 웹 어셈블리를 통한 브라우저 네이티브 라이브러리를 구축하려면 러스트를 사용하세요.

learn-domain-embedded-button = 임베디드 북
learn-domain-embedded = 마이크로 컨트롤러 및 기타 임베디드 시스템에 대한 러스트를 숙련하세요.


learn-master = 러스트 통달하기
learn-master-text = 언어의 음지가 궁금하세요? 여기 니티그릿에 들어갈 수 있는 곳이 있습니다.


learn-reference-alt = 선반
learn-reference = 참고 문헌은 정식 규격은 아니지만, 책보다 더 상세하고 포괄적입니다.
learn-reference-button = 레퍼런스 읽기

learn-nomicon-alt = 캠프파이어
learn-nomicon = 러스토노미콘은 안전하지 않은 러스트의 암흑 예술에 대한 당신의 지침서입니다. '노미콘'이라고 부르기도 합니다.
learn-nomicon-button = 노미콘 읽기

learn-unstable-alt = 꽃가루 뿌리기
learn-unstable = 나이틀리 러스트에서만 사용 가능한 불완전한 기능에 대한 불완전한 책입니다.
learn-unstable-button = 불완전한 책 읽기

## learn/get-started.hbs

learn-get-started-page-title = Getting Started

learn-setup = 러스트 개발 환경을 빠르게 구축하고 작은 앱을 작성하세요!

learn-install-heading = 설치하기
learn-play = 홈페이지의 플레이그라운드를 통해 설치없이 해볼 수 있습니다.
learn-play-button = 설치없이 해보기

learn-install-rustup-header = 러스트업 (Rustup): 러스트 인스톨러와 버전 관리 툴
learn-install-rustup = 러스트를 설치하는 주된 방법은 러스트 인스톨러 및 버전 관리 툴인 러스트업 (Rustup)을 사용하는 것입니다.
learn-install-rustup-update-header = 최신 버전인가요?
learn-install-rustup-update = 러스트는 자주 업데이트 됩니다. 러스트를 설치한 지 꽤 되었다면, 여러분의 버전이 오래된 버전일 가능성이 있습니다. { $update-command } 명령어로 러스트를 최신 버전으로 업데이트 하세요.
learn-install-rustup-button = 설치에 대해 자세히 알아보기


learn-install-cargo-header = 카고: 러스트 빌드 툴 및 패키지 매니저
learn-install-cargo = <p>러스트업을 설치하면 최신의 안정적인 버전의 러스트 빌드 도구와 패키지 매니저(카고)도 제공받을 수 있습니다. 카고는 많은 일을 합니다.:</p>
                        <ul>
                          <li><code>cargo build</code> 명령어로 여러분의 프로젝트를 빌드하세요.</li>
                          <li><code>cargo run</code> 명령어로 여러분의 프로젝트를 실행하세요.</li>
                          <li><code>cargo test</code> 명령어로 여러분의 프로젝트를 테스트하세요.</li>
                          <li><code>cargo doc</code> 명령어로 프로젝트 문서를 빌드하세요.</li>
                          <li><code>cargo publish</code></li> 명령어로 <a href="https://crates.io">crates.io</a>에 여러분 라이브러리를 올려보세요.
                        </ul>
                        <p>터미널에서 아래의 명령어로 러스트 및 카고가 설치되어 있는지 테스트하세요.</p>
                        <p><code>cargo --version</code></p>
learn-install-cargo-button = 카고 북 읽

learn-install-other = 기타 도구
learn-install-editors = 많은 에디터에서 러스트를 사용할 수 있습니다.

learn-generating = 새 프로젝트 생성하기
    learn-generating-steps = <p>새 러스트 개발 환경에 작은 앱을 작성해보세요. 우리는 카고를 사용하여 새 프로젝트를 생성할 것 입니다. 당신의 터미널에서 아래의 명령어를 실행해보세요.</p>
    <p><code>cargo new hello-rust</code></p>
    <p>이 명령어는 <code>hello-rust</code>라 새 디렉토리와 함께 아래의 파일들을 생성할 것 입니다.</p>
    { $tree }
    <p><code>Cargo.toml</code> 파일은 러스트의 공식 파일이며, 프로젝트의 메타데이터와 종속성을 보관할 수 있는 위치입니다.</p>
    <p><code>src/main.rs</code> 파일은 우리 코드를 작성할 곳입니다.</p>
    <hr/>
    <p><code>cargo new</code> 파일은 "Hello, world!" 프로젝트를 생성해줍니다! 우리는 우리가 만든 새로운 디렉토리로 이동하여 터미널에서 실행함으로써 이 프로그램을 실행할 수 있습니다.</p>
    <p><code>cargo run</code></p>
    <p>여러분의 터미널에서 아래와 같은 메세지를 볼 수 있을 것입니다.</p>
    { $output }

learn-dependencies = 종속성 추가하기
learn-dependencies-steps = <p>Let’s add a dependency to our application. You can find all sorts of libraries on <a href="https://crates.io">crates.io</a>, the package registry for Rust. In Rust, we often refer to packages as “crates.”</p>
      <p>In this project, we’ll use a crate called <a href="https://crates.io/crates/ferris-says"><code>ferris-says</code></a>.
      <p>In our <code>Cargo.toml</code> file we’ll add this information (that we got from the crate page):</p>
      { $cargotoml }
      <p>Now we can run:</p>
      <code>cargo build</code>
      <p>...and Cargo will install our dependency for us.</p>
      <p>You’ll see that running this command created a new file for us, <code>Cargo.lock</code>. This file is a log of the exact versions of the dependencies we are using locally.</p>
      <p>To use this dependency, we can open <code>main.rs</code>, remove everything that’s in there (it’s just another example), and add this line to it:</p>
      <pre><code>use ferris_says::say;</code></pre>
      <p>This line means that we can now use the <code>say</code> function that the <code>ferris-says</code> crate exports for us.</p>

learn-app = A small Rust application
learn-app-steps = <p>Now let’s write a small application with our new dependency. In our <code>main.rs</code>, add the following code:</p>
    { $code }
    <p>Once we save that, we can run our application by typing:</p>
    <p><code>cargo run</code></p>
    <p>Assuming everything went well, you should see your application print this to the screen:</p>
    { $output }

learn-read-docs-header = Learn more!
learn-read-docs = You’re a Rustacean now! Welcome! We’re so glad to have you. When you’re ready, hop over to our Learn page, where you can find lots of books that will help you to continue on your Rust adventure.
learn-read-docs-button = learn more!

learn-ferris-who = Who’s this crab, Ferris?
learn-ferris = <p>Ferris is the unofficial mascot of the Rust Community. Many Rust programmers call themselves “Rustaceans,” a play on the word “<a href="https://en.wikipedia.org/wiki/Crustacean">crustacean</a>.” We refer to Ferris with the pronouns “they,” “them,” etc., rather than with gendered pronouns.</p>
               <p>Ferris is a name playing off of the adjective, “ferrous,” meaning of or pertaining to iron. Since Rust often forms on iron, it seemed like a fun origin for our mascot’s name!</p>
               <p>You can find more images of Ferris on <a href="http://rustacean.net/">http://rustacean.net/</a>.
learn-ferris-alt = a gif of ferris scurrying side to side


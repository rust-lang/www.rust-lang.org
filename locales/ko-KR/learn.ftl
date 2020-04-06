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
learn-install-rustup-button = 설치에 대해 자세히 알아보


learn-install-cargo-header = Cargo: the Rust build tool and package manager
learn-install-cargo = <p>When you install Rustup you’ll also get the latest stable version of the Rust build tool and package manager, also known as Cargo. Cargo does lots of things:</p>
                        <ul>
                          <li>build your project with <code>cargo build</code></li>
                          <li>run your project with <code>cargo run</code></li>
                          <li>test your project with <code>cargo test</code></li>
                          <li>build documentation for your project with <code>cargo doc</code></li>
                          <li>publish a library to <a href="https://crates.io">crates.io</a> with <code>cargo publish</code></li>
                        </ul>
                        <p>To test that you have Rust and Cargo installed, you can run this in your terminal of choice:</p>
                        <p><code>cargo --version</code></p>
learn-install-cargo-button = Read the cargo book

learn-install-other = Other tools
learn-install-editors = Rust support is available in many editors:

learn-generating = Generating a new project
learn-generating-steps = <p>Let’s write a small application with our new Rust development environment. To start, we’ll use Cargo to make a new project for us. In your terminal of choice run:</p>
    <p><code>cargo new hello-rust</code></p>
    <p>This will generate a new directory called <code>hello-rust</code> with the following files:</p>
    { $tree }
    <p><code>Cargo.toml</code> is the manifest file for Rust. It’s where you keep metadata for your project, as well as dependencies.</p>
    <p><code>src/main.rs</code> is where we’ll write our application code.</p>
    <hr/>
    <p><code>cargo new</code> generates a "Hello, world!" project for us! We can run this program by moving into the new directory that we made and running this in our terminal:</p>
    <p><code>cargo run</code></p>
    <p>You should see this in your terminal:</p>
    { $output }

learn-dependencies = Adding dependencies
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


### Translation file for https://www.rust-lang.org/what/wasm

## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly


## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = 기어
wasm-why-rust-predictable-heading = 예측 가능한 퍼포먼스
wasm-why-rust-predictable-description =
        예측할 수 없는 가비지 콜렉팅이 중단되지 않습니다. JIT 컴파일러 성능 절벽이 없습니다. 높은 수준의 인체공학과 결합된 낮은 수준의 제어.

wasm-why-rust-small-code-alt = 망원경
wasm-why-rust-small-code-heading = 작은 코드 크기
wasm-why-rust-small-code-description =
        코드의 크기가 작으면 페이지 로드가 짧아집니다. 러스트로 만들어진 <code>.wasm</code>은 가비지 콜렉터와 같은 추가적인 덩어리는 포함하지 않습니다. 고급 최적화 및 트리 셰이킹은 죽은 코드를 제거합니다.

wasm-why-rust-amenities-alt = 짐
wasm-why-rust-amenities-heading = 현대적 편의성
wasm-why-rust-amenities-description =
        활기찬 라이브러리 생태계를 통해 여러분이 그라운드 러닝을 하도록 돕습니다. 표현력있고, 비용도 전혀 들지 않는 추상화. 그리고 배우는 것을 환영하는 도움이 되는 커뮤니티.


## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = 웹 어셈블리 로고
wasm-get-started-wasm-description =
        웹 어셈블리라고 하는 빠르고 안전하며 열린 가상 시스템에 대해 자세히 알아보고 해당 표준을 읽어보세요.
wasm-get-started-wasm-link = 더 알아보기

wasm-get-started-book-alt = 웹어셈 패리스
wasm-get-started-book-description =
        러스트를 사용하여 웹 어셈블리 애플리케이션을 빌드, 디버그, 프로파일링 및 배포하는 방법을 알아보세요!
wasm-get-started-book-link = 책 읽기

wasm-get-started-mdn-alt = MDN 로고
wasm-get-started-mdn-description =
        모질라 개발자 네트워크에서 웹 어셈블리에 대해 자세히 알아보세요.
wasm-get-started-mdn-link = 확인하러 가기

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = 자바스크립트 잘 사용하기

wasm-js-augment-heading = 어그먼트, 대체 금지
wasm-js-augment-description =
        웹 어셈블리의 꿈은 자바스크립트를 죽이는 것이 아니라 그와 함께 작업하는 것으로, 성과에 집중함으로써 이익을 얻는 무거운 가공이나 낮은 수준의 작업들을 초충전하는 것을 돕는 것입니다.

wasm-js-toolchains-heading = 친근한 툴체인과의 작업
wasm-js-toolchains-description =
        npm과 같은 패키지 레지스트리에 러스트 웹 어셈블리 패키지를 게시하세요. 그것들을 웹팩, 파셀 등과 함께 묶어서 배포하세요. <code>npm audit</code> 및 그린키퍼와 같은 도구를 사용하여 유지 관리하세요.

wasm-js-interop-heading = 매끄러운 인터럽트
wasm-js-interop-description =
        러스트, 웹 어셈블리 및 자바스크립트 API 간에 바인딩 코드 자동 생성 전체 웹 플랫폼에 사전 패키지 바인딩을 제공하는 <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code></a>와 같은 라이브러리를 활용하세요.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = cloudflare logo
wasm-production-cloudflare-quote =
        우리는 러스트를 웹 어셈블리로 컴파일할 수 있고, 그것을 바로 인터넷의 구조에 짜여진 서버리스 기능에서 호출할 수 있습니다. 그것은 엄청나고 나는 그것을 더 하고 싶어 견딜 수가 없습니다.
wasm-production-cloudflare-attribution =
        Steven Pack, <a href="{ $href }">Serverless Rust with Cloudflare Workers</a>

wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote =
        [<code>source-map</code> 라이브러리]의 자바스크립트 구현은 성능이라는 이름으로 난해한 코드를 축적하여 관용적인 러스트로 대체하였습니다. 러스트는 우리가 의도를 분명히 표현하는 것과 런타임 성능을 선택하는 것을 강요하지 않습니다.
wasm-production-mozilla-attribution =
        Nick Fitzgerald, <a href="{ $href }">Oxidizing Source Maps with Rust and WebAssembly</a>

wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote =
        {"["}러스트]의 속성은 위와 같이 웹 어셈블리로 만들어진 웹페이지의 DivANS 코덱을 쉽게 내장할 수 있도록 합니다.
wasm-production-dropbox-attribution =
        Daniel Reiter Horn and Jongmin Baek, <a href="{ $href }">Building Better Compression Together with DivANS</a>

### Translation file for https://www.rust-lang.org/what/embedded

## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Embedded devices


## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = 현미경
embedded-pitch-analysis-heading = 강력한 정적 분석
embedded-pitch-analysis-description =
        컴파일 시간에 핀과 주변 구성을 적용하세요. 응용 프로그램의 의도하지 않은 부분에 의해 리소스가 사용되지 않도록 보장하세요.

embedded-pitch-memory-alt = 램
embedded-pitch-memory-heading = 유연한 메모리
embedded-pitch-memory-description =
        동적 메모리 할당은 선택입니다. 전역 할당기와 동적 자료구조를 사용하세요. 또는 힙을 완전히 빼고 모든 것을 정적으로 할당하세요.

embedded-pitch-concurrency-alt = 기어
embedded-pitch-concurrency-heading = 두려움이 없는 동시성
embedded-pitch-concurrency-description =
        러스트는 스레드 간의 상태를 실수로 공유하는 것을 불가능하게 만듭니다. 어떠한 동시성 접근법을 사용하던지, 여러분은 여전히 러스트의 강력한 보증을 받을 것입니다.

embedded-pitch-interop-alt = 악수
embedded-pitch-interop-heading = 상호운용성
embedded-pitch-interop-description =
        기존의 C 코드베이스에 러스트를 통합하거나, 기존의 SDK를 활용하여 러스트 애플리케이션을 작성하세요.

embedded-pitch-portability-alt = 짐 수레
embedded-pitch-portability-heading = 휴대성
embedded-pitch-portability-description =
        라이브러리나 드라이버를 한 번 작성하고, 매우 작은 마이크로 컨트롤러에서부터 강력한 SBC에 이르기까지 다양한 시스템과 함께 사용하세요.

embedded-pitch-community-alt = 방패
embedded-pitch-community-heading = 커뮤니티 중심
embedded-pitch-community-description =
        신뢰할 수 있는 러스트 오픈 소스 프로젝트의 일환으로, 임베디드 시스템에 대한 지원은 상업적 파트너의 지원을 받아 동급 최강의 오픈 소스 커뮤니티에 의해 추진됩니다.

embedded-learn-more-link = 더 알아보기


## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = 쇼케이스

embedded-showcase-quote =
        "모질라에서 온 러스트와 마주쳤을 때 저는 너무 흥분됐어요. 러스트는 '안전성, 속도, 동시성 다 챙기세요.'라는 태그가 붙어 있는 새로운 프로그래밍 언어입니다. 또한 강력하고 헌신적인 사용자 커뮤니티와 함께 확실한 미래를 가지고 있습니다."
embedded-showcase-quote-attribution =
        &ndash; Jonathan Pallant, Senior Consultant, Cambridge Consultants
embedded-showcase-see-more-link = 더 보기

embedded-showcase-video-description =
        <a href="https://vimeo.com/224912526">러스트로 미래의 보안을 챙기세요</a> - <a href="https://vimeo.com">Vimeo</a>의 <a href="https://vimeo.com/cambridgeconsultants">Cambridge Consultants</a> 채널.


## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = DIP-6 package
embedded-get-started-discovery-book-heading = 디스커버리 북
embedded-get-started-discovery-book-description =
        러스트를 사용하여 임베디드 개발을 처음부터 배워보세요!

embedded-get-started-embedded-rust-book-alt = QFP-20 package
embedded-get-started-embedded-rust-book-heading = 임베디드 러스트 북
embedded-get-started-embedded-rust-book-description =
        이미 임베디드 개발에 친숙하다구요? 러스트를 사용하여 혜택을 누리세요.

embedded-get-started-embedonomicon-alt = BGA package
embedded-get-started-embedonomicon-heading = 임베도노미콘
embedded-get-started-embedonomicon-description =
        임베디드 기반 라이브러리를 살펴보세요.

embedded-get-started-read-link = 읽기
embedded-get-started-more-documentation-link = 더 많은 문서


## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Sensirion logo
embedded-testimonials-sensirion-quote =
        Sensirion에서는 최근에 러스트를 사용하여 <a href="https://sensirion-automotive.com/products#PM2_5">미립자 물질 센서</a>의 데모를 만들었습니다. 크로스 컴파일이 쉽고 <a href="https://crates.io">crates.io</a>에서 많은 양의 고품질 크레이트들을 이용 가능하기 때문에 <b>우리는 빠르고 강력한 데모를 만들었습니다.</b>
embedded-testimonials-sensirion-attribution =
        &ndash; Raphael Nestler, Software Engineer, Sensirion

embedded-testimonials-airborne-alt = Airborne Engineering Ltd logo
embedded-testimonials-airborne-quote =
        Airborne Engineering Ltd.에서 우리는 최근에 러스트를 사용하여 부트로더, <a href="https://github.com/airborneengineering/blethrs">블레쓰르즈(blethrs)</a>, 사내 데이터 수집 시스템을 작성했습니다. <b>러스트는 아주 유망한 언어이고 그것을 우리의 미래 프로젝트에 사용하게 되어서 매우 기쁩니다.</b>
embedded-testimonials-airborne-attribution =
        &ndash; Dr. Adam Greig, Instrumentation Engineer, Airborne Engineering Ltd.

embedded-testimonials-49nord-alt = 49nord logo

# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote =
        {"["}러스트] 소프트웨어를 가능한 빠르고 정확하게 구동되도록 해줍니다. 러스트 덕분에, 우리는 메모리 안전을 당연하게 여길 수 있고, 정교한 타입 시스템을 갖춘 제로 오버헤드 언어의 다른 이점들은 우리가 유지 가능한 소프트웨어를 개발하는 데 도움을 줄 수 있습니다. <b>러스트는 우리의 고객을 행복하게 하고, 우리의 엔지니어 역시 행복하게 했습니다.</b>
embedded-testimonials-49nord-attribution =
        &ndash; Marc Brinkmann, CEO, 49nord

embedded-testimonials-terminal-tech-alt = Terminal Technologies logo
embedded-testimonials-terminal-tech-quote =
        C나 C++의 대체가 사실상 불가능한 <b>임베디드 환경에서 이렇게 현대적이고 멋진 언어를 사용할 수 있다는 것은 너무 환상적이라고 생각합니다.</b>
embedded-testimonials-terminal-tech-attribution =
        &ndash; Aleksei Arbuzov, Senior Software Engineer, Terminal Technologies

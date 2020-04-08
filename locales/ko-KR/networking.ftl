## templates/what/networking.hbs

what-networking-page-title = Networking

## templates/components/what/networking/get-started.hbs

networking-get-started = 러스트는 웹을 위한 사용하기 쉬운 라이브러리의 생태계가 점점 더 커지고 있습니다. 다음은 두 가지 예시에 불과합니다.
networking-get-started-post-json = JSON POST
networking-get-started-take-json = JSON POST 관리
networking-get-started-reqwest = 리퀘스트(reqwest) 더 알아보기
networking-get-started-rocket = 로켓(Rocket) 더 알아보기

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = 작은 설치 공간
networking-pitch-footprint =
    메모리 및 CPU 설치 공간을 최소로 유지하려면 리소스 사용량을 제어하세요.
    컴파일러의 도움을 받아 제대로 이해했는지 확인하세요.
    그리고 이것을 생산적이고 사용하기 좋은 환경으로 만드세요.
networking-pitch-footprint-alt = 깃털


networking-pitch-secure-header = 보안 및 신뢰성
networking-pitch-secure =
    러스트의 강력한 타입 체커는 모든 종류의 버그를 예방합니다.
    상태가 공유되고 변하는 시기와 위치를 정확히 알아야 합니다.
    구축하기 전에 장애 발생 지점과 장애 발생 지점 파악에 대한 도움을 받으세요.
networking-pitch-secure-alt = 방패


networking-pitch-concurrent-header = 규모에 따른 동시성
networking-pitch-concurrent =
    여러분에게 적합한 동시성 접근법을 혼합하여 사용하세요.
    러스트는 여러분이 스레드나 작업 간에 상태를 실수로 공유하지 않도록 해줍니다.
    그것은 여러분이 두려움 없이 모든 마지막 스케일링을 짜낼 수 있게 해줍니다.
networking-pitch-concurrent-alt = 연결된 기어


## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla =
   푸시 커넥션 인프라를 러스트로 마이그레이션함으로써 코드 베이스를 보다 쉽게 유지하면서도 정확성에 중점을 두고 환상적인 성능을 제공할 수 있게 되었습니다.
   우리는 현재 러스트 서버를 통해 피크 시간대에 최대 2천만 개의 웹소켓 연결을 한 번에 처리하고 있습니다.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla

networking-production-testimonial-buoyant =
    러스트는 Linkerd 프로젝트의 기술 로드맵에 기초합니다.
    그것의 타입 시스템은 우리가 런타임 성능을 희생하지 않고, 테스트할 수 있고, 합성할 수 있는 모듈식 유닛을 만들 수 있게 해줍니다.
    그러나 가장 놀라운 것은 러스트의 수명/버로우 체커 시스템이 어떻게 우리가 대규모의 자원 누출을 피할 수 있게 해주는지에 관한 것입니다.
    2년이 지난 지금, 나는 그 일을 위해 다른 언어를 사용하는 것을 상상할 수 없습니다.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>

### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Security policy

security-reporting-heading = 신고하기
security-reporting-link = { ENGLISH("security@rust-lang.org") }에 이메일하기
security-reporting-description =
        <p>보안은 러스트의 핵심 원칙 중 하나이며, 이를 위해 러스트의 보안 이행을 보장하고자 합니다. 시간을 내어 발견한 문제를 책임감 있게 공개해 주셔서 감사합니다.</p>
        <p>러스트 배포의 모든 보안 버그는 { -security-at-rust-lang-org-anchor }로 알려주셔야 합니다. 이 목록은 소규모 보안 팀에게 전달됩니다. 여러분의 이메일은 24시간 내에 승인될 것이며, 여러분은 48시간 이내에 여러분의 보고서를 처리할 다음 단계를 나타내는 더 상세한 답변을 받을 것입니다. 원하신다면 <a href="{ -rust-security-team-key-href }">저희의 공개 키</a>를 사용하여 보고서를 암호화할 수 있습니다. 이 키는 또한 <a href="{ -rust-pgp-key-mit-keyserver-href }">On MIT 키서버</a>에 있으며, <a href="#security-pgp-key">아래</a>에 복제되어 있습니다.</p>
        <p>이 메일 주소는 많은 양의 스팸을 수신하므로 보고서가 누락되지 않도록 설명 제목 줄을 사용하십시오. 여러분의 보고서에 대한 첫 번째 답변이 끝난 후, 보안 팀은 수정과 완전한 발표를 위한 진행 상황을 당신에게 계속 알려주기 위해 노력할 것입니다.  <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>가 권장한대로, 이러한 업데이트는 최소 5일마다 전송됩니다. 실제로 매 24시간에서 48시간 마다 있을 가능성이 더 큽니다.</p>
        <p>48시간 동안 메일에 대한 회신을 받지 못했거나, 지난 5일 동안 보안 팀으로부터 연락을 받지 못한 경우, 몇 가지 조치를 취할 수 있습니다.</p>
        <ul>
          <li>현재 보안 코디네이터에게 ({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">공개 키</a>)) 즉시 문의하십시오.</li>
          <li>백업 담당자에게 ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">공개 키</a>)) 즉시 문의하십시오.</li>
          <li><a href="{ -internals-rust-lang-org-href }">내부 포럼</a>에 글을 기재하십시오.</li>
        </ul>
        <p>토론 포럼은 공개 영역이라는 점에 유의하십시오. 이러한 장소에서 에스컬레이팅할 때는 여러분의 문제에 대해 논의하지 마십시오. 단순히 보안 팀에서 누구와 연락을 취하려고 한다고만 하십시오.</p>

security-disclosure-heading = 공개 정책
security-disclosure-description =
        <p>러스트 프로젝트는 5단계의 공개 과정이 있습니다.</p>
        <ol>
          <li>보안 보고서가 수신되고 기본 보고서가 할당됩니다. 이 사람은 고정 및 해제 프로세스를 조정할 것입니다.</li>
          <li>문제가 확인되고 영향을 받는 모든 버전의 목록이 결정됩니다.</li>
          <li>코드는 잠재적인 유사한 문제를 찾기 위해 감사됩니다.</li>
          <li>아직 유지 보수 중인 모든 릴리즈에 대해 수정 사항이 준비됩니다. 이러한 수정사항은 퍼블릭 리포지토리에 커밋되는 것이 아니라, 발표될 때까지 내부적으로 보관됩니다.</li>
          <li>금수 날짜에, <a href="{ -rustlang-security-announcements-google-groups-forum-href }"> 러스트 보안 메일링 리스트</a>는 안내문 사본을 보냅니다. 이러한 변화는 퍼블릭 리포지토리로 추진되며, 새로운 빌드는 rust-lang.org에 배포됩니다. 메일링 리스트가 통보된 지 6시간 이내애, 자문 사본이 러스트 블로그에 게시될 것입니다.</li>
        </ol>
        <p>이 과정은 시간이 오래 걸릴 수 있으며, 특히 다른 프로젝트의 유지관리자와 조율이 필요할 때 더욱 그렇습니다. 가능한 한 적절한 시기에 버그를 처리하기 위해 모든 노력을 기울이겠지만, 공시가 일관성있게 처리되도록 하기 위해 위의 릴리즈 프로세스를 따르는 것이 중요합니다.</p>

security-receiving-heading = 보안 업데이트 받기
security-receiving-description =
        <p>모든 보안 공지사항을 받아보는 가장 좋은 방법은 <a href="{ -rust-security-announcements-mailing-list-href }">러스트 보안 메일링 리스트</a>를 구독하는 것입니다(또는 { -rustlang-security-announcements-subscribe-anchor }로 메일 보내). 메일링 목록은 트래픽이 매우 낮고, 금수 조치가 해제되는 순간 공공 알림을 받습니다.</p>
        <p>우리는 { -distros-openwall-email-anchor }에 대한 금수 조치 해제 72시간 이전에 취약점을 발표해 리눅스 배포가 그들의 패키지를 업데이트할 수 있도록 할 것입니다.</p>

security-pgp-key-heading = 일반 텍스트 PGP키

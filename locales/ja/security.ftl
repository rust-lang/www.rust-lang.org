### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = セキュリティポリシー
security-reporting-heading = 報告
security-reporting-link = { ENGLISH("security@rust-lang.org") }にメールを送る
security-reporting-description =
    <p>安全性はRustの中核となる理念の一つであり、そのために、我々はRustがセキュアに実装されていることを保証したいと思っています。発見した問題を責任を持って報告してくださり、ありがとうございます。</p>
    <p>Rustに関するすべてのセキュリティ関連のバグを見つけた場合、メールにて{ -security-at-rust-lang-org-anchor }へ報告してください。このメーリングリストは小規模のセキュリティチームへメールを転送します。メールは24時間以内に確認され、報告の処理を行うための次のステップに関する返信が48時間以内に送信されます。必要に応じて、<a href="{ -rust-security-team-key-href }">我々の公開鍵</a>で報告の内容を暗号化することもできます。この公開鍵は<a href="{ -rust-pgp-key-mit-keyserver-href }">MITのキーサーバー</a>と<a href="#key">このページの下段</a>にも記載されています。</p>
    <p>数多くの迷惑メールがこのメールアドレス宛に届いているため、手違いにより報告が見落とされないよう、詳細な内容を件名にご記入お願いします。報告への最初の返信の後、セキュリティチームは、問題の修正と開示に向けた進捗状況を継続的に報告するように努めます。<a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>の推奨している通りに、少なくとも5日ごと、通常ほぼ24-48時間ごとに進捗状況をお知らせします。</p>
    <p>もし48時間以内にメールの返信が届かなかった場合、もしくは5日以上セキュリティチームからの進捗状況の報告が届かなかった場合には、順序に従い以下の方法で連絡してください：</p>
    <ul>
      <li>現セキュリティ担当者({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">公開鍵</a>))に直接連絡する。</li>
      <li>副担当者({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">公開鍵</a>))に直接連絡する。</li>
      <li><a href="{ -internals-rust-lang-org-href }">内部フォーラム</a>に投稿する。</li>
    </ul>
    <p>フォーラムはパブリックな場所であることに注意してください。フォーラムでは問題について触れずに、セキュリティチームの誰かと連絡を取りたいことだけを伝えてください。</p>
security-disclosure-heading = 情報開示方針
security-disclosure-description =
    <p>Rustプロジェクトには5段階の情報開示プロセスがあります。</p>
    <ol>
      <li>セキュリティに関する報告を受け取ったら、その問題を担当する人を割り当てます。この担当者が修正とリリースプロセスを管理します。</li>
      <li>問題が確認されたら、影響を受ける全てのバージョンのリストを作成します。</li>
      <li>コードを精査し、潜在的な同様の問題を見つけます。</li>
      <li>メンテナンスされている全てのリリースに対して修正を用意します。これらの修正は、パブリックリポジトリにはコミットされず、開示があるまでローカルに置かれます。</li>
      <li>開示日に、<a href="{ -rustlang-security-announcements-google-groups-forum-href }">Rustセキュリティメーリングリスト</a>にアナウンスのコピーが送信されます。そして、変更がパブリックリポジトリにプッシュされ、新しいビルドがrust-lang.orgにデプロイされます。メーリングリスト向けに通知されてから6時間以内に、アナウンスのコピーがRustブログで公開されます。</li>
    </ol>
    <p>このプロセスには、特に他のプロジェクトのメンテナとの調整が必要な場合には、時間がかかることもあります。可能な限り迅速に問題を修正するためにあらゆる努力を尽くしますが、開示が一貫した方法で行われることを保証するために、上記のリリースプロセスに従うことに重きを置いています。</p>
security-receiving-heading = セキュリティアップデートの受信
security-receiving-description =
    <p>全てのセキュリティアナウンスメントを受け取るもっともよい方法は<a href="{ -rust-security-announcements-mailing-list-href }">Rustセキュリティアナウンスメントメーリングリスト</a>を購読することです（別の方法は{ -rustlang-security-announcements-subscribe-anchor }へメールを送ることです）。このメーリングリストの投稿数は非常に少なく、そして情報が解禁された瞬間、公的な通知を受信します。</p>
    <p>{ -distros-openwall-email-anchor }については、Linuxディストリビューションがパッケージを更新できるように、情報が解禁される72時間前に脆弱性を公表します。</p>
security-pgp-key-heading = プレーンテキストのPGP鍵

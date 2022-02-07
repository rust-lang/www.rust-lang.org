### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = セキュリティポリシー
security-reporting-heading = 報告
security-reporting-link = { ENGLISH("security@rust-lang.org") }にメールを送る
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

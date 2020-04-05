### Translation file for page: https://www.rust-lang.org/policies/privacy


## templates/policies/privacy.hbs

policies-privacy-page-title = Rust 隐私声明
policies-privacy-page-version = <p>版本 { $version }，更新日期 <time datetime="{ $date }">{ $date }</time></p>
policies-privacy-page-intro = <p>Rust 项目监督着其他数个项目，包括 <a href="{ $baseurl }/">Rust 网站</a>、<a href="https://crates.io">crates.io</a> 和 <a href="https://docs.rs">docs.rs</a>。这份隐私声明解释了我们如何处理个人信息。
policies-privacy-page-rust-lang-org-desc =
    <p>位于 <a href="{ $baseurl }/">rust-lang.org</a> 的 Rust 网站是<a href="{ $baseurl }/governance/teams/core">核心团队</a>和<a href="{ $baseurl }/governance/teams/community">社区团队</a>的一个项目。</p>
    
    <dl>
      <dt>访客日志：</dt>
      <dd>当您访问 rust-lang.org 时，作为我们标准服务器日志的一部分，我们会接收到您的 IP 地址。这些日志我们储存1年时间。</dd>
    </dl>
policies-privacy-page-crates-io-desc =
    <p><a href="https://crates.io">Crates.io</a> 由 <a href="{ $baseurl }/governance/teams/crates-io">Crates.io 团队</a>和 <a href="{ $baseurl }/governance/teams/core">Rust 核心团队</a> 的成员管理。</p>
    
    <dl>
      <dt>由 GitHub 登录：</dt>
      <dd><p>Crates.io 要求用户拥有 <a href="https://github.com">GitHub 帐号</a>以登录和使用该服务。当您使用 GitHub 帐号登录到 Crates.io 时，我们会接收到您的 GitHub 用户名和头像。如果您在 GitHub 帐号信息中还公开分享了显示名和电子邮件地址，我们也会接收到这些信息。</p></dd>
    
    <dt>电子邮件地址：</dt>
      <dd><p>您必须有一个已验证的电子邮件地址以发布 crate。我们会接收到与您 GitHub 帐号关联的任何公开的电子邮件地址。您也可以选择为您在 Crates.io 上的活动提交一个不同的地址。我们仅会在就与您账户有关的原因联系您时使用您的电子邮件地址。</p></dd>
    
      <dt>访客日志：</dt>
      <dd><p>当您访问 Crates.io 时，作为我们标准服务器日志的一部分，我们会接收到您的 IP 地址和用户代理报头。这些日志我们存储1年时间。</p></dd>
    
      <dt>上传到 crate 的信息：</dt>
      <dd>
        <p>Crates.io 上的所有 crate 皆是公开的，包括了 crate 所有者的用户名和 crate 的上传日期。任何人都可以查看或下载一个 crate 的内容。因为 Crates.io 开放的天性，任何包含在 Cargo.toml 文件中上传到 crate 的个人信息都将可以被公开访问。例如说，如果在 Cargo.toml 文件的 `author` 一栏有一个电子邮件地址，这个电子邮件地址将被公开。</p>
        <p>因为这一公开的天性，注意您在 crate 里包含的任何私人信息都可能被搜索引擎索引以及被第三方使用。不应该将敏感信息包含在 crate 文件中。</p>
      </dd>
    
      <dt>网站相关数据的发布：</dt>
      <dd><p>Crates.io 使用 Google Visualzation API 来显示每个 crate 过去90天的下载量图。这些图可以在每个 crate 页面的底部看到。</p></dd>
    </dl>
policies-privacy-page-docs-rs-desc =
    <p><a href="https://docs.rs">Docs.rs</a> 由 <a href="{ $baseurl }/governance/teams/dev-tools#rustdoc">Rustdoc 团队</a>和 <a href="{ $baseurl }/governance/teams/core">Rust 核心团队</a>的成员管理。该项目依据此隐私声明所描述的方式收集和使用数据。</p>
    
    <p>Docs.rs 是一个为 Rust 编程语言托管 crate 文档的开源项目。它自动使用 nightly 版本的 Rust 编译器为发布在 <a href="https://crates.io">crates.io</a> 上的 crate 构建文档。在 docs.rs 上所发布的所有 crate 信息也可以通过 crates.io 公开获得。</p>
policies-privacy-page-forums-title = 论坛
policies-privacy-page-forums-desc = <p><a href="{ $baseurl }/governance/teams/community">Rust 社区团队</a>管理<a href="https://users.rust-lang.org">用户论坛</a>和<a href="https://internals.rust-lang.org">内部论坛</a>。这些论坛的所有帖子都是公开的。如果您注册以参与这些论坛，我们会收集您的电子邮件地址和名字。作为论坛的管理员，我们可以访问如您发布和阅读的帖子以及在该网站上所花的时间等使用信息。</p>
policies-privacy-page-third-parties-title = 第三方服务
policies-privacy-page-third-parties-desc =
    <p>rust-lang.org 的用户论坛和内部论坛由 <a href="https://www.discourse.org/">Discourse</a> 托管，并使用它的开源讨论平台。Discourse 的隐私政策可以在<a href="https://www.discourse.org/privacy">这里</a>查看。</p>
    
    <p>我们使用 Mailgun 来发送电子邮件。Mailgun 的隐私政策可以在<a href="https://www.mailgun.com/privacy-policy">这里</a>查看。</p>
    
    <p>GitHub 登录被用于 Crates.io 和（可选地）论坛的授权。GitHub 的隐私声明可以在<a href="https://help.github.com/en/articles/github-privacy-statement">这里</a>找到。</p>
    
    <p>一些 Rust 团队成员使用 Zulip 和 Discord 平台进行社区协作。Zulip 的隐私声明可以在<a href="https://zulipchat.com/privacy/">这里</a>查看。Discord 的隐私声明可以在<a href="https://discordapp.com/privacy">这里</a>查看。</p>
policies-privacy-page-contact-title = 联系方式
policies-privacy-page-contact-desc =
    <p>对于关于数据访问的请求，或任何与此隐私声明相关的问题，请发送电子邮件到 <a href="mailto:privacy@rust-lang.org">privacy@rust-lang.org</a></p>
    
    <p>或者您也可以通过下面地址联系我们：</p>
    
    <address>
      Mozilla Corporation<br>
      Attn: Legal Notices - Privacy<br>
      331 E. Evelyn Ave,<br>
      Mountain View, CA 94041
    </address>

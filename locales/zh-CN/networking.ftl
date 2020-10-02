## templates/what/networking.hbs

what-networking-page-title = 网络

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust 拥有日益增长且易于使用的 Web 库生态系统。这里只介绍两个例子：
networking-get-started-post-json = 按 POST 请求发送 JSON
networking-get-started-take-json = 处理 POST 请求的 JSON
networking-get-started-reqwest = 了解更多关于 reqwest 的知识
networking-get-started-rocket = 了解更多关于 Rocket 的知识

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = 低资源占用
networking-pitch-footprint = 控制资源使用，将内存和 CPU 占用降到最低。编译器的帮助可确保您所做正确。同时，通过生产效率高、使用体验宜人的生态系统来实现这一点。
networking-pitch-footprint-alt = 一片羽毛
networking-pitch-secure-header = 安全可靠
networking-pitch-secure = Rust 强大的类型检查可以防止多种级别的 Bug。确保您在何时何地都可确切地知道状态是共享还是可变。在部署之前通过捕捉故障点来获得帮助。
networking-pitch-secure-alt = 一个盾牌
networking-pitch-concurrent-header = 大规模并发
networking-pitch-concurrent = 可以混合使用任何适合于您的并发方式。Rust 会确保您不会在线程或任务之间意外地共享状态。它能让您无所畏惧地压榨任意规模的性能。
networking-pitch-concurrent-alt = 连接起来的齿轮

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = 将推送连接基础服务迁移到 Rust ，使得我们获得了更易维护的代码库，在提供了出色性能的同时还关注正确性。现在，我们使用 Rust 的服务器可以在高峰时刻同时处理多达 2000 万个 websocket 连接。
networking-production-testimonial-mozilla-attribution = Benjamin Bangert，高级工程师，Mozilla
networking-production-testimonial-buoyant = Rust 是 Linkerd 项目技术路线图的基础。它的类型系统允许我们在不牺牲运行时性能的情况下构建模块化、可测试、可组合的单元。不过，最令人惊讶的是 Rust 的生命周期和借用检查系统使我们避免了大量的资源泄露。使用 Rust 两年后，我实在无法想象用其它语言如何才能完成此项工作。
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>

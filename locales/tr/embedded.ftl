### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Gömülü cihazlar

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Bir mikroskop
embedded-pitch-analysis-heading = Güçlü durağan analiz
embedded-pitch-analysis-description = Derleme zamanında pin ve çevresel eleman yapılandırmalarını uygulayın. Uygulamanızın sistem kaynaklarını istenmeyen bölümler tarafından kullanmayacağı garantidir.
embedded-pitch-memory-alt = Bir RAM çubuğu
embedded-pitch-memory-heading = Esnek bellek
embedded-pitch-memory-description = Dinamik bellek ayırıcı isteğe bağlıdır. Küresel bir ayırıcı ve dinamik veri yapıları kullanın. Veya yığını büsbütün bırakın ve her şeyi statik olarak paylaştırın.
embedded-pitch-concurrency-alt = Dişliler
embedded-pitch-concurrency-heading = Korkusuz eşzamanlılık
embedded-pitch-concurrency-description = Rust, yanlışlıkla iş parçacıkları arasında durum paylaşımını imkansız hâle getirir. İstediğiniz bir eşzamanlı yaklaşımı kullanın. Yine de Rust'ın güçlü kollarındasınız.
embedded-pitch-interop-alt = El sıkışma
embedded-pitch-interop-heading = Birlikte çalışabilirlik
embedded-pitch-interop-description = Var olan C kod tabanınıza Rust'ı entegre edin veya var olan YGK'ini güçlendirmek için bir Rust uygulaması yazın.
embedded-pitch-portability-alt = Bagaj arabası
embedded-pitch-portability-heading = Taşınabilirlik
embedded-pitch-portability-description = Bir kütüphane veya bir sürücüyü bir kere yazın ve en küçük mikrodenetleyiciden güçlü tek kartlı bilgisayarlara kadar çeşitli sistemlerde kullanın.
embedded-pitch-community-alt = Kalkan Logosu
embedded-pitch-community-heading = Topluluk tarafından yön verilen
embedded-pitch-community-description = Rust açık kaynak projesi kapsamında ticari işbirlikçilerden gelen destekle birlikte gömülü sistemlere olan destek, açık kaynak topluluğunun en iyisi tarafından sağlanıyor.
embedded-learn-more-link = Daha fazla bilgi edinin

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Gösterim
embedded-showcase-quote = "Rust'la karşılaştığımda çok heyecanlıydım. Rust, ´güvenli, hızlı, eşzamanlı &ndash; üçü birden´ sloganlı yeni bir programlama dili. Ayrıca kendinden emin bir özelliği var; güçlü, kendini adamış bir kullanıcı topluluğu."
embedded-showcase-quote-attribution = &ndash; Jonathan Pallant, Kıdemli Danışman, Cambridge Consultants
embedded-showcase-see-more-link = Daha fazlasını gör
embedded-showcase-video-description = <a href="https://vimeo.com">Vimeo</a> aracılığıyla <a href="https://vimeo.com/cambridgeconsultants">Cambridge Danışmanları</a> tarafından <a href="https://vimeo.com/224912526"> Rust ile geleceği güvenlik altına almak</a>.

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-alt = DIP-6 paketi
embedded-get-started-discovery-book-heading = Keşif kitabı
embedded-get-started-discovery-book-description = Gömülü geliştirme yapmayı&mdash;Rust kullanarak sıfırdan öğrenin!
embedded-get-started-embedded-rust-book-alt = QFP-20 paketi
embedded-get-started-embedded-rust-book-heading = Gömülü Rust Kitabı
embedded-get-started-embedded-rust-book-description = Zaten gömülü geliştirmeyle haşır neşir misiniz? Atlayın ve Rust'ın faydalarının tadını çıkarın.
embedded-get-started-embedonomicon-alt = BGA paketi
embedded-get-started-embedonomicon-heading = Gömülünomicon
embedded-get-started-embedonomicon-description = Kurumsal gömülü kütüphanelerine yakından bakın.
embedded-get-started-read-link = Oku
embedded-get-started-more-documentation-link = Daha fazla belgelendirme

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = Sensirion Logosu
embedded-testimonials-sensirion-quote = Yakın zamanda Sensiron'da, Rust'ı Sensiron'un <a href="https://sensirion-automotive.com/products#PM2_5">Partikül Madde Sensörü</a> için bir gömülü bir gösterici yapmak için kullandık. Farklı hedeflere derlenebilme özelliği ve crates.io'daki pek çok yüksek kalite cratelerin kullanıma açık olması <b>bize çabucak, güçlü bir gösterici yapmamıza olanak tanıdı.</b>
embedded-testimonials-sensirion-attribution = &ndash; Raphael Nestler, Yazılım Mühendisi, Sensirion
embedded-testimonials-airborne-alt = Airborne Engineering Ltd logosu
embedded-testimonials-airborne-quote = Airborne Engineering Ltd. olarak Rust'ı yakın zamanda gömülü bir ethernet bootloaderı olan şirket içi veri edinme sistemimiz <a href="https://github.com/airborneengineering/blethrs">blethrs</a>'i yazmak için kullandık. <b>Rust, umut vaat eden bir dil ve biz bu dili gelecekteki, gömülü ya da diğer, projelerimizde kullanacağımız için oldukça heyecanlıyız.
embedded-testimonials-airborne-attribution = &ndash; Dr. Adam Greig, Enstrümantasyon Mühendisi, Airborne Engineering Ltd.
embedded-testimonials-49nord-alt = 49nord logosu
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote = { "[" }Rust] hızlı dağıtım ve kodun doğruluğu konusunda bize yardımcı olmakla kalmayıp beklentilerimizi aştı. Rust sayesinde, bellek güvenliğinin kıymetini bilmez hale geleceğiz. Bunun yanı sıra sofistike bir veri tipi sistemi ile sıfır dil ek yükü sürdürülebilir yazılım geliştirmemizde bize yardımcı oldu. <b>Rust müşterilerimizi ve mühendislerimizi mutlu ediyor.</b>
embedded-testimonials-49nord-attribution = &ndash; Marc Brinkmann, CEO, 49nord
embedded-testimonials-terminal-tech-alt = Terminal Technologies logosu
embedded-testimonials-terminal-tech-quote = <b>"Gömülü" alanında genellikle C/C++ yerine geçebilecek bir şey yokken modern ve güzel bir dil kullanabilmenin harika olduğunu düşünüyoruz .</b>
embedded-testimonials-terminal-tech-attribution = &ndash; Aleksei Arbuzov, Kıdemli Yazılım Mühendisi, Terminal Technologies

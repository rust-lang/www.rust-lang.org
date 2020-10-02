## tools/index.hbs

tools-page-title = Araçlar
tools-editor-support-heading = Birinci sınıf metin düzenleyici desteği
tools-editor-support-description =
    İster komut satırından kod yazarak çalışmayı tercih edin
    ister zengin grafiksel düzenleyiciler kullanın ortada sizin düzenleyici
    seçiminize uygun Rust entegrasyonu vardır. Ya da kendi düzenleyicinizi
    <a href="https://github.com/rust-lang/rls">Rust Dil Sunucusu</a> kullanarak yapabilirsiniz.
tools-build-heading = Yapılarınıza sakinlik getirin
tools-build-description =
    Cargo, Rust için yapım aracıdır. Bütün ortak eylemleri
    bir tek komuta paketler. Şablon gerektirmez.
tools-build-install-heading = Yükle
tools-build-install-description =
    <a href="https://crates.io">Crates.io</a> içindeki binlerce paket ile birlikte çok büyük 
    ihtimalle aradığınız çözüme sahip. Devlerin omuzlarında durun ve ekibinizi tekerrürden
    yeniliğe taşıyın.
tools-build-test-heading = Test et
tools-build-test-description =
    Rust'ın mükemmel test etme araçlarını kullanarak kodunuza
    güven getirin. <code class="nowrap">cargo test</code> Rust'ın test etmek için birleşik çözümüdür.
    Kodunuzun yanına test yazın ya da ayrı dosyalarda test yazın, test etmek için bütün gerekli
    çözümleri sağlar.
tools-build-deploy-heading = Yayınla
tools-build-deploy-description =
    <code class="nowrap">cargo build</code> kodu her platform için
    ekstra bilgi taşımayan ikili kod oluşturur. Kodunuz tek bir komutla Windows'u,
    Linux'u, macOS'i ve webi hedef alabilir. Hepsi sipariş usulü yapı dosyalarına gerek 
    olmadan modern bir arayüzün parçası.
tools-automation-heading = Otomasyonla gelen hız
tools-automation-description =
    Rust'ın endüstri düzeyi araçları işbirliğini
    korkusuz yapar ve ekiplerin asıl konuya odaklanmasını sağlar.
tools-automation-rustfmt-heading = Rustfmt
tools-automation-rustfmt-description =
    Rustfmt, Rust kodunu otomatik olarak düzenler,
    okumasını, yazmasını ve sürdürmesini kolaylaştırır. Ve en önemlisi:
    bir daha asla boşluk veya parantezlerin pozisyonuyla ilgili tartışmayın.
tools-automation-rustfmt-link = Depoya git
tools-automation-clippy-heading = Clippy
tools-automation-clippy-description =
    <i>“Görünüşe bakılırsa bir yineleyici
    yazıyorsunuz.”</i> <br> Clippy her seviyedeki geliştiriciye deyimsel kod 
    yazmakta ve standartları uygulamakta yardımcı olur.
tools-automation-clippy-link = Depoya git
tools-automation-cargo-doc-heading = Cargo Belgeleri
tools-automation-cargo-doc-description =
    Cargo'nun belgelendirmecisi işinizi halleder. Bu da 
    hiçbir UPA'nın belgelendirmesiz ortaya çıkmamasını sağlar.
    <code class="nowrap">cargo doc</code> ile yerel olarak erişebilirsiniz ve
    <a href="https://docs.rs">docs.rs</a> ile herkese açık cratelere çevrimiçi ulaşabilirsiniz.
tools-automation-cargo-doc-link = Siteye git

## tools/install.hbs

tools-install-page-title = Rust'ı Yükle
install-using-rustup-heading = Rustup kullanmak (Önerilen)
install-rustup32-button = <span class="nowrap">rustup-init.exe</span> indir <span class="nowrap">(32-bit)</span>
install-rustup64-button = <span class="nowrap">rustup-init.exe</span> indir <span class="nowrap">(64-bit)</span>
install-notes-heading = Rust kurulumu hakkında notlar
install-notes-getting-started-description =
    Eğer Rust'a yeni başlıyorsanız ve daha 
    detaylı bir gidiş yolu arıyorsanız 
    <a href="{ $getting-started-href }">başlarken</a> sayfamıza göz atın.
install-notes-rustup-heading = <code>Rustup</code> ile araç zincirinin yönetimi
install-notes-rustup-description =
    <p>
      Rust, <a href="https://github.com/rust-lang/rustup.rs"><code>rustup</code></a> aracı ile yüklenir ve
      yönetilir. Rust'ın 6 haftalık <a href="https://github.com/rust-lang/rfcs/blob/master/text/0507-release-channels.md">
        hızlı yayımlama süreci
      </a> vardır ve 
      <a href="https://forge.rust-lang.org/release/platform-support.html">çok sayıda platformu</a> destekler. Bu yüzden her zaman Rust'ın birçok
      yapısı vardır. <code>rustup</code> Rust'ın desteklediği her platformda bu yapıları tutarlı bir şekilde
      yönetir. Bu durum, Rust'ın beta ve nightly yayın kanallarından yüklenmesine ve farklı hedeflere 
      derlenmesine katkıda bulunur.
    </p>
    <p>
      Eğer <code>rustup</code>'ı geçmişte yüklediyseniz, yüklediğiniz sürümü
      <code>rustup update</code> kodunu çalıştırarak güncelleyebilirsiniz.
    </p>
    <p>
      Daha fazla bilgi için
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md">
      <code>rustup</code> belgelendirmesine</a> bakabilirsiniz.
    </p>
install-notes-path-heading = <code>PATH</code> ortam değişkenini yapılandırma
install-notes-path-description =
    <p>Rust geliştirme ortamında bütün araçlar <span class="platform-specific not-win di"><code>~/.cargo/bin</code></span> <span class="platform-specific win dn"><code>%USERPROFILE%\.cargo\bin</code></span> dizinine yüklenir. Ve burası <code>rustc</code>, <code>cargo</code> ve <code>rustup</code> dahil olmak üzere Rust araç zincirini bulacağınız yerdir.</p>
    <p>Ayrıca, Rust geliştiricilerinin, bu dizini <a href="https://en.wikipedia.org/wiki/PATH_(variable)"> <code>PATH</code> ortam değişkenlerine</a> eklemeleri beklenmektedir. Yükleme sırasında <code>rustup</code>, <code>PATH</code>'i yapılandırmaya çalışacaktır. Platformlar arası farklar yüzünden, komut kabukları ve <code>rustup</code> bünyesindeki hatalar sebebiyle <code>PATH</code> değişkenine yapılan değişiklikler konsol yeniden başlatılana ya da kullanıcı çıkış yapana kadar etkin olmayabilir hatta başarı ile gerçekleşemeyebilir.</p>
    <p>Eğer yüklemeden sonra konsolunuzda <code>rustc --version</code> kodunu çalıştırmak hata veriyorsa muhtemelen sebep budur.</p>
install-notes-windows-heading = Windows düşünceleri
install-notes-windows-description =
    <p>
      Rust, Windows'ta ek olarak Visual Studio 2013 ve ilerisi için C++
      yapı araçlarına ihtiyaç duyar. Yapı araçlarını elde etmenin en kolay yolu
      sadece Visual C++ yapı araçlarını sağlayan <a href="https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2019">
      Microsoft Visual C++ Build Tools 2019</a>'u yüklemektir. Bir başka yol da
      Visual Studio 2019, Visual Studio 2017, Visual Studio 2015 ya da Visual
      Studio 2013 'ü yükleme esnasında "C++ araçları” seçeneğini işaretleyip
      <a href="https://www.visualstudio.com/downloads/">yüklemektir</a>.
    </p>
    <p>
      Rust'ı Windows'ta yapılandırmak hakkında daha fazla bilgiye
      <a href="https://github.com/rust-lang/rustup.rs/blob/master/README.md#working-with-rust-on-windows">
      Windows'a özgü <code>rustup</code> belgelendirmesi</a>nden ulaşabilirsiniz.
    </p>
install-other-methods-heading = Diğer kurulum yöntemleri
install-other-methods-description =
    Yukarıda açıklanan <code>rustup</code> tabanlı kurulum
    çoğu geliştiricinin Rust'u yüklemesi için tercih ettiği yoldur.
    Ancak, kurulum için başka yöntemler de kullanılabilir.
install-other-methods-link = Daha fazla bilgi edinin

## components/tools/rustup.hbs

tools-rustup-unixy = Görünüşe bakılırsa macOS, Linux veya Unix tabanlı bir işletim sistemi kullanıyorsunuz. Rustup'ı indirmek ve Rust'ı yüklemek için uçbiriminizde şunları çalıştırın ve daha sonra ekranınıza gelen talimatları izleyin.
tools-rustup-windows = Görünüşe bakılırsa Windows kullanıyorsunuz. Rust'ı yüklemek için şunu indirin ve çalıştırın. Ardından ekrandaki talimatları izleyin.
tools-rustup-wsl-heading = Windows için Linux Altsistemi
tools-rustup-wsl = Eğer Windows için Linux Altsistemi kullanıcısıysanız Rust'ı yüklemek için uçbiriminizde şunları çalıştırın ve ardından ekrandaki talimatları izleyin.
tools-rustup-unknown = Rust, Windows'ta, Linux'ta, macOS'ta, FreeBSD'de ve NetBSD'de çalışır. Eğer bu platformlardan birisini kullanıyorsanız ve bunu görüyorsanız lütfen aşağıdaki değerlerle birlikte sorunu bildirin.
tools-rustup-report = Bir sorun bildirin
tools-rustup-manual-unixy = Eğer Unix kullanıyorsanız Rust'ı yüklemek için <br>uçbiriminizde şunları çalıştırın. Ardından ekrandaki talimatları izleyin.
tools-rustup-manual-windows = Eğer Windows kullanıyorsanız <br><a href="https://win.rustup.rs">{ ENGLISH("rustup-init.exe") }</a>'yi indirin ve çalıştırın. Ardından ekrandaki talimatları izleyin.
tools-rustup-manual-default = Eğer WSL, Linux veya macOS gibi bir Unix işletim sistemi kullanıyorsanız Rust'ı yüklemek için <br> uçbiriminizde şunları çalıştırın. Ardından ekrandaki talimatları izleyin.
tools-rustup-manual-default-windows = Eğer Windows kullanıyorsanız <br><a href="https://win.rustup.rs">{ ENGLISH("rustup-init.exe") }</a>'yi indirin ve çalıştırın. Ardından ekrandaki talimatları izleyin.

## components/tools/editors.hbs

tools-editor-vscode = { ENGLISH("VS Code") }
tools-editor-sublime = { ENGLISH("Sublime Text 3") }
tools-editor-atom = { ENGLISH("Atom") }
tools-editor-idea = { ENGLISH("IntelliJ IDEA") }
tools-editor-eclipse = { ENGLISH("Eclipse") }
tools-editor-vim = { ENGLISH("Vim") }
tools-editor-emacs = { ENGLISH("Emacs") }
tools-editor-geany = { ENGLISH("Geany") }

### Translation file for https://www.rust-lang.org/what/wasm


## Web-Assembly (templates/what/wasm.hbs)

what-wasm-page-title = WebAssembly
what-wasm-page-heading = Web&shy;Assembly

## Why Rust? (templates/components/what/wasm/pitch.hbs)

wasm-why-rust-predictable-alt = Dişliler
wasm-why-rust-predictable-heading = Öngörülebilir Performans
wasm-why-rust-predictable-description = Ne öngörülemeyen çöp toplama duraklamaları ne de JIT derleyici performans uçurumları. Sadece yüksek seviye ergonomiyle birlikte düşük seviye kontrolün birleşimi.
wasm-why-rust-small-code-alt = Bir mikroskop
wasm-why-rust-small-code-heading = Küçük kod büyüklüğü
wasm-why-rust-small-code-description = Küçük kod boyutu demek hızlı sayfa yüklenmesi demektir. Rust ile oluşturulmuş <code>.wasm</code> çöp toplayıcısı gibi ek bir şey içermez. Gelişmiş optimizasyonlar ve ağaç sallama ile ölü kodları silin.
wasm-why-rust-amenities-alt = Bagaj
wasm-why-rust-amenities-heading = Modern kolaylıklar
wasm-why-rust-amenities-description = Hızlıca bir şeyler yapmanıza yardımcı olacak canlı bir kütüphane ekosistemi. Etkileyici, sıfır maliyetli soyutlamalar. Ve öğrenmenize yardımcı olacak misafirperver bir topluluk.

## Get started! (templates/components/what/wasm/get-started.hbs)

wasm-get-started-wasm-alt = WebAssembly Logosu
wasm-get-started-wasm-description = WebAssembly adıyla anılan hızlı, güvenli ve açık kaynaklı sanal makine hakkında daha fazla bilgi edinin ve standardını okuyun.
wasm-get-started-wasm-link = Daha fazla bilgi edinin
wasm-get-started-book-alt = wasm ferris
wasm-get-started-book-description = Rust kullanarak WebAssembly uygulamalarını nasıl yapacağınızı, nasıl hata ayıklayacağınızı, nasıl profilini çıkaracağınızı ve nasıl yayınlayacağınızı öğrenin!
wasm-get-started-book-link = Kitabı okuyun
wasm-get-started-mdn-alt = MDN logosu
wasm-get-started-mdn-description = Mozilla Geliştirici Ağı'nda WebAssembly hakkında daha fazla bilgi edinin
wasm-get-started-mdn-link = Buna bir bakın

## Plays well with JavaScript (templates/components/what/wasm/js.hbs)

wasm-js-heading = JavaScript ile birlikte iyi çalışır
wasm-js-augment-heading = Çoğalt… degiştirme
wasm-js-augment-description = WebAssembly'nin hayali, JavaScript'i öldürmek değil, onunla birlikte çalışmak, işlemlerin ağır veya düşük düzeydeki görevlerin üstesinden gelmeye yardımcı olmaktır &mdash; Rust’tan yararlanan görevler performansa odaklanır.
wasm-js-toolchains-heading = Bilinen alet zincirleriyle çalışır
wasm-js-toolchains-description = Rust WebAssembly paketlerini npm gibi paket kayıtlarında paylaşın. Paketleyin ve webpack, Parcel vb. kullanarak dağıtın. <code>npm audit</code> ve Greenkeeper gibi araçlarla devamlılığını sağlayın.
wasm-js-interop-heading = Kesintisiz birlikte çalışma
wasm-js-interop-description = Rust, WebAssembly ve JavaScript UPA'ları arasında otomatik olarak kodları bağlayın. <a href="https://rustwasm.github.io/wasm-bindgen/web-sys/index.html"><code>web-sys</code> gibi bütün web platformu için önceden paketlenmiş bağlantıları sağlayan kütüphanelerin avantajından yararlanın.

## Production use (templates/components/what/wasm/production.hbs)

wasm-production-cloudflare-alt = cloudflare logosu
wasm-production-cloudflare-quote = Rust'u WASM'a derleyebilir ve Internet'in dokusuna dokunmuş sunucusuz fonksiyonlardan çağırabiliriz. Bu çok büyük ve daha fazlasını yapmak için sabırsızlanıyorum.
wasm-production-cloudflare-attribution = Steven Pack, <a href="{ $href }">Cloudflare Çalışanları ile Sunucusuz Rust</a>
wasm-production-mozilla-alt = firefox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-mozilla-quote = JavaScript [<code> kaynak eşleme </code> kütüphanesi] uygulamamız performans elde etmek için karmaşık kod biriktirdi ve bunu deyimsel Rust ile değiştirdik. Rust, bizi çalışma zamanı ve çalışma zamanı performansı arasında seçim yapmaya zorlamadı.
wasm-production-mozilla-attribution = Nick Fitzgerald, <a href="{ $href }">Rust ve WebAssembly ile Kaynak Haritalarını Oksitlemek</a>
wasm-production-dropbox-alt = dropbox
# If an opening square bracket is the first character on a line, it must be escaped like this: {"["}. See https://projectfluent.org/fluent/guide/special.html
wasm-production-dropbox-quote = { "[" } Rust’in] özellikleri DivANS çözücüsünü yukarıda gösterildiği gibi WASM ile bir web sayfasına yerleştirmeyi kolaylaştırır.
wasm-production-dropbox-attribution = Daniel Reiter Horn and Jongmin Baek, <a href="{ $href }">DivANS ile Birlikte Daha İyi Sıkıştırma Yapmak</a>

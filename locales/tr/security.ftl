### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Güvenlik Politikası
security-reporting-heading = Raporlama
security-reporting-link = { ENGLISH("security@rust-lang.org") }'a E-Posta Gönder
security-reporting-description =
    <p>Emniyet, Rust'ın temel prensiplerinden biridir. Buradan yola çıkarak, dilin kendisinin de güvenli bir yapı olmasını sağlamalıyız. Sorumluluk sahibi bir şekilde, bulduğunuz sorunları paylaşmaya zaman ayırdığınız için teşekkür ederiz.</p>
    <p>Rust'ta bulunan bütün güvenlik hataları, e-posta ile { -security-at-rust-lang-org-anchor } adresine bildirilmelidir. Bu liste, küçük bir güvenlik ekibine iletilir. E-postalarınız 24 saat içerisinde değerlendirilecektir. Bununla birlikte 48 saat içerisinde bildirinize istinaden izlenecek olan adımların bulunduğu detaylı bir e-posta alacaksınız. Dilerseniz, bildirinizi <a href="{ -rust-security-team-key-href }">açık anahtarımızla</a> şifreleyebilirsiniz. Bu anahtar, aynı zamanda <a href="{ -rust-pgp-key-mit-keyserver-href }">MIT’nin anahtar sunucusunda</a> ve <a href="#key">aşağıda da üretilmektedir</a>.</p>
    <p>Bu e-posta adresi çok sayıda mesaj sağanağına tutulmaktadır. Bu nedenle açıklayıcı bir konu satırı ile bildirinizin gözden kaçmasına engel olabilirsiniz. Bildirinize gelen ilk yanıttan sonra, güvenlik ekibi sizi, bir düzeltme için kaydedilen ilerleme ve sonrasında yapılacak olan duyuru için bilgilendirmeye çalışacaktır. <a href="{ -wikipedia-rfpolicy-href }">RFPolicy</a>'de önerildiği gibi, bu bilgilendirmeler en az 5 günde bir yapılacaktır. Pratikte ise bu aralık 24-48 saat olabilir.</p>
    <p>Eğer e-postanıza 48 saat boyunca yanıt alamazsanız veya güvenlik ekibinden, önceki 5 günde hiçbir haber almadıysanız, sırasıyla izleyebileceğiniz birkaç adım var:</p>
    <ul>
     <li>Güvenlik koordinatörü ile doğrudan irtibata geçin ({ -security-coordinator-email-anchor } (<a href="{ -security-coordinator-public-key-href }">açık anahtar</a>)).</li>
     <li>Yedek irtibat ile doğrudan irtibata geçin ({ -backup-security-contact-email-anchor } (<a href="{ -backup-security-contact-public-key-href }">açık anahtar</a>)).</li>
     <li><a href="{ -internals-rust-lang-org-href }">İç forumda</a></li> gönderi paylaşın.</li>
    </ul>
    <p>Lütfen tartışma forumlarının halka açık alan olduğunu unutmayınız. Sorununuzu ilgili yerlere ulaştırmaya çalışırken sorununuz hakkında bilgi vermekten kaçının. Sadece güvenlik ekibinden birisine ulaşmaya çalıştığınızı söylemek yeterli olacaktır.</p>
security-disclosure-heading = Açıklama politikası
security-disclosure-description =
    <p>Rust projesi 5 aşamalı bir bildiri sistemine sahiptir.</p>
    <ol>
     <li>Güvenlik raporu alınmıştır ve ilgili kişiye atanmıştır. Bu kişi düzeltmeyi koordine edecek ve süreci yayınlayacaktır.</li>
     <li>Problem doğrulanmıştır ve tüm etkilenen sürümler saptanmıştır.</li>
     <li>Kod, benzer problemlerin olma olasılığı sebebiyle kontrol edilmiştir.</li>
     <li>Tüm sürümler, ki hepsi hala bakım sürecine dahildir, için bir düzeltme hazırlanır. Bu düzeltmeler halka açık depoya işlenmektense yerel tutulur ve duyuruyu bekler.</li>
     <li>Ambargo tarihinde, <a href="{ -rustlang-security-announcements-google-groups-forum-href }"> Rust güvenlik postası listesine</a> duyurunun bir kopyası gönderilir. Değişiklikler halka açık depoya ittirilir ve yeni yapılar rust-lang.org'da dağıtılır. E-posta listesindeki kişilerin bilgilendirmesini takip eden 6 saat içerisinde danışmanın bir kopyası Rust blogunda paylaşılacaktır.</li>
    </ol>
    <p>Bu işlem zaman alabilir, özellikle diğer projelere bakım yapan kişilerle işbirliği gerekliyse. Hatayı zamanında düzeltmek için mümkün olan en fazla çaba sarf edilecektir. Bunlara rağmen sürüm yayınlama sürecimizi takip etmek bilgilendirmenin tutarlı bir şekilde işlendiğinden emin olmamızı sağlayacaktır.</p>
security-receiving-heading = Güvenlik güncellemelerini alma
security-receiving-description =
    <p>Güvenlik duyurularını almanın en iyi yolu <a href="{ -rust-security-announcements-mailing-list-href }">Rust güvenlik duyuruları e-posta listesine</a> (ayrıca { -rustlang-security-announcements-subscribe-anchor } adresine e-posta göndererek de abone olabilirsiniz) abone olmaktır. Bu listenin trafiği çok azdır ve liste, ambargo kalktığı gibi halka açık bildirimleri alır.</p>
    <p>Güvenlik açıklarını ambargonun kaldırılmasından 72 saat önce { -distros-openwall-email-anchor } kanalıyla duyuracağız. Bu, Linux dağıtımlarının paketlerini güncellemesi için zaman tanıyacaktır.</p>
security-pgp-key-heading = Düz metin PGP anahtarı

### Translation file for page: https://www.rust-lang.org/policies/security
### templates/policies/security.hbs

policies-security-page-title = Güvenlik Politikası
security-reporting-heading = Raporlama
security-reporting-link = { ENGLISH("security@rust-lang.org") }'a E-Posta Gönder
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

Kapsam & Ekip

Mevcut bir ekrana mı geliştirme yapılacak, yeni bir menü üzerinde mi geliştirme yapılacak ayrımı yapılmalıdır.

Hangi ekipler projeye dahil belirtilmelidir.

Gelen tasarımların Design Guideline uygunluğu kontrol edilmelidir.

👥 Kullanıcı & Segment

Tüzel, gspara ve fenerparaya etkisi var mı sorgulanmalıdır. (Özellikle etki testi istenmesi için kritik, DOB gibi akışlarda tüzelle ortak götürülen işler oluyor.)

Segmente göre farklılık olacak mı sorgulanmalıdır. (ÜGS olan müşterilerde gösterilmeyen veya ek olarak gösterilen menüler var. Segmentlerde tasarım farklılığı olacak mı?)

📲 Erişim & Yönlendirme

Erişim noktaları analizi yapılmalıdır. (Kaç farklı yere eklenecek, panoya etkisi var mı?)

Farklı ekranlara yönlendirme ihtiyacı var mı sorgulanmalıdır. (Farklı akışlara yönlendirmede start transactionlar kontrol edilmelidir.)

Deep link gereksinimi var mı sorgulanmalıdır. (Trendyol, hepsipay gibi entegrasyon akışlarında önemlidir.)

SMS, PN tanım gereksinimi bulunuyor mu sorgulanmalıdır.

⏱️ Performans & Oturum

Login süresine etkisi sorgulanmalıdır. (Loginde ekstra servis çağırma ihtiyacı var mı, panoların yüklenme süresini uzatacak bir durum bulunuyor mu?)

Session timeoutları için istisna tanımlanması gerekiyor mu sorgulanmalıdır. (Timeoutlar için ek tanımlar yapılabilmektedir.)

⚙️ Menü & Konfigürasyon

Q etkileri sorgulanmalıdır. (Özellikle yeni menü ekleniyorsa/menü değiştiriliyorsa Q ekibine bildirilmesi gerekiyor. )

CMS üzerinde (içerik yönetimi, drop down vb.) nasıl bir ekleme yapılacak sorgulanmalıdır.

Görsel yükleme ihtiyacı var mı sorgulanmalıdır.

Yeni HPC tanımlanmalı mı sorgulanmalıdır.

🚦 Pilot & Versiyon

Pilot kontrolü yapılacak mı sorgulanmalıdır. Yapılacaksa hangi aşamada yapılacağı belirtilmelidir. (Pilotun ekran içerisinde mi yoksa menü üzerinden mi yapılacağının ayrımı?)

Eski client etkisi sorgulanmalıdır. (Pilot kontrolüne göre eski versiyonlar engellenecek mi?)

Force update ihtiyacı var mı sorgulanmalıdır. (Varsa menü özelinde mi, tüm versiyon üzerinde mi yapılmalı ayrımı)

Rollback planı belirtilmelidir. (Jira geçişlerinde karşımıza çıkıyor.)

🔧 Teknik & Servis

Alan mappingleri için mevcut servise ekleme veya yeni servis çağırma ihtiyacı var mı sorgulanmalıdır. (MCS mappingleri artık domain içinde yapılıyor.)

Generic component kullanılacak mı? Farklı kullanım yerlerinde etki testi ihtiyacı var mı sorgulanmalıdır.

Yeni component oluşturma ihtiyacı var mı sorgulanmalıdır.

Generic doküman yapısına etkisi bulunuyor mu sorgulanmalıdır.

📊 Loglama & Analitik

TrackMobileEvent, contact history veya EDW extra field alanlarına loglama ihtiyacı var mı sorgulanmalıdır.

SAS loglama ihtiyacı var mı sorgulanmalıdır.

Dataroid etkisi var mı sorgulanmalıdır.

Adjust etkisi var mı sorgulanmalıdır.

🔒 Güvenlik & Hukuk

Hukuk ekibinin yorumu gerekiyor mu? (Jira akışlarında ihtiyacımız olabiliyor.)

BDDK güvenlik tebliği için entegrasyon ihtiyacı var mı sorgulanmalıdır.

Pentest ihtiyacı var mı sorgulanmalıdır.

Seala etkisi var mı sorgulanmalıdır.

Encryption ve kart maskeleme ihtiyacı var mı sorgulanmalıdır.

🌍 Dil & Erişilebilirlik

İngilizce ve arapça menülere etkisi bulunuyor mu sorgulanmalıdır.

Erişilebilirlik etkisi var mı sorgulanmalıdır.

🧪 Test

Test otomasyon caseleri?

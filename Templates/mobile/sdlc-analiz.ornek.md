# 8503 Kanallardan Kullanılan Taksitli Kredilere Masrafların Eklenmesi Mobil
## İŞ ANALİZİ DOKÜMANI (ÜRÜN DOKÜMANTASYONU)

> NOT (mobile-00 için few-shot örnek): Bu dosya gerçek doldurulmuş bir SDLC analiz örneğidir.
> Agent stil/format/derinlik referansı olarak `Read` ile okur. Kullanıcıya verilmez.
> Çıktı her zaman `docs/mobile-sdlc-analiz.md`'ye yazılır.

---

## Değişiklik Tarihçesi

| Tarih | Sürüm | Değişikliği Yapan | Değişiklik |
|-------|-------|---------------------|------------|
| 29.09.2025 | v1 | Esin Yunus Bahçivanlar | Doküman oluşturuldu. |

---

## İçindekiler

1. Proje Genel Tanımı ve Amacı
2. Terimler ve Kısaltmalar
3. Müşteri Gereksinimleri
   3.1 Gereksinimler
   3.2 Genel Süreç Akışı
   3.3 Kapsama Alınmayan Müşteri Gereksinimleri
   3.4 Etki ve Risk Analizi
      3.4.1 Kanal (ADK) Etkisi
      3.4.2 Engelsiz Bankacılık Etkisi
      3.4.3 SAS Fraud Etkisi
      3.4.4 Chatbot Etkisi
      3.4.5 CMS (Content Management System) Etkisi
      3.4.6 TTS (OSDEM - SDY) ve DYS (FOMER) Etkisi
      3.4.7 MDYS (Müşteri Doküman Yönetim Sistemi) Tanımları
      3.4.8 Mevzuata Uyum
      3.4.9 Anomali Takibi
      3.4.10 Projenin Sungur Projesine Etkisi
4. Yazılımın Fonksiyonel Gereksinimleri
   4.1 Yazılım İşlevleri
      4.1.1 Fiyatlama Ekranı Yazılım İşlevi
      4.1.2 Onay Ekranı Yazılım İşlevi
      4.1.3 Kullandırım Ekranı Yazılım İşlevi
   4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan
   4.3 Log ve EDW Rapor gereksinimleri
      4.3.1 Ürün İşlem log, Müşteri log, ADK log, Kullanıcı log, Arcsight ve Teftiş log gereksinimleri
      4.3.2 EDW raporları
   4.4 Ürün ve Ürün İşlem Tanım Gereksinimleri
5. Yazılımın Fonksiyonel Olmayan Gereksinimleri
   5.1 Performans, Kapasite ve Erişilebilirlik
   5.2 Güvenlik ve Veri Gizliliği
   5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları)
   5.4 Erişim ve Kimlik Yönetimi
   5.5 İç Sistemler Görüşü

---

## 1. Proje Genel Tanımı ve Amacı

Bu proje bireysel mobil smart kredi başvuru ekranlarına masrafların eklenmesini kapsamaktadır. Kredi başvuru akışına yapılan entegrasyon aşağıda detaylandırılmıştır.

## 2. Terimler ve Kısaltmalar

Kısaltma bulunmamaktadır.

## 3. Müşteri Gereksinimleri

### 3.1 Gereksinimler

| Müşteri Gereksinimi | İlişkili Yazılım Gereksinimi |
|---------------------|--------------------------------|
| Smart fiyatlama ekranına masraflar dahil edilmesi için switch eklenmeli ve ekranda bilgilendirme yapılmalıdır. | 4.1.1 |
| Masraflar dahil ilerlendiğinde onay ekranında belirtilmelidir. | 4.1.2 |
| Limitsiz kullandırımın ilk ekranında masraflar dahil başvuru yapıldığına dair bilgilendirme yapılmalıdır. | 4.1.3 |

### 3.2 Genel Süreç Akışı

İhtiyaç kredisi başvurusu ekranına eklenen bir özellik olduğu için genel başvuru sürecine bir etkisi bulunmamaktadır.

> Doldurma notu: as-is workflow — mevcut ekrana bir düzenleme ise mevcut akış + değişiklik; yeni bir özellik ise kapsamdan workflow.

### 3.3 Kapsama Alınmayan Müşteri Gereksinimleri

Mikro kredi kapsam dışı bırakılmıştır.

> Doldurma notu: dökümanda varsa al; MCP bulgusu varsa kullanıcıya sun, yine de sor.

### 3.4 Etki ve Risk Analizi

Etki analizi 303350-3 Impact Analysis sayfasında bulunmaktadır.

#### 3.4.1 Kanal (ADK) Etkisi
QNB Bireysel mobil bankacılık etkisi bulunmaktadır. (Sadece tüzel sorulacak.)

#### 3.4.2 Engelsiz Bankacılık Etkisi
Internet veya Mobil uygulamalara etkisi yoktur. Engelsiz bankacılık etkisi bulunmamaktadır. (var / yok)

#### 3.4.3 SAS Fraud Etkisi
Etkisi vardır; mapping detayı developer dokümanında verilmiştir. (8277 - 7. SAS Akışı)

#### 3.4.4 Chatbot Etkisi
Chatbot etkisi bulunmamaktadır. (var / yok)

#### 3.4.5 CMS (Content Management System) Etkisi
CMS etkisi bulunmaktadır. Metinler CMS üzerinden gösterilmektedir.

| Key | tr-TR | en-US | ar-SA |
|-----|-------|-------|-------|
| LoanUsageDetailsIncludeExpensesLoanAmount | Masraflar Dahil Kredi Tutarı | [ÇEVİRİ GEREKLİ] | [ÇEVİRİ GEREKLİ] |
| LoanExpensesExpensesPopupTitle | Kredi masrafları nelerdir? | [ÇEVİRİ GEREKLİ] | [ÇEVİRİ GEREKLİ] |
| LoanExpensesExpensesPopupDescription | Kredi masrafları, kredi tahsis ücreti ve varsa sigorta prim tutarının toplamıdır. | [ÇEVİRİ GEREKLİ] | [ÇEVİRİ GEREKLİ] |
| LoanExpensesDescription | Talep ettiğiniz tutar hesabınıza kesintiye uğramadan yatar, kredi masrafları bu tutarın üzerine eklenir. | [ÇEVİRİ GEREKLİ] | [ÇEVİRİ GEREKLİ] |

#### 3.4.6 TTS (OSDEM - SDY) ve DYS (FOMER) Etkisi
TTS-DYS etkisi bulunmamaktadır.

#### 3.4.7 MDYS (Müşteri Doküman Yönetim Sistemi) Tanımları
MDYS etkisi bulunmamaktadır.

#### 3.4.8 Mevzuata Uyum
Banka Proje sorumlusu tarafından mevzuat uyum durumu Yasal Uyum biriminden sorgulanmış olup, iş isteği kapsamında mevzuata uyulması için yapılması gereken bir geliştirme bulunmadığı iletilmiştir.

#### 3.4.9 Anomali Takibi
Anomali takibi ihtiyacı bulunmamaktadır.

#### 3.4.10 Projenin Sungur Projesine Etkisi
Sungur programına etkisi bulunmamaktadır.

## 4. Yazılımın Fonksiyonel Gereksinimleri

### 4.1 Yazılım İşlevleri

#### 4.1.1 Fiyatlama Ekranı Yazılım İşlevi

Masraf projesi, müşterinin talep ettiği tutarın direkt hesabına geçebilmesi için kredi tahsis ücreti ve sigorta prim tutarı ile birlikte kredi kullanılmasını amaçlar. Örneğin müşteri 40.000 TL talep ettiğinde masraflar 1.000 TL ise, masraflar dahil kullanımda 41.000 TL kredi kullanılır ve hesabına 40.000 TL geçer. Smart kredi başvuru akışında mikro kredi limiti kapsam dışıdır; ilk kredi, limitli ve limitsiz akışlar kapsamdadır.

Fiyatlama ekranı açılırken masraf switch'inin gösterimi kontrol edilir; uygun değilse masraf alanı gösterilmez, uygunsa taksit sayısı componentinin altına "Tutar Hesabıma Net Geçsin" başlıklı switch eklenir ve açık gelir. Switch altında bilgilendirme metni bulunur; "kredi masrafları" ifadesi link olup tıklanınca action sheet açılır.

(Validasyonlar, yasal vade uyarı kontrolleri, alan değişiklikleri detayları dökümanda tam olarak yer alır.)

**Karar Matrisi:**

| Analiz Edilecek Başlıklar | Evet/Hayır | Index | Başlık Adı |
|----------------------------|------------|-------|------------|
| Yeni ekran tasarımı veya mevcut ekranda değişiklik var mı? | Evet | 4.1.1 | Fiyatlama Ekranı Yazılım İşlevi |
| Yeni batch veya mevcut batchlerde değişiklik var mı? | Hayır | | |
| Yeni bir çıktı/rapor veya değişiklik var mı? | Hayır | | |
| Yeni menü tanımlanacak mı? | Hayır | | |
| Yeni bir servis tanımı olacak mı? | Hayır | | |
| Erişim noktaları analiz edilecek mi? | Hayır | | |
| SMS/PN Bilgilendirme tanımı olacak mı? | Hayır | | |
| E-mail bilgilendirme tanımı olacak mı? | Hayır | | |
| Memo ve ekstre tanımı olacak mı? | Hayır | | |
| Uyarı ve hata mesajı tanımı olacak mı? | Evet | 4.1.1 | Fiyatlama Ekranı Yazılım İşlevi |
| Yapılacak değişikliğin Etki analizi var mı? (POTA / 3.4) | Evet | 4.1.1 | Fiyatlama Ekranı Yazılım İşlevi |

##### 4.1.1 Ekran Tasarımı
image-2025-5-11_23-6-22.png

#### 4.1.2 Onay Ekranı Yazılım İşlevi

Limitli/limitsiz akış asıl başvuru ve kullandırım onay ekranlarında masraf switch'i dahilse "Masraflar Dahil Kredi Tutarı" en üstte, "Hesabıma Aktarılacak Tutar" kredi tahsis ücretinin altında gösterilir. Switch dahil değilse as-is devam eder. Sigorta doküman hatasında hesaba aktarılacak tutar ilgili servis alanından beslenir.

**Karar Matrisi:** (Ekran = Evet → 4.1.2; diğerleri Hayır.)

##### 4.1.2 Ekran Tasarımı
image-2025-5-11_23-26-59.png

#### 4.1.3 Kullandırım Ekranı Yazılım İşlevi

Asıl başvuru masraf switch'i dahil yapıldıysa kullandırım ilk ekranda "Masraflar Dahil Kredi Tutarı" (en üstte) ve "Hesabıma Aktarılacak Tutar" (en altta) gösterilir. Switch dahil değilse as-is devam eder. Sigortalı + masraf switch'i açık başvuruda ilk taksit tarihi değişimi ve sigorta verilebilirlik durumuna göre bilgilendirme mesajları gösterilir.

**Karar Matrisi:** (Ekran = Evet → 4.1.3; diğerleri Hayır.)

##### 4.1.3 Ekran Tasarımı
image-2025-9-25_15-29-31.png

### 4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan

Etkisi yoktur.

### 4.3 Log ve EDW Rapor gereksinimleri

#### 4.3.1 Ürün İşlem log, Müşteri log, ADK log, Kullanıcı log, Arcsight ve Teftiş log gereksinimleri

EDW Extra Field Loglamaları: 8277 - 8. EDW Extra Field Loglamaları
Contact History Loglamaları: 8668 - Mobil Loglama (Excel ile iletilir; maks 8 alan; EDW bu alanlardan rapor üretir.)

#### 4.3.2 EDW raporları

Yapılan loglamalarla EDW ekibi rapor oluşturabildiğinden EDW raporlama ihtiyacı bulunmaktadır. (Analiste teyit ettirilir.)

### 4.4 Ürün ve Ürün İşlem Tanım Gereksinimleri

Ürün ve ürün işlem etkisi bulunmamaktadır.

## 5. Yazılımın Fonksiyonel Olmayan Gereksinimleri

### 5.1 Performans, Kapasite ve Erişilebilirlik
Performans, kapasite ve erişilebilirlik etkisi bulunmamaktadır.

### 5.2 Güvenlik ve Veri Gizliliği
Güvenlik ihtiyacı Ibtech-Information Security Management Ekibi tarafından yazılım projeleri için Jira, altyapı projeleri için KYS'de kayıt altına alınır.

### 5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları)
Güvenilirlik ve yedeklilik etkisi bulunmamaktadır.

### 5.4 Erişim ve Kimlik Yönetimi
Erişim ve kimlik yönetimi için mevcut kurallar geçerli olacaktır.

### 5.5 İç Sistemler (Teftiş Kurulu, Hukuk, Yasal Uyum ve İç Kontrol, Risk Yönetimi, IBT PQRM) Görüşü

İç sistem görüşü aşağıda paylaşılmıştır.

| Görüş Alınan Tarih | Görüş Alınan Kişi | Görüş Detayı |
|---------------------|---------------------|---------------|
| 08.04.2025 | Ilgın Oder Sel | ... |

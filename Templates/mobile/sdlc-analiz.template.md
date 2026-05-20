# {{PROJE_KODU}} {{PROJE_ADI}}
## İŞ ANALİZİ DOKÜMANI (ÜRÜN DOKÜMANTASYONU)

> Bu doküman QNB Mobile SDLC İş Analizi şablonudur. mobile-00-sdlc-analyse agentı tarafından,
> `Agent/mobile/mobile-00-sdlc-analyse.md` içindeki "BÖLÜM BAZLI DOLDURMA KURALLARI" uygulanarak doldurulur.
> Çıktı dosyası kullanıcıya verilen `docs/mobile-sdlc-analiz.md` olur — bu template dosyası kullanıcıya verilmez.
> Few-shot örnek: `maintemplate.md` (kök) veya `Templates/mobile/sdlc-analiz.ornek.md`.

---

## Değişiklik Tarihçesi

| Tarih | Sürüm | Değişikliği Yapan | Değişiklik |
|-------|-------|---------------------|------------|
| {{TARIH}} | v1 | {{HAZIRLAYAN}} | Doküman oluşturuldu. |

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
      3.4.6 TTS (OSDEM-SDY) ve DYS (FOMER) Etkisi
      3.4.7 MDYS Tanımları
      3.4.8 Mevzuata Uyum
      3.4.9 Anomali Takibi
      3.4.10 {{PROJE_SPESIFIK_ETKI — örn. Sungur Projesine Etki}}
4. Yazılımın Fonksiyonel Gereksinimleri
   4.1 Yazılım İşlevleri (4.1.1, 4.1.2, ... her ekran/işlev)
   4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan
   4.3 Log ve EDW Rapor Gereksinimleri
      4.3.1 Ürün İşlem / Müşteri / ADK / Kullanıcı / Arcsight / Teftiş log + EDW Extra Field + Contact History
      4.3.2 EDW Raporları
   4.4 Ürün ve Ürün İşlem Tanım Gereksinimleri
5. Yazılımın Fonksiyonel Olmayan Gereksinimleri
   5.1 Performans, Kapasite ve Erişilebilirlik
   5.2 Güvenlik ve Veri Gizliliği
   5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları)
   5.4 Erişim ve Kimlik Yönetimi
   5.5 İç Sistemler (Teftiş Kurulu, Hukuk, Yasal Uyum ve İç Kontrol, Risk Yönetimi, IBT PQRM) Görüşü

---

## 1. Proje Genel Tanımı ve Amacı

> **Doldurma kuralı (agent [A0] + Bölüm 1):** Confluence + kapsam dökümanı + Figma'dan profesyonel analist diliyle, analiz kapsamıyla zenginleştirilerek otomatik doldurulur. Geliştirme tipi (mevcut ek iş / sıfırdan yeni) belirtilir. Kesinlikle dolu; uydurma YASAK; eksikse `[BELIRSIZ — kaynakta yok]`.

{{PROJE_TANIM_VE_AMAC_VE_KAPSAM}}

---

## 2. Terimler ve Kısaltmalar

> **Doldurma kuralı (Bölüm 2):** Dökümanda geçen teknik kelimeler / kısaltmalar otomatik çıkarılır. Yoksa: "Kısaltma bulunmamaktadır."

| Kısaltma / Terim | Açıklama |
|-------------------|----------|
| {{TERIM}} | {{ACIKLAMA}} |

---

## 3. Müşteri Gereksinimleri

### 3.1 Gereksinimler

> **Doldurma kuralı (Bölüm 3.1):** MG'ler kapsam + Confluence'tan; eşlenen 4.1.x işlevleri semantic-search + Figma'dan. Uydurma YASAK.

| Müşteri Gereksinimi | İlişkili Yazılım Gereksinimi |
|---------------------|--------------------------------|
| {{MUSTERI_GEREKSINIMI}} | {{4.1.x}} |

### 3.2 Genel Süreç Akışı

> **Doldurma kuralı (Bölüm 3.2):** Her zaman Mermaid. Mevcut ekrana ekleme ise AS-IS + TO-BE (yeni node'lar `classDef` ile renkli). Codebase'de yoksa dökümandan. "Mevcut ekrana mı / bağımsız yeni akış mı?" sorulur.

```mermaid
flowchart TD
{{AKIS_DIYAGRAMI}}
classDef yeni fill:#cce5ff,stroke:#004085,color:#000;
```

### 3.3 Kapsama Alınmayan Müşteri Gereksinimleri

> **Doldurma kuralı (Bölüm 3.3):** Dökümanda varsa al; MCP bulgusunu kullanıcıya aday sun ve sor. Yoksa: "Kapsama alınmayan gereksinim bulunmamaktadır."

| Konu | Gerekçe | Sonrasında Alınacak Aksiyon |
|------|---------|------------------------------|
| {{KONU}} | {{GEREKCE}} | {{AKSIYON}} |

### 3.4 Etki ve Risk Analizi

> Etki analizi POTA Impact Analysis sayfasında bulunur: {{POTA_LINK}}

#### 3.4.1 Kanal (ADK) Etkisi
> **Sor:** Mobil varsayılan var; sadece tüzel etkisi sorulur. Diğer kanallar dökümanda/MCP'de varsa eklenir.

{{KANAL_ETKISI}}

#### 3.4.2 Engelsiz Bankacılık Etkisi
> **Sor (var/yok):** Yok ise "Internet veya Mobil uygulamalara etkisi yoktur." Var ise HPC + Sözleşme tablosu.

{{ENGELSIZ_BANKACILIK}}

#### 3.4.3 SAS Fraud Etkisi
> **Sor (var/yok):** Var ise "etkisi vardır, mapping detayı developer dokümanında." Yok ise "SAS Fraud etkisi yoktur."

{{SAS_FRAUD}}

#### 3.4.4 Chatbot Etkisi
> **Sor (var/yok):** Her durumda OZL DB ChatBot Apps Ba ekibine analiz onayı sonrası bilgi verilir.

{{CHATBOT}}

#### 3.4.5 CMS (Content Management System) Etkisi
> **Özel (Bölüm 3.4.5):** Figma + kapsamdan resource/CMS key üret; 3 dilli tablo. VpStringResource'ta kontrol et. Sadece Türkçe varsa en/ar için `[ÇEVİRİ GEREKLİ]`. Yoksa "CMS etkisi bulunmamaktadır."

| Key | tr-TR | en-US | ar-SA |
|-----|-------|-------|-------|
| {{KEY}} | {{TR}} | {{EN}} | {{AR}} |

#### 3.4.6 TTS (OSDEM-SDY) ve DYS (FOMER) Etkisi
> **Default:** "TTS-DYS etkisi bulunmamaktadır."

TTS-DYS etkisi bulunmamaktadır.

#### 3.4.7 MDYS (Müşteri Doküman Yönetim Sistemi) Tanımları
> **Default:** "MDYS etkisi bulunmamaktadır."

MDYS etkisi bulunmamaktadır.

#### 3.4.8 Mevzuata Uyum
> **Default:** Standart Yasal Uyum cümlesi.

Banka Proje sorumlusu {{AD}} tarafından mevzuat uyum durumu Yasal Uyum biriminden sorgulanmış olup, iş isteği kapsamında mevzuata uyulması için yapılması gereken bir geliştirme bulunmadığı iletilmiştir.

#### 3.4.9 Anomali Takibi
> **Default:** "Anomali takibi ihtiyacı bulunmamaktadır."

Anomali takibi ihtiyacı bulunmamaktadır.

#### 3.4.10 {{PROJE_SPESIFIK_ETKI}}
> **Default (proje-spesifik):** örn. "Sungur programına etkisi bulunmamaktadır."

{{PROJE_SPESIFIK_ETKI_CUMLESI}}

---

## 4. Yazılımın Fonksiyonel Gereksinimleri

### 4.1 Yazılım İşlevleri

> **Doldurma kuralı (Bölüm 4.1):** Kapsam + Figma + semantic-search ile işlevler/ekranlar tespit edilir, her ekran tek tek detaylı anlatılır. Karar matrisi doldurulur. 13 derinleştirme sorusu (segment/ÜGS, erişim noktaları, SMS/PN, HPC, pilot, eski client, force update, TrackMobileEvent/contact history/EDW, SAS, Dataroid, Adjust, kart maskeleme, İngilizce/Arapça) sorulur.

#### 4.1.{{N}} {{Ekran/İşlev Adı}} Yazılım İşlevi

{{EKRAN_AKIS_DETAYI — alanlar, servisler, validasyonlar, koşullu davranışlar}}

**Karar Matrisi:**

| Analiz Edilecek Başlıklar | Evet/Hayır | Index | Başlık Adı |
|----------------------------|------------|-------|------------|
| Yeni ekran tasarımı veya mevcut ekranda değişiklik var mı? | {{E/H}} | 4.1.{{N}} | {{İşlev Adı}} |
| Yeni batch veya mevcut batchlerde değişiklik var mı? | Hayır | | |
| Yeni bir çıktı/rapor veya değişiklik var mı? | {{E/H}} | | |
| Yeni menü tanımlanacak mı? | {{E/H}} | | |
| Yeni bir servis tanımı olacak mı? | {{E/H}} | | |
| Erişim noktaları analiz edilecek mi? | {{E/H}} | | |
| SMS/PN Bilgilendirme tanımı olacak mı? | {{E/H}} | | |
| E-mail bilgilendirme tanımı olacak mı? | {{E/H}} | | |
| Memo ve ekstre tanımı olacak mı? | {{E/H}} | | |
| Uyarı ve hata mesajı tanımı olacak mı? | {{E/H}} | | |
| Yapılacak değişikliğin Etki analizi var mı? (POTA / 3.4) | {{E/H}} | | |

##### 4.1.{{N}} Ekran Tasarımı
{{FIGMA_REFERANSI / EKRAN_GORSEL}}

> "Evet" olan her karar matrisi başlığı burada detaylandırılır; "Hayır" olanlar yazılmaz veya standart cümleyle geçilir.

### 4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan
> **Default:** "Muhasebe, Dekont, Alındılar ve Sistem Mizan etkisi yoktur."

Etkisi yoktur.

### 4.3 Log ve EDW Rapor Gereksinimleri

> **Doldurma kuralı (Bölüm 4.3):** Kullanıcıya sorulur (EDW Extra Field / Contact History / Ürün İşlem-ADK-Teftiş log / SAS / EDW raporu).

#### 4.3.1 Ürün İşlem log, Müşteri log, ADK log, Kullanıcı log, Arcsight ve Teftiş log gereksinimleri
{{LOGLAMA_DETAYI — yoksa "Mobil loglama ihtiyacı yoktur."}}

#### 4.3.2 EDW Raporları
{{EDW_RAPOR — yoksa "EDW raporlama ihtiyacı yoktur."}}

### 4.4 Ürün ve Ürün İşlem Tanım Gereksinimleri
> **Default:** "Ürün ve ürün işlem etkisi bulunmamaktadır."

Ürün ve ürün işlem etkisi bulunmamaktadır.

---

## 5. Yazılımın Fonksiyonel Olmayan Gereksinimleri

### 5.1 Performans, Kapasite ve Erişilebilirlik
> **Default**

Performans, kapasite ve erişilebilirlik etkisi bulunmamaktadır.

### 5.2 Güvenlik ve Veri Gizliliği
> **Default**

Güvenlik ihtiyacı Ibtech-Information Security Management Ekibi tarafından yazılım projeleri için Jira, altyapı projeleri için KYS'de kayıt altına alınır.

### 5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları)
> **Default**

Güvenilirlik ve yedeklilik etkisi bulunmamaktadır.

### 5.4 Erişim ve Kimlik Yönetimi
> **Default**

Erişim ve kimlik yönetimi için mevcut kurallar geçerli olacaktır.

### 5.5 İç Sistemler (Teftiş Kurulu, Hukuk, Yasal Uyum ve İç Kontrol, Risk Yönetimi, IBT PQRM) Görüşü
> **Default + (varsa) görüş tablosu**

İç sistem görüşü aşağıda paylaşılmıştır.

| Görüş Alınan Tarih | Görüş Alınan Kişi | Görüş Detayı |
|---------------------|---------------------|---------------|
| {{TARIH}} | {{KISI}} | {{DETAY}} |

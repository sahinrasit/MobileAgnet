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

> İçindekiler hem ana başlıkları hem de tüm alt başlıkları (3.4.x, 4.1.x, 4.3.x, 5.x) içerir. 4.1 altındaki dinamik işlev başlıkları (4.1.1, 4.1.2, ...) doldurulurken her biri buraya eklenir.

1. Proje Genel Tanımı ve Amacı
2. Terimler ve Kısaltmalar
3. Müşteri Gereksinimleri
   - 3.1 Gereksinimler
   - 3.2 Genel Süreç Akışı
   - 3.3 Kapsama Alınmayan Müşteri Gereksinimleri
   - 3.4 Etki ve Risk Analizi
      - 3.4.1 Kanal (ADK) Etkisi
      - 3.4.2 Engelsiz Bankacılık Etkisi
      - 3.4.3 SAS Fraud Etkisi
      - 3.4.4 Chatbot Etkisi
      - 3.4.5 CMS (Content Management System) Etkisi
      - 3.4.6 TTS (OSDEM-SDY) ve DYS (FOMER) Etkisi
      - 3.4.7 MDYS Tanımları
      - 3.4.8 Mevzuata Uyum
      - 3.4.9 Anomali Takibi
      - 3.4.10 {{PROJE_SPESIFIK_ETKI — örn. Sungur Projesine Etki}}
4. Yazılımın Fonksiyonel Gereksinimleri
   - 4.1 Yazılım İşlevleri
     - 4.1.1 {{İŞLEV_1_ADI}}
     - 4.1.2 {{İŞLEV_2_ADI}}
     - ... (dinamik — her özellik için ayrı satır)
     - 4.1 Özet Karar Matrisi
   - 4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan
   - 4.3 Log ve EDW Rapor Gereksinimleri
      - 4.3.1 Ürün İşlem / Müşteri / ADK / Kullanıcı / Arcsight / Teftiş log + EDW Extra Field + Contact History
      - 4.3.2 EDW Raporları
   - 4.4 Ürün ve Ürün İşlem Tanım Gereksinimleri
5. Yazılımın Fonksiyonel Olmayan Gereksinimleri
   - 5.1 Performans, Kapasite ve Erişilebilirlik
   - 5.2 Güvenlik ve Veri Gizliliği
   - 5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları)
   - 5.4 Erişim ve Kimlik Yönetimi
   - 5.5 İç Sistemler (Teftiş Kurulu, Hukuk, Yasal Uyum ve İç Kontrol, Risk Yönetimi, IBT PQRM) Görüşü

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
> **Sor:** Mobil varsayılan var; sadece tüzel etkisi sorulur. Diğer kanallar dökümanda/MCP'de varsa eklenir. Tablo formatı zorunlu.

| Kanal | Etki Durumu | Not |
|-------|-------------|-----|
| QNB Mobil — Bireysel | {{Var/Yok}} | {{detay}} |
| QNB Mobil — Tüzel | {{Var/Yok}} | {{detay}} |
| QNB İnternet Bankacılığı (IB) | {{Var/Yok}} | {{detay}} |
| Enpara | {{Var/Yok}} | {{detay}} |
| Çağrı Merkezi (CC) | {{Var/Yok}} | {{detay}} |
| ATM | {{Var/Yok}} | {{detay}} |
| Web Şubesi | {{Var/Yok}} | {{detay}} |

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

> **Doldurma kuralı (Bölüm 4.1):** Kapsam + Figma + semantic-search ile işlevler/ekranlar tespit edilir, her ekran agent dosyasındaki **"4.1.X İşlev Yazım Şablonu (ZORUNLU İskelet)"** ile detaylı anlatılır (bağlam → ekran konumu → yeni davranışlar bullet → durum bazlı kurallar → metinler ve gösterim tipi → hata/sınır/eski client). Karar matrisi **özet-merkezli** yaklaşımla yazılır ([A9.1.1]): işlev altında yalnızca "Evet" satırlar; tam matris doküman sonunda tek özet olarak. 13 derinleştirme sorusu sorulur.

#### 4.1.{{N}} {{Ekran/İşlev Adı}} Yazılım İşlevi

> Aşağıdaki 8 bölüm sırasıyla doldurulur ([A12]+[A13]+[A14]+[A15]+[A16]+[A17] disiplinine göre). Sıra değiştirilemez.

**1. Bağlam:** {{İşlev hangi iş ihtiyacını karşılıyor; mevcut akışla nasıl ilişkili; mevcut ek mi yeni mi}}

**2. Ekran konumu ve giriş noktası:**
- Yerleşim tipi: {{Yeni sekme / Mevcut sekme içine bölüm / Hibrit}}
- Konum referansı: {{Hangi mevcut elemanın altında/üstünde/yanında}}
- Görünürlük koşulu: {{Her zaman / koşullu — koşulu açıkça yaz}}
- Figma frame: {{Frame adı + node-id}} veya `[GÖRSEL: {{frame adı}} — Figma'dan eklenecek]`

**3. Yeni davranışlar:**
- {{Bullet 1 — tek bir yetenek; konumu, davranışı, tetiklenme koşulu}}
- {{Bullet 2}}
- ...

**4. Durum bazlı kurallar (görünürlük/koşul) ve sıralı akışlar (aksiyon zinciri):**
- **{{Durum A}} ise:** {{davranış}}
- **{{Durum A değil ise (else)}}:** {{davranış}}
- **{{Edge case — örn. tüm kayıtlar silindi}}:** {{davranış}}
- Aksiyon zinciri varsa (örn. popup butonları): 1. {{adım}} 2. {{adım}} 3. {{adım}}

**5. Form validasyonu — varsa ([A16]):**

| Alan | Zorunluluk | Format / Tip | Uzunluk / Aralık | İş Kuralı | Hata Metni | Hata Gösterim Tipi |
|------|------------|--------------|------------------|-----------|------------|---------------------|
| {{Alan}} | {{Zorunlu/Opsiyonel}} | {{Sayı/Metin/Tarih/Seçim}} | {{Min-Maks}} | {{Kural}} | {{Tam Türkçe metin}} | {{Inline/Popup/Toast}} |

Çapraz alan validasyonları:
- {{Kural — örn. "Alış ve satış aynı seçilemez."}}

Form yoksa: "Bu işlevde alan-bazlı validasyon bulunmamaktadır."

**6. Gösterilen metinler ve gösterim tipi:**

| Metin (tam Türkçe) | Gösterim Tipi | Tetiklenme Koşulu | Buton/Aksiyon |
|---------------------|---------------|-------------------|----------------|
| {{Metin}} | {{Popup/Toast/Banner/Inline/Bottom sheet}} | {{Koşul}} | {{Buton + aksiyon}} |

> Resource key bu tablo içine YAZILMAZ — yalnızca 3.4.5 CMS tablosunda yer alır.

**7. Hata, sınır, eski client + servis sözleşmesi:**
- **Servis hatası:** {{Hangi ekran/popup, hangi metin}}
- **Boş yanıt:** {{Boş durum metni + CTA}}
- **Timeout:** {{Tekrar dene davranışı}}
- **Maks sınır:** {{Üst sınır + aşıldığında davranış}}
- **Eski client davranışı:** "Eski client'larda yeni {{X}} gösterilmez; mevcut akış değişmeden devam eder."
- **Yeni servis = Evet ise:** [A17.1] Servis Sözleşmesi Bloğu (TransactionName / Request / Response / HPC / handler / mevcut servis aramaları).
- **Mevcut servis genişletiliyorsa:** [A17.2] Reuse Bloğu.

**8. Sonraki adım / İlişkili işlevler:**
- Başarılı tamamlama → {{4.1.Y İşlev Adı}}
- Hata yolunda → {{4.1.Z / aynı ekran}}
- Detay/listeleme referansı → {{4.1.W'de detaylandırılmıştır}}
- Geri tuşu → {{4.1.V}}
- Hedef ekran(lar) yeni mi mevcut mu: {{ne olduğu net yazılır — [A15.3]}}

**4.1.{{N}} Karar Matrisi (Yalnızca Evet Satırları):**

| Başlık | Durum | Not |
|--------|-------|-----|
| {{Evet işaretlenen başlık}} | Evet | {{kısa not}} |

> Tam 11 satırlı karar değerlendirmesi doküman sonundaki **4.1 Özet Karar Matrisi**'nde yer alır. "Hayır" satırlar burada tekrar yazılmaz.

##### 4.1.{{N}} Ekran Tasarımı

| Figma Frame Adı | node-id | Görsel Dosya |
|------------------|---------|---------------|
| {{Frame adı}} | {{node-id}} | `image-{{ekran}}-{{tarih}}.png` veya `[GÖRSEL: Figma'dan eklenecek]` |

---

#### 4.1 Özet Karar Matrisi (Tam 11 Satır — Kapsam Geneli)

> Her işlevin tam karar değerlendirmesi tek tabloda. Soru kolonları sabit; işlev kolonları dinamik (her işlev için kolon).

| Analiz Edilecek Başlıklar | 4.1.1 | 4.1.2 | ... | Genel Not |
|----------------------------|-------|-------|-----|-----------|
| Yeni ekran tasarımı veya mevcut ekranda değişiklik var mı? | {{E/H}} | {{E/H}} | | |
| Yeni batch veya mevcut batchlerde değişiklik var mı? | Hayır | Hayır | | Mobil kapsamda batch tanımı bulunmamaktadır |
| Yeni bir çıktı/rapor veya değişiklik var mı? | {{E/H}} | {{E/H}} | | |
| Yeni menü tanımlanacak mı? | {{E/H}} | {{E/H}} | | |
| Yeni bir servis tanımı olacak mı? | {{E/H}} | {{E/H}} | | Mevcut MCS incelemesi yapıldıktan sonra netleştirilir ([A9.3]) |
| Erişim noktaları analiz edilecek mi? (Pano/NBT/3D Touch/Spotlight/Deep Link) | {{E/H}} | {{E/H}} | | |
| SMS/PN bilgilendirme tanımı olacak mı? | {{E/H}} | {{E/H}} | | |
| E-mail bilgilendirme tanımı olacak mı? | {{E/H}} | {{E/H}} | | |
| Memo ve ekstre tanımı olacak mı? | {{E/H}} | {{E/H}} | | |
| Uyarı ve hata mesajı tanımı olacak mı? | {{E/H}} | {{E/H}} | | |
| Mevcut hangi ekranlara/servislere etkisi olacak? | {{E/H}} | {{E/H}} | | Hangi mevcut ekran/servis sözleşmesi etkileniyorsa not düşülür |

#### 4.1 Derinleştirme Kararları (Kapsam Geneli)

> 4 sütunlu yapı zorunlu ([A18.1]): serbest metin yerine "Aşama / Build / Etki" sütununa somut detay yazılır.

| Soru | Karar (Evet/Hayır/Belirsiz) | Aşama / Build / Etki | Not |
|------|-----------------------------|-----------------------|-----|
| Segmente göre farklılık olacak mı? | {{...}} | {{Hangi segment(ler)de farklı davranış, hangi 4.1.X'te}} | |
| Yeni HPC tanımlanmalı mı? | {{...}} | {{HPC değeri veya [BELIRSIZ — HPC ekibi atayacak]; ilgili servis: TransactionName}} | |
| Pilot kontrolü yapılacak mı? | {{...}} | {{Hangi ekran/aksiyonda kontrol; pilot grup segmenti; pilot key adı}} | [A18.2] |
| Eski client etkisi var mı? | {{...}} | MinBuildNumber: {{X}}; davranış: "Yeni {{X}} gösterilmez; mevcut akış değişmeden devam eder." | [A13.4] |
| Force update ihtiyacı var mı? | {{...}} | {{Hangi sürüm öncesi force update; gerekçe}} | |
| TrackMobileEvent loglama ihtiyacı var mı? | {{...}} | {{Somut event listesi}} veya "Loglama detayı teknik tasarım aşamasında netleştirilecektir." | [A14.3] |
| SAS loglama ihtiyacı var mı? | {{...}} | {{Hangi event'lerde SAS gönderimi}} | |
| Dataroid etkisi var mı? | {{...}} | {{Hangi screen view + custom event}} | |
| Adjust etkisi var mı? | {{...}} | {{Hangi attribution event'i}} | |
| Kart maskeleme ihtiyacı var mı? | {{...}} | {{Akışta kart varsa nerede maskelenir}} | |
| İngilizce ve Arapça menülere etki var mı? | {{...}} | 3.4.5 CMS tablosunda en-US ve ar-SA durumu; [ÇEVİRİ GEREKLİ] takip listesi | |

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

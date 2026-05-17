# Proje Analiz Dokümanı — {{PROJE_ADI}}

**Doküman Kodu:** BT_REQM00004 (Mobil uyarlama)
**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Versiyon:** {{VERSIYON}}
**Tarih:** {{TARIH}}
**Hazırlayan:** {{HAZIRLAYAN}}
**Durum:** Taslak / İncelemede / Onaylandı
**Kanal:** Mobil (ChannelID = 10)
**Figma:** {{FIGMA_LINK_VEYA_YOK}}

> AS-IS Referans: `docs/mobile-as-is-analiz.md` (Versiyon: {{AS_IS_VERSIYON}})

---

## Değişiklik Tarihçesi

| Versiyon | Tarih | Değişiklik | Hazırlayan |
|----------|-------|------------|------------|
| {{VERSIYON}} | {{TARIH}} | İlk versiyon | {{HAZIRLAYAN}} |

---

## İçindekiler

1. Proje Genel Tanımı ve Amacı
2. Terimler ve Kısaltmalar
3. Müşteri Gereksinimleri
    3.1. Gereksinimler
    3.2. Genel Süreç Akışı
    3.3. Kapsama Alınmayan Müşteri Gereksinimleri
    3.4. Etki ve Risk Analizi
       3.4.1. Kanal (ADK) Etkisi
       3.4.2. Engelsiz Bankacılık Etkisi
       3.4.3. SAS Fraud Etkisi
       3.4.4. Chatbot Etkisi
       3.4.5. CMS (Content Management System) Etkisi
       3.4.6. TTS (OSDEM - SDY) ve DYS (FOMER) Etkisi
       3.4.7. MDYS (Müşteri Doküman Yönetim Sistemi) Tanımları
       3.4.8. Mevzuata Uyum
       3.4.9. Anomali Takibi
       3.4.10. Mobil ve IB Uygulamaları EBHS Etkisi
       3.4.11. İngilizce İletişim Tercih Eden Müşteri Etkisi
4. Yazılımın Fonksiyonel Gereksinimleri
    4.1. Yazılım İşlevleri
    4.2. Muhasebe, Dekont, Alındılar ve Sistem Mizan
    4.3. Loglama ve EDW Rapor Gereksinimi
    4.4. Ürün ve Ürün İşlem Tanım Gereksinimleri

---

## 1. Proje Genel Tanımı ve Amacı

Projeden ne beklendiği, kısaca tanımı ve amacı bu bölümde anlatılır.

{{PROJE_TANIM_VE_AMAC_PARAGRAFI}}

---

## 2. Terimler ve Kısaltmalar

Bu bölümde projede kullanılan terim ve kısaltmalar belirtilmiştir. Projeye özel terimler {{PROJE_ADI}} bağlamında detaylandırılmıştır.

| Terim | Açıklama |
|-------|----------|
| KOS | Kartlı Ödeme Sistemleri |
| POT | Price Offer Table |
| TOT | Tax Offer Table |
| CMS | Content Management System |
| MDYS | Müşteri / Merkezi Doküman Yönetim Sistemi |
| SEO | Search Engine Optimization |
| HASO | Haciz Sistem Otomasyonu |
| ÇDA | Çapraz Donuk Alacak |
| YTS | Yasal Takip Sistemi |
| BDS | Başvuru Değerlendirme Sistemi |
| UBDS | Üye İş Yeri Başvuru Değerlendirme Sistemi |
| DSMB | Direkt Satış Mobil Başvuru Önyüzleri |
| RTO | Real Time Offer |
| HPC | Host Process Code |
| EBHS | Elektronik Bankacılık Hizmetleri Sözleşmesi |
| ADK | Alternatif Dağıtım Kanalları |
| MCS | Mobile Channel Service |
| MWBackend | Mobil Bankacılık Backend (DDD: application + domain) |
| ÜGS | Üst Güvenlik Segmenti |
| TrackMobileEvent | Mobil event loglama mekanizması |
| Dataroid | Mobil analitik SDK |
| Adjust | Mobil attribution SDK |
| {{PROJE_OZEL_TERIM_1}} | {{ACIKLAMA_1}} |
| {{PROJE_OZEL_TERIM_2}} | {{ACIKLAMA_2}} |

---

## 3. Müşteri Gereksinimleri

### 3.1. Gereksinimler

Müşterinin/kullanıcının bakış açısıyla ne istediği aşağıda maddeler halinde belirtilmiştir. Yazılım Gereksinimleri bu bölümde belirtilmez; 4. Bölümde detaylandırılır.

**Müşteri Gereksinimleri Listesi:**

| MG # | Müşteri Gereksinimi |
|------|----------------------|
| MG1 | {{MUSTERI_GEREKSINIMI_1}} |
| MG2 | {{MUSTERI_GEREKSINIMI_2}} |
| MG3 | {{MUSTERI_GEREKSINIMI_3}} |

**MG → İlişkili Yazılım Gereksinimi Eşlemesi:**

| Müşteri Gereksinimi | İlişkili Yazılım Gereksinimi |
|---------------------|--------------------------------|
| MG1 | 4.1.1 |
| MG2 | 4.1.2 ; 4.2.3 |
| MG3 | 4.1.3 |

### 3.2. Genel Süreç Akışı

3.1. Gereksinimler doğrultusunda değişen sürecin genel akış diyagramı görsel olarak aşağıda yer almaktadır. Akışın Libre veya Axure'da çizilmesi beklenmektedir; mobil için yedek olarak Mermaid diyagramı paylaşılabilir.

**Görsel Akış:** {{LIBRE_VEYA_AXURE_LINK_VEYA_GORSEL_REFERANSI}}

**Mermaid Yedek Akış (mobil):**

```mermaid
flowchart TB
{{TO_BE_DIYAGRAM_ICERIGI}}
```

**Akış Kısa Açıklaması:** {{KISA_ACIKLAMA}}

### 3.3. Kapsama Alınmayan Müşteri Gereksinimleri

Kapsama alınmayan gereksinimler, maddeler halinde neden alınmadığına dair sebepleri ve sonrasında alınacak aksiyonlarla birlikte aşağıda belirtilmiştir.

> Kapsama alınmayan gereksinim yoksa: **"Kapsama alınmayan gereksinim bulunmamaktadır."** (başlık silinmez)

| Konu | Gerekçe | Sonrasında Alınacak Aksiyon |
|------|---------|------------------------------|
| {{KONU_1}} | {{GEREKCE_1}} | {{AKSIYON_1}} |

### 3.4. Etki ve Risk Analizi

Discovery fazında hazırlanan Etki Analiz Formu (POTA) kontrol listesi baz alınarak doldurulmuştur. "Evet" işaretlenen her madde için 4. Bölümdeki ilgili işlev modülünde detay verilir.

> Bu projeyle ilgili Etki Analiz Formu POTA'da yer almaktadır: {{POTA_LINK}}

#### 3.4.1. Kanal (ADK) Etkisi

> Etkisi yoksa: **"Kanal etkisi bulunmamaktadır."**

| Kanal | Etki Var Mı? | Açıklama | POTA Referans |
|-------|---------------|----------|----------------|
| QNB Mobil Bankacılık (bu doküman kapsamı) | {{E/H}} | {{ACIKLAMA}} | {{POTA_LINK}} |
| QNB İnternet Bankacılığı | {{E/H}} | {{ACIKLAMA}} | — |
| Enpara Mobil Bankacılık | {{E/H}} | {{ACIKLAMA}} | — |
| Enpara İnternet Bankacılığı | {{E/H}} | {{ACIKLAMA}} | — |
| Callcenter | {{E/H}} | {{ACIKLAMA}} | — |
| ATM | {{E/H}} | {{ACIKLAMA}} | — |
| Web | {{E/H}} | {{ACIKLAMA}} | — |

#### 3.4.2. Engelsiz Bankacılık Etkisi

> Etkisi yoksa: **"Internet veya Mobil uygulamalara etkisi yoktur."** (etki varsa her iki kanal için tablo doldurulur)

| İşlem Açıklaması | HPC | Sözleşme İçeriyor mu? |
|-------------------|------|--------------------------|
| {{ISLEM_1}} | {{HPC_1}} | Evet / Hayır |

#### 3.4.3. SAS Fraud Etkisi

> Etkisi yoksa: **"SAS Fraud etkisi yoktur."**

| Yeni / Mevcut İşlem | İşlem Adı | Attribute | Channel System Name (Bagkey) | Info (Offline) / Aksiyon (Online) |
|-----------------------|-----------|------------|--------------------------------|-------------------------------------|
| {{YENI/MEVCUT}} | {{ISLEM_ADI}} | {{ATTRIBUTE}} | {{BAGKEY}} | {{INFO/AKSIYON}} |

#### 3.4.4. Chatbot Etkisi

Bu bölüm MUTLAKA doldurulur. Analiz onayı sonrası OZL DB ChatBot Apps Ba ekibine bilgi verilir ve doküman paylaşılır.

> Etkisi yoksa: **"Chatbot etkisi bulunmamaktadır."** (yine de ekibe bilgi verilir.)

| Yeni / Mevcut Ürün | Ürün Adı | Ortam (Mobil / İnternet / CC / CORE vb.) | Açıklama |
|----------------------|-----------|---------------------------------------------|------------|
| {{YENI/MEVCUT}} | {{URUN_ADI}} | Mobil | {{ACIKLAMA}} |

#### 3.4.5. CMS (Content Management System) Etkisi

> Etkisi yoksa: **"CMS etkisi bulunmamaktadır."**

**Mobil için ilgili tablo:** `CommonDb.VpStringResource` (ChannelID = 10) — ResourceType, ResourceKey, ResourceValue (3 dil: tr-TR, en-US, ar-SA).

| Yeni / Değişen ResourceType | ResourceKey | tr-TR | en-US | ar-SA |
|------------------------------|--------------|--------|--------|--------|
| {{RT_1}} | {{KEY_1}} | {{TR_1}} | {{EN_1}} | {{AR_1}} |

#### 3.4.6. TTS (OSDEM - SDY) ve DYS (FOMER) Etkisi

> Etkisi yoksa: **"TTS-DYS etkisi bulunmamaktadır."**

{{TTS_DYS_ACIKLAMA}}

#### 3.4.7. MDYS (Müşteri Doküman Yönetim Sistemi) Tanımları

> Etkisi yoksa: **"MDYS etkisi bulunmamaktadır."**

| # | Bilgi | Değer |
|---|--------|-------|
| 1 | Dokümanın tam adı | {{TAM_AD}} |
| 2 | Tekil mi (Tekil / Tekil Değil) | {{TEKIL}} |
| 3 | Müşteri Tipi (G / T / GKTİ) | {{MUSTERI_TIPI}} |
| 4 | Metadata (Müşteri no / TCKN / VKN / YKN gibi) | {{METADATA}} |
| 5 | Zorunlu / Opsiyonel | {{ZORUNLULUK}} |
| 6 | Tarama tercihi (siyah-beyaz, arkalı-önlü vb.) | {{TARAMA}} |
| 7 | Aşama (onay öncesi, tüm aşamalarda) | {{ASAMA}} |
| 8 | İşlem dokümanı / Müşteri dokümanı | {{TIP}} |
| 9 | Yetkilendirilmiş kişi için çalışılacak mı? | Evet / Hayır |
| 10 | Müşterek için kullanılacak mı? | Evet / Hayır |

#### 3.4.8. Mevzuata Uyum

İş isteği kapsamındaki düzenlemelerin mevzuata uyumu "İç Kontrol ve Yasal Uyum Başkanlığı"ndan görüş alınarak değerlendirilir.

> Mevzuat düzenlemesi yoksa standart cümle:
> **"Banka Proje sorumlusu {{AD}} tarafından mevzuat uyum durumu Yasal Uyum biriminden sorgulanmış olup, iş isteği kapsamında mevzuata uyulması için yapılması gereken bir geliştirme bulunmadığı iletilmiştir."**

{{MEVZUAT_DETAYI_VEYA_STANDART_CUMLE}}

#### 3.4.9. Anomali Takibi

> Etkisi yoksa: **"Anomali takibi ihtiyacı bulunmamaktadır."**

| Bildirim Tipi | Tetiklenme | Log Mekanizması | Anomali Kuralı |
|----------------|-------------|--------------------|------------------|
| {{TIP_1}} | {{TETIK_1}} | {{LOG_1}} | {{KURAL_1}} |

#### 3.4.10. Mobil ve IB Uygulamaları EBHS (Elektronik Bankacılık Hizmetleri Sözleşmesi) Etkisi

> Etkisi yoksa: **"EBHS Etkisi bulunmamaktadır."**

**EBHS İmzalama / Onaylama İş Akışı:** {{AKIS_PARAGRAFI}}

#### 3.4.11. İngilizce İletişim Tercih Eden Müşteri Etkisi

> Etkisi yoksa: **"İngilizce İletişim Tercih Eden Müşteri etkisi bulunmamaktadır."**

**en-US için yapılması gereken düzenlemeler:** {{EN_DUZENLEME_PARAGRAFI}}

**Resource Key listesi (VpStringResource — en-US, ChannelID = 10):** {{KEY_LISTESI}}

---

## 4. Yazılımın Fonksiyonel Gereksinimleri

### 4.1. Yazılım İşlevleri

Yazılım İşlev Gereksinimleri, talebin tümden gelim (top-down) yaklaşımıyla kolay okunabilir parçalara bölünerek aşağıda detaylandırılmıştır.

---

#### 4.1.1. {{ISLEV_1_BASLIGI}} Yazılım İşlevi

**İşlev Özeti:** {{ISLEV_OZET_PARAGRAFI}}

##### 4.1.1.1. Ekran Tasarımı

**Figma:** {{FIGMA_LINK}}

| Ekran | iOS Storyboard / VC | Android Activity / Class | Resource Key |
|--------|------------------------|----------------------------|--------------|
| {{EKRAN_1}} | {{STORYBOARD}} | {{ACTIVITY}} | {{RES_KEY}} |

**Ekran İşlevselliği (paragraf):** {{PARAGRAF}}

**Kod Referansı:**
> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `mobilebanking-ios/{{YOL}}` | {{VC_ADI}}, `mobilebanking-android/{{YOL}}` | {{ACTIVITY_ADI}}

##### 4.1.1.2. Batchler

> **Standart:** **"Mobil kapsamda batch tanımı bulunmamaktadır."** (başlık silinmez)

İstisna durumunda (mobilden tetiklenen ancak sunucu tarafında zamanlanmış işlem): {{ISTISNA_PARAGRAFI}}

##### 4.1.1.3. Çıktı ve Raporlar

> Etkisi yoksa: **"Çıktı veya rapor gereksinimi bulunmamaktadır."**

| Çıktı Tipi | Format | Erişim Yeri (Ekran) | Üreten Bileşen |
|--------------|---------|----------------------|------------------|
| {{CIKTI_1}} | PDF / TXT | {{EKRAN}} | {{BILESEN}} |

##### 4.1.1.4. Menü Tanımları

**Yeni / Değişen MobileMenu Kayıtları (CommonDb.MobileMenu, ChannelID = 10):**

| MenuID | ParentID | Title (ResourceKey) | TransactionName | EnabledTR | EnabledEN | AllUser | Configuration Özeti | Validation Özeti |
|--------|----------|------------------------|-------------------|-----------|-----------|---------|----------------------|--------------------|
| {{ID}} | {{PID}} | {{KEY}} | {{TXN}} | 1 | 1 | 1/2/3 | iOS/Android/Huawei min build, PilotKey | ClientValidationList Rule (AND/OR) |

**MobileMenuMapping (Pano, NBT, 3D Touch, Spotlight, Pega, Hızlı Erişim):**

| ReferenceID | MenuID | MenuType (1-15) | ParentMenu | TitleKey |
|--------------|---------|------------------|-------------|-----------|
| {{REF}} | {{ID}} | {{TIP}} | 0/1 | {{KEY}} |

##### 4.1.1.5. Erişim Noktaları

| Erişim Tipi | MenuType | Eklenme / Değişiklik |
|---------------|----------|------------------------|
| Ana Menü | — | {{DURUM}} |
| Pano | 1 | {{DURUM}} |
| Mandatory | 2 | {{DURUM}} |
| 3D Touch (Kısayol) | 9 | {{DURUM}} |
| Spotlight (iOS) | 10 | {{DURUM}} |
| NBT Sık Kullanılan | 12 | {{DURUM}} |
| Pega Sık Kullanılan | 13 | {{DURUM}} |
| Hızlı Erişim Panosu | 14 | {{DURUM}} |
| Başvuru Merkezi | 15 | {{DURUM}} |
| Deep Link | — (Configuration JSON) | {{DURUM}} |

##### 4.1.1.6. SMS / PN Bilgilendirmeleri

| Form Code | Tip (SMS / PN) | Tetiklenme Koşulu | Şablon ResourceKey | NOTIFICATION Refresh |
|-----------|------------------|----------------------|------------------------|-------------------------|
| {{KOD}} | {{TIP}} | {{KOSUL}} | {{KEY}} | NOTIFICATION_SMS_TEMPLATE / NOTIFICATION_PN_TEMPLATE |

##### 4.1.1.7. E-Mail Bilgilendirmeleri

> Etkisi yoksa: **"E-Mail bilgilendirme gereksinimi bulunmamaktadır."**

| Şablon ResourceKey | Tetiklenme | Attachment | Content Repository |
|------------------------|-------------|-------------|----------------------|
| {{KEY}} | {{KOSUL}} | {{ATT}} | {{REPO}} |

> SMG Queue OID Email: 9600010000000070 / NOTIFICATION_EMAIL_TEMPLATE refresh.

##### 4.1.1.8. Memo / Ekstre Mesajları

> Etkisi yoksa: **"Memo / ekstre mesajı gereksinimi bulunmamaktadır."**

| Mesaj Tipi | İçerik (ResourceKey) | Hesap / Kart | Tetiklenme |
|-------------|--------------------------|----------------|-------------|
| {{TIP}} | {{KEY}} | {{HESAP/KART}} | {{KOSUL}} |

##### 4.1.1.9. Uyarı / Hata Mesajları

| Validation FilterKey | FilterValue | FilterOperation | ActionType (0 / 1 / 2) | ActionMessage ResourceKey | Davranış |
|------------------------|--------------|--------------------|----------------------------|------------------------------|------------|
| {{KEY}} | {{VAL}} | equal / greaterThanEqual / lessThanEqual | 0 | {{MSG_KEY}} | Menüyü gizle |

> ActionType: 0 — Menüyü gizle; 1 — Akışı kes + popup; 2 — Popup göster + sayfaya yönlendir.

##### 4.1.1.10. Servisler

**Yeni / Değişen MCS TransactionName Listesi:**

| Türkçe Servis Adı | TransactionName | Açıklama | Giriş Özü | Çıkış Özü |
|--------------------|------------------|----------|------------|------------|
| {{TR_AD}} | {{TXN}} | {{ACK}} | {{IN}} | {{OUT}} |

**VpTransaction Tablo Etkisi (3 tabloda zorunlu insert, ChannelID = 10):**

| Tablo | Anahtar Alanlar |
|-------|------------------|
| VpTransaction | TransactionName, Description, LastActionUser='T65714' |
| VpTransactionConfig | TransactionID, Configuration (XML), ChannelID = 10, CreateBy='T65714' |
| VpTransactionAttributes | TransactionID, ChannelID = 10, IsEnabled = 1, IsHistoryLoggingEnabled = 1, LoggingVerbosity = 1111, HostCallLogVerbosity = 11, HostProcessCode = 100000 |

**MCS Mapping (VpVeriBranchHostCallMappingView + VpHostCallMappingDetail):** {{MAPPING_PARAGRAFI}}

**Backend Logic (mwbackend DDD — Application + Domain):**

> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `mwbackend/Application/{{Domain}}/UseCase/{{Dosya}}.cs` | {{Handler}}
> `mwbackend/Application/{{Domain}}/Handler/{{Dosya}}.cs` | {{Method}}
> `mwbackend/Domain/{{Domain}}/Service/{{Dosya}}.cs` | TransactionNameConstants.{{TXN}}

##### 4.1.1.11. Etki Analizi

Bu işlev özelinde 3.4 maddesindeki etki kontrol listesinden tetiklenenler aşağıda referanslanmıştır. Detaylar 3.4.x altındadır.

| 3.4.x | Tetiklenen Etki | Mobil İşlev Etkisi |
|-------|------------------|-----------------------|
| 3.4.1 | Kanal — Mobil | {{ACK}} |
| 3.4.5 | CMS | {{ACK}} |
| 3.4.{{x}} | ... | ... |

---

#### 4.1.2. {{ISLEV_2_BASLIGI}} Yazılım İşlevi

(Aynı 11 alt başlık yapısı yukarıdaki gibi tekrarlanır.)

---

### 4.2. Muhasebe, Dekont, Alındılar ve Sistem Mizan

Mobil üzerinden tetiklenen finansal işlemlerin core finans tarafındaki muhasebe yansıması bu bölümde değerlendirilir.

#### 4.2.1. Fiş Satır Açıklamaları

> Etkisi yoksa: **"Fiş satır açıklamaları kapsamında etki bulunmamaktadır."**

| İşlem Tipi | Fiş Satırı | Açıklama Şablonu |
|--------------|--------------|--------------------|

#### 4.2.2. Vergi Tanımları

> Etkisi yoksa: **"Vergi tanımları kapsamında etki bulunmamaktadır."**

| Vergi Tipi | Hesaplama / Mapping |
|-------------|------------------------|

#### 4.2.3. Hesap Hareket Açıklamaları

> Etkisi yoksa: **"Hesap hareket açıklamaları kapsamında etki bulunmamaktadır."**

| Hareket Tipi | Açıklama (ResourceKey) | Mobil Görünüm |
|----------------|--------------------------|------------------|

#### 4.2.4. ATM Makbuz ve Journal Açıklamaları

> **Mobilde doğrudan ATM makbuzu üretilmez. Standart cümle:** "ATM makbuz ve journal açıklamaları kapsamında etki bulunmamaktadır."

#### 4.2.5. Masraf Komisyon Açıklamaları

> Etkisi yoksa: **"Masraf komisyon açıklamaları kapsamında etki bulunmamaktadır."**

| İşlem | Masraf / Komisyon | ResourceKey | Hesaplama Kuralı |
|--------|----------------------|--------------|---------------------|

#### 4.2.6. MASAK Etkisi

> Etkisi yoksa: **"MASAK kapsamında etki bulunmamaktadır."**

| Hesap Hareketi | İşlem Tip Kodu | MASAK Bildirim |
|------------------|-------------------|------------------|

#### 4.2.7. GİB Raporlarına Etkisi

> Etkisi yoksa: **"GİB raporlarına etki bulunmamaktadır."**

| Rapor | Etki | Açıklama |
|--------|-------|------------|

#### 4.2.8. TCMB İstatistik Kodları

> Etkisi yoksa: **"TCMB istatistik kodları kapsamında etki bulunmamaktadır."**

| İstatistik Kodu | Bağlantılı İşlem |
|--------------------|----------------------|

#### 4.2.9. Sistem-Mizan Farkı Açısından Değerlendirmeler

> Etkisi yoksa: **"Sistem-mizan farkı açısından etki bulunmamaktadır."**

{{DEGERLENDIRME_PARAGRAFI}}

---

### 4.3. Loglama ve EDW Rapor Gereksinimi

#### 4.3.1. Loglama

**MADDE 13 Referansı:** BDDK Tebliği — 5 yıl saklama zorunluluğu (Confluence pageId: 52235469).

**Mobil Log Tabloları (MobileDefaultLog veritabanı, ChannelID = 10):**

| Tablo | Amaç | Saklama Süresi | Eklenen / Değişen Alan |
|-------|------|----------------|--------------------------|
| VpMobileContact | Oturum başlangıç + device | 5 yıl | {{ALAN}} |
| VpMobileContactHistory | İşlem özet | 5 yıl | {{ALAN}} |
| VpDefaultLog | Detaylı işlem log | 5 yıl | {{ALAN}} |
| VpExceptionLog | Hata log | 5 yıl | {{ALAN}} |
| VpTransactionHistoryLog | İşlem özet (hafif) | 5 yıl | {{ALAN}} |

**Mobil Analitik:**

| Sistem | Event Adı | Payload | Tetiklenme |
|---------|-----------|----------|--------------|
| TrackMobileEvent | {{EVENT}} | {{PAYLOAD}} | {{KOSUL}} |
| Dataroid | {{EVENT}} | {{PAYLOAD}} | {{KOSUL}} |
| Adjust | {{EVENT}} | {{PAYLOAD}} | {{KOSUL}} |
| SAS | {{EVENT}} | {{PAYLOAD}} | {{KOSUL}} |

#### 4.3.2. EDW Rapor Gereksinimi

> Etkisi yoksa: **"EDW rapor gereksinimi bulunmamaktadır."**

| Rapor | Veri Kaynağı | EDW Extra Field | Sahip Ekip |
|--------|----------------|--------------------|--------------|
| {{RAPOR}} | {{KAYNAK}} | {{FIELD}} | {{EKIP}} |

#### 4.3.3. Resmi Kurum / Yasal Raporlama Gereksinimleri

> Etkisi yoksa: **"Resmi kurum / yasal raporlama gereksinimi bulunmamaktadır."**

| Kurum | Rapor | LGR Şeması Etkisi | Zorunluluk Kaynağı |
|--------|--------|----------------------|-----------------------|
| BDDK / KKB / Memzuç / GİB / MASAK | {{RAPOR}} | {{ETKI}} | {{TEBLIG/MEVZUAT}} |

---

### 4.4. Ürün ve Ürün İşlem Tanım Gereksinimleri

#### 4.4.1. Product Modeller Tanımları

> Etkisi yoksa: **"Product Modeller tanım gereksinimi bulunmamaktadır."**

| Product Model | Tanım | Mobil Etkisi |
|-----------------|--------|----------------|

#### 4.4.2. POT / TOT Tanımları

> Etkisi yoksa: **"POT / TOT tanım gereksinimi bulunmamaktadır."**

| POT / TOT Adı | İşlem | Kriterler | Dönen Değerler |
|------------------|--------|-----------|------------------|

#### 4.4.3. Onay Kuralları Şablonu

> Etkisi yoksa: **"Onay kuralları şablonu gereksinimi bulunmamaktadır."**

| Onay Tipi | Kural | Onaylayan Rol | Onay Adımı |
|-------------|---------|------------------|--------------|

---

## Metodoloji ve Araştırma Kaynakları

1. **AS-IS Girdi:** `docs/mobile-as-is-analiz.md` (mobile-01 çıktısı, versiyon: {{V}})
2. **Semantic Search (scopeProject = mobilebanking):**
   - Tur A — UseCase / Handler: `query`, `extensionFilter: [".cs"]`
   - Tur B — TransactionNameConstants
   - Tur C — Helper / iş kuralı
   - Tur D — IService implementasyon
   - Tur E — Client (.swift / .kt / .java) sınırlı tek tur
3. **MSSQL MCP (CommonDb + MobileDefaultLog, ChannelID = 10):**
   - MobileMenu / MobileMenuMapping sorguları
   - VpStringResource 3 dil sorguları
   - VpTransaction / VpTransactionConfig / VpTransactionAttributes durum kontrolü
   - VpVeriBranchHostCallMappingView + VpHostCallMappingDetail MCS mapping
4. **Figma (mcp-figma):** {{LINK_VEYA_YOK}}
5. **POTA Etki Analiz Formu (Discovery):** {{POTA_LINK_VEYA_REF}}
6. **questions.md Kategori Yanıtları:** Kapsam & Ekip, Kullanıcı & Segment, Erişim & Yönlendirme, Performans & Oturum, Menü & Konfigürasyon, Pilot & Versiyon, Teknik & Servis, Loglama & Analitik, Güvenlik & Hukuk, Dil & Erişilebilirlik, Test — eksik cevaplar AskQuestion ile alındı ve ilgili bölüme işlendi.

---

## Değişiklik Geçmişi

| Tarih | Versiyon | Değişiklik |
|-------|----------|------------|
| {{TARIH}} | {{VERSIYON}} | İlk versiyon |

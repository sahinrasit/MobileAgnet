# Mobile AS-IS Analiz Dokümanı — {{PROJE_ADI}}

## Doküman Bilgileri

**Kapsam:** {{KAPSAM_TANIMI}} (mobil kanal — ChannelID = 10)
**Versiyon:** {{VERSIYON}}
**Tarih:** {{TARIH}}
**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Hazırlayan:** {{HAZIRLAYAN}}
**Figma:** {{FIGMA_LINK_VEYA_YOK}}

> **Önceki Versiyon:** {{ONCEKI_VERSIYON_YOLU}} (varsa)

---

## İçindekiler

[Metodoloji ve Araştırma Kaynakları](#metodoloji-ve-araştırma-kaynakları)

[1. Proje Genel Tanımı ve Amacı](#1-proje-genel-tanımı-ve-amacı)

[2. Terimler ve Kısaltmalar](#2-terimler-ve-kısaltmalar)

[3. Mevcut Süreç Analizi (Mobil Kanal)](#3-mevcut-süreç-analizi-mobil-kanal)

[4. Mevcut Yazılım İşlevlerinin Analizi](#4-mevcut-yazılım-işlevlerinin-analizi)

[5. Kısıtlamalar ve Belirsizlikler](#5-kısıtlamalar-ve-belirsizlikler)

---

## 1. Proje Genel Tanımı ve Amacı

### 1.1. Projenin Mobil Kanaldaki Mevcut Durumu

{{MEVCUT_DURUM_TANIMI}}

### 1.2. Analiz Kapsamı

{{ANALIZ_KAPSAMI}}

---

## 2. Terimler ve Kısaltmalar

### 2.1. Teknik Terimler Sözlüğü

| Terim | Açıklama |
|-------|----------|
| MCS | Mobile Channel Service — mobil kanal çekirdek entegrasyon servisi |
| HPC | Host Process Code |
| MWBackend | Mobil bankacılık backend (DDD: application + domain) |
| ÜGS | Üst Güvenlik Segmenti |
| TrackMobileEvent | Mobil event loglama mekanizması |
| Dataroid | Mobil analitik SDK |
| Adjust | Mobil attribution SDK |
| VpStringResource | Çoklu dil resource tablosu (ChannelID = 10) |
| MobileMenu | Mobil ana menü ve alt menü tanımları (ChannelID = 10) |
| {{TERIM_X}} | {{ACIKLAMA_X}} |

---

## 3. Mevcut Süreç Analizi (Mobil Kanal)

### 3.1. Genel Süreç Akışı

**Mevcut Süreç Özeti:**

{{SUREC_OZETI_PARAGRAFI}}

**Süreç Adımları Özet Tablosu:**

| Adım | Kullanıcı Aksiyonu | Mobil Tarafta Olan | Backend / MCS | Sonuç |
|------|---------------------|---------------------|----------------|-------|
| 1 | {{AKSIYON_1}} | {{ISLEM_1}} | {{MCS_1}} | {{SONUC_1}} |
| 2 | {{AKSIYON_2}} | {{ISLEM_2}} | {{MCS_2}} | {{SONUC_2}} |

**Akış Diyagramı:**

```mermaid
flowchart TB
{{DIYAGRAM_ICERIGI}}
```

### 3.2. Kapsama Alınmayan Konular

| Konu | Gerekçe |
|------|---------|
| Batch işlemleri | Mobilde batch yoktur — kapsam dışı |
| Web kanal davranışı | Bu doküman yalnızca mobil (ChannelID = 10) |
| {{KONU_X}} | {{GEREKCE_X}} |

---

## 4. Mevcut Yazılım İşlevlerinin Analizi

### 4.1. Yazılım İşlev Detayları

#### 4.1.Y {{ISLEV_BASLIGI}} — Mevcut Durum

**Karar Matrisi (Mobil — 11 Alt Başlık, common-rules [C5] ile ortak):**

| Analiz Edilecek Başlık | Evet / Hayır | Index | AS-IS Notu |
|-------------------------|--------------|-------|--------------|
| Ekran Tasarımı | {{E/H}} | 4.1.Y.1 | Figma + iOS Storyboard/VC + Android Activity/Class |
| Batchler | **Hayır** (default) | 4.1.Y.2 | "Mobil kapsamda batch tanımı bulunmamaktadır" — başlık silinmez |
| Çıktı ve Raporlar | {{E/H}} | 4.1.Y.3 | Mevcut PDF / dekont indirme |
| Menü Tanımları | {{E/H}} | 4.1.Y.4 | Mevcut MobileMenu + MobileMenuMapping kayıtları |
| Erişim Noktaları | {{E/H}} | 4.1.Y.5 | Pano, NBT, 3D Touch, Spotlight, Deep Link |
| SMS / PN Bilgilendirmeleri | {{E/H}} | 4.1.Y.6 | Mevcut Form Code'lar |
| E-Mail Bilgilendirmeleri | {{E/H}} | 4.1.Y.7 | Mevcut Email şablonları |
| Memo / Ekstre Mesajları | {{E/H}} | 4.1.Y.8 | Mevcut memo / ekstre mesajları |
| Uyarı / Hata Mesajları | {{E/H}} | 4.1.Y.9 | Mevcut Validation Rule + ActionType |
| Servisler | {{E/H}} | 4.1.Y.10 | Mevcut MCS TransactionName + mwbackend handler'ları |
| Etki Analizi (mevcut etki noktaları) | {{E/H}} | 4.1.Y.11 | Bu işlevin bugünkü çevresel etki noktaları |

> **Not:** "Hayır" işaretlenen başlıklar dokümanda silinmez; common-rules [C15] "Standart Etkisiz Cümle Sözlüğü"nden uygun cümleyle doldurulur. Batchler satırı default Hayır + standart cümle ile geçilir.

---

##### 4.1.Y.1. Ekran Tasarımı

**Figma Referansı:** {{FIGMA_LINK_VEYA_YOK}}

**Mevcut Ekranlar:**

| Ekran Adı | iOS (Storyboard / VC) | Android (Activity / Class) | Resource Key |
|-----------|------------------------|------------------------------|---------------|
| {{EKRAN_1}} | {{STORYBOARD_1}} | {{ACTIVITY_1}} | {{RES_KEY_1}} |

**Ekran İşlevselliği (paragraf — analist-odaklı):**

{{EKRAN_ISLEVSELLIK_PARAGRAFI}}

**Kod Referansı:**

> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `ios/{{YOL}}` | {{VC_ADI}}, `android/{{YOL}}` | {{ACTIVITY_ADI}}

---

##### 4.1.Y.2. Batchler

> **Standart:** "Mobil kapsamda batch tanımı bulunmamaktadır." (default — başlık silinmez)

İstisna durumunda (mobilden tetiklenen ancak sunucu tarafında zamanlanmış işlem varsa): {{ISTISNA_PARAGRAFI}}

---

##### 4.1.Y.3. Çıktı ve Raporlar

> Etkisi yoksa: "Çıktı veya rapor gereksinimi bulunmamaktadır."

| Çıktı Tipi | Format | Erişim Yeri (Ekran) | Üreten Bileşen |
|--------------|---------|----------------------|------------------|
| {{CIKTI_1}} | PDF / TXT | {{EKRAN}} | {{BILESEN}} |

---

##### 4.1.Y.4. Menü Tanımları

**MobileMenu Kayıtları (CommonDb.MobileMenu, ChannelID = 10):**

| MenuID | ParentID | Title (ResourceKey) | TransactionName | EnabledTR | EnabledEN | AllUser (1/2/3) | MenuType (Mapping) |
|--------|----------|------------------------|--------------------|-----------|-----------|-------------------|------------------------|
| {{ID_1}} | {{PID_1}} | {{KEY_1}} | {{TXN_1}} | 1 | 1 | 1 | — |

**Configuration JSON Özeti:**

{{CONFIG_OZETI_PARAGRAFI}}

**Validation Kuralları (ClientValidationList — AND/OR):**

{{VALIDATION_OZETI_PARAGRAFI}}

**MobileMenuMapping Kayıtları:**

| ReferenceID | MenuType (1-15; 11 rezerve) | ParentMenu | TitleKey |
|--------------|-------------------------------|-------------|-----------|
| {{REF_1}} | {{TIP_1}} | 0/1 | {{KEY_1}} |

> MenuType 11 rezerve / kullanım dışı; common-rules [C5] MenuType listesi.

---

##### 4.1.Y.5. Erişim Noktaları

| Erişim Tipi | MenuType | Kaynağı | Açıklama |
|---------------|----------|---------|----------|
| Ana Menü | — | MobileMenu | {{ACK_1}} |
| Pano | 1 | MobileMenuMapping | {{ACK_2}} |
| Mandatory | 2 | MobileMenuMapping | {{ACK_3}} |
| 3D Touch (Kısayol) | 9 | MobileMenuMapping | {{ACK_4}} |
| Spotlight (iOS) | 10 | MobileMenuMapping | {{ACK_5}} |
| NBT Sık Kullanılan | 12 | MobileMenuMapping | {{ACK_6}} |
| Pega Sık Kullanılan | 13 | MobileMenuMapping | {{ACK_7}} |
| Hızlı Erişim Panosu | 14 | MobileMenuMapping | {{ACK_8}} |
| Başvuru Merkezi | 15 | MobileMenuMapping | {{ACK_9}} |
| Deep Link | — | Configuration JSON | {{ACK_10}} |

---

##### 4.1.Y.6. SMS / PN Bildirimleri

> **Müşteri Bilgilendirme Sistemi:** SMG Wiki (Confluence pageId: 8815310)
> **SMS Queue OID:** 9600010000000116 | **PN Refresh:** NOTIFICATION_PN_TEMPLATE

| Form Code | Tip (SMS / PN) | Tetiklenme | Şablon (ResourceKey) | İçerik Özeti |
|-----------|------------------|-------------|------------------------|----------------|
| {{KOD_1}} | {{TIP_1}} | {{KOSUL_1}} | {{KEY_1}} | {{ICERIK_1}} |

**Bildirim İşleyişi:** {{BILDIRIM_PARAGRAFI}}

---

##### 4.1.Y.7. E-Mail Bilgilendirmeleri

> Etkisi yoksa: "E-Mail bilgilendirme gereksinimi bulunmamaktadır."

| Şablon ResourceKey | Tetiklenme | Attachment | Content Repository |
|------------------------|-------------|-------------|----------------------|
| {{KEY}} | {{KOSUL}} | {{ATT}} | {{REPO}} |

> SMG Queue OID Email: 9600010000000070 / NOTIFICATION_EMAIL_TEMPLATE refresh.

---

##### 4.1.Y.8. Memo / Ekstre Mesajları

> Etkisi yoksa: "Memo / ekstre mesajı gereksinimi bulunmamaktadır."

| Mesaj Tipi | İçerik (ResourceKey) | Hesap / Kart | Tetiklenme |
|-------------|--------------------------|----------------|-------------|
| {{TIP}} | {{KEY}} | {{HESAP/KART}} | {{KOSUL}} |

---

##### 4.1.Y.9. Uyarı / Hata Mesajları

| Validation FilterKey | FilterValue | FilterOperation | ActionType (0/1/2) | ActionMessage ResourceKey | Davranış |
|------------------------|--------------|--------------------|----------------------|------------------------------|------------|
| {{KEY}} | {{VAL}} | equal / greaterThanEqual / lessThanEqual | 0 | {{MSG_KEY}} | Menüyü gizle |

> ActionType: 0 = Menüyü gizle; 1 = Akışı kes + popup göster; 2 = Popup göster + sayfaya yönlendir.

---

##### 4.1.Y.10. Servisler (MCS)

> Bu bölüm common-rules [C17] 5 adımlı MCS analiz yöntemiyle doldurulur: VpTransactionConfig (10 kanalı kontrol + fallback) → VpHostCallMappingDetail (parametre listesi) → mwbackend semantic-search (alan kullanımı) → çağrı zinciri inferansı.

**Servis İş Mantığı (paragraf):**

{{SERVIS_IS_MANTIGI_PARAGRAFI}}

**Tablo A — Servis Tanım Durumu (TransactionName başına):**

| Alan | Değer | Kaynak |
|------|-------|--------|
| TransactionName | `{{TXN}}` | VpTransaction |
| ChannelID = 10 tanımlı mı? | {{Evet / Hayır — Hayır ise hangi kanaldan input/output alındı}} | VpTransactionConfig |
| RequestType | `VeriBranch.Common.MessageDefinitions.{{TXN}}Request` | XML Config |
| ResponseType | `VeriBranch.Common.MessageDefinitions.{{TXN}}Response` | XML Config |
| HostProcessCode | `{{KOD}}` | VpTransactionAttributes |
| IsFinancial | {{0/1}} | VpTransaction |

**Tablo B — Input / Output Alanları (VpHostCallMappingDetail + mwbackend kullanım):**

| Yön | Alan Adı | Tip | Zorunlu | mwbackend Kullanım Yeri |
|------|-----------|-----|----------|----------------------------|
| IN | {{ALAN_IN_1}} | {{TIP}} | E/H | `mwbackend/Application/{{Yol}}` | {{Handler/UseCase}} |
| IN | {{ALAN_IN_2}} | {{TIP}} | E/H | {{KULLANIM}} |
| OUT | {{ALAN_OUT_1}} | {{TIP}} | — | Mapping → DTO clienta dönüyor |
| OUT | {{ALAN_OUT_2}} | {{TIP}} | — | Helper {{Method}} ile işleniyor |

**Tablo C — Çağrı Zinciri (Aynı Akışta Tetiklenen MCS'ler):**

| Sıra | TransactionName | UseCase / Handler | Karar Koşulu |
|------|------------------|---------------------|---------------|
| 1 | {{TXN_1}} | {{KAYNAK}} | Her zaman |
| 2 | {{TXN_2}} | {{KAYNAK}} | {{IF_KOSULU}} |
| 3 | {{TXN_3}} | {{KAYNAK}} | {{ShortFlow / LongFlow}} |

**MCS TransactionName Özet Listesi:**

| # | Türkçe Servis Adı | Transaction Name | Ne Yapıyor | Giriş Özü | Çıkış Özü |
|---|---------------------|--------------------|-------------|------------|------------|
| 1 | {{TR_AD_1}} | {{TXN_1}} | {{NE_1}} | {{IN_1}} | {{OUT_1}} |

**Host Mapping (VpVeriBranchHostCallMappingView + VpHostCallMappingDetail):**

{{MAPPING_PARAGRAFI}}

**Backend İş Mantığı (mwbackend DDD — Application + Domain):**

> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `mwbackend/Application/{{Domain}}/UseCase/{{Dosya}}.cs` | {{HANDLER_ADI}}
> `mwbackend/Domain/{{Domain}}/Service/{{Dosya}}.cs` | TransactionNameConstants.{{TXN}}
> `MCSVeribranchBI/{{Servis}}/{{Dosya}}.cs` | {{MCS_CALL}}

---

##### 4.1.Y.11. Etki Analizi (Mevcut Etki Noktaları)

> AS-IS özelinde bu başlık: bu işlevin **bugünkü çevresel etki noktaları**. Yeni etki değil — mevcut durumda hangi modül, log, MCS, menü, resource ile etkileşimde olduğunun fotoğrafı.

| Etki Türü | Mevcut Etki Var Mı? | Açıklama |
|------------|-----------------------|----------|
| MCS bağımlılığı | {{E/H}} | Bu işlev şu MCS'leri çağırıyor: {{LISTE}} |
| Loglama (TrackMobileEvent, EDW, Dataroid, Adjust, SAS) | {{E/H}} | {{LOG_LISTESI}} |
| Resource bağımlılığı (VpStringResource) | {{E/H}} | {{KEY_LISTESI}} |
| Menü bağımlılığı (MobileMenu / Mapping) | {{E/H}} | {{ID_LISTESI}} |
| Generic component kullanımı | {{E/H}} | {{COMPONENT_LISTESI}} ve etkilenen yer sayısı |
| Pilot / Versiyon bağımlılığı | {{E/H}} | PilotKey={{KEY}}, MinBuild={{NO}} |
| Müşteri bilgilendirme (SMS / PN / Email) | {{E/H}} | {{FORM_LISTESI}} |
| Dil (tr-TR, en-US, ar-SA) | {{E/H}} | {{KARSILAMA_DURUMU}} |

---

## 5. Kısıtlamalar ve Belirsizlikler

### 5.1. Belirsizlik Seviyesi Göstergeleri

- **[DOGRULANDI]** — Kod tabanından veya DB'den doğrulanmış bilgi
- **[KISMI]** — Kısmen doğrulanmış bilgi
- **[BELIRSIZ]** — Bulunamadı, kullanıcıya soruldu

### 5.2. Kısıtlamalar ve Bilinmeyen Alanlar

1. **[BELIRSIZ]** {{KISITLAMA_1}}
2. **[KISMI]** {{KISITLAMA_2}}
3. **[BELIRSIZ]** {{KISITLAMA_3}}

---

## Metodoloji ve Araştırma Kaynakları

### Araştırma Kaynakları

Bu Mobile AS-IS analiz dokümanı aşağıdaki kaynaklardan derlenmiştir:

1. **Semantic Search (scopeProject = mobilebanking):**
   - Tur A — `query: "{kapsam} UseCase Handler"`, `extensionFilter: [".cs"]`
   - Tur B — `query: "TransactionNameConstants {konu}"`, `[".cs"]`
   - Tur C — Helper/iş kuralı dar arama
   - Tur D — `query: "I{Service} implementation Execute Fetch"`, `[".cs"]`
   - Tur E — Client (.swift / .kt / .java) sınırlı tek tur

2. **mcp-mssql-db-operations (ChannelID = 10):**
   - CommonDb: MobileMenu, MobileMenuMapping, VpStringResource, VpTransaction, VpTransactionConfig, VpTransactionAttributes, VpVeriBranchHostCallMappingView, VpHostCallMappingDetail
   - MobileDefaultLog: VpMobileContact, VpMobileContactHistory, VpDefaultLog, VpExceptionLog, VpTransactionHistoryLog

3. **mcp-figma:** {{FIGMA_LINK_VEYA_YOK}}

4. **Confluence (mcp-atlassian — opsiyonel):**
   - MADDE 13 BDDK Tebliği (pageId: 52235469)
   - SMG Wiki (pageId: 8815310)
   - {{EKLENEN_SAYFA_REFLERI}}

5. **Kullanıcıdan Alınan Açık Soru Cevapları (questions.md kategorileri):** {{LISTE}}

### Kod Referans Formatı

Bu AS-IS dokümanına kod bloğu (triple backtick ile sarılı kod) **EKLENMEMİŞTİR**. Tüm referanslar aşağıdaki formattadır:

> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}

---

## Değişiklik Geçmişi

| Tarih | Versiyon | Değişiklik |
|-------|----------|------------|
| {{TARIH}} | {{VERSIYON}} | İlk versiyon |

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

**Karar Matrisi (Mobil — 9 Başlık, Batch Çıkarıldı):**

| Analiz Edilecek Başlıklar | Evet / Hayır | Index | Başlık |
|---------------------------|--------------|-------|--------|
| Ekran Tasarımı (Figma + iOS/Android) | {{E/H}} | 4.1.Y.1 | Ekran Tasarımı |
| Menü Tanımları (MobileMenu / Mapping) | {{E/H}} | 4.1.Y.2 | Menü Tanımları |
| Servisler (MCS / Transaction) | {{E/H}} | 4.1.Y.3 | Servisler |
| Erişim Noktaları (Pano, NBT, 3D Touch, Spotlight, Deep Link) | {{E/H}} | 4.1.Y.4 | Erişim Noktaları |
| Resource / CMS İçeriği (VpStringResource) | {{E/H}} | 4.1.Y.5 | Resource / CMS |
| SMS / PN Bildirimleri | {{E/H}} | 4.1.Y.6 | SMS / PN Bildirimleri |
| Loglama (TrackMobileEvent, EDW, Dataroid, Adjust, SAS) | {{E/H}} | 4.1.Y.7 | Loglama |
| Pilot / Versiyon / Force Update | {{E/H}} | 4.1.Y.8 | Pilot / Versiyon |
| Uyarı / Hata Mesajları (Validation, ActionType) | {{E/H}} | 4.1.Y.9 | Uyarı / Hata |

> **Not:** Sadece "Evet" işaretlenen başlıklar aşağıda ardışık olarak detaylandırılır.

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
> **Kaynak:** `mobilebanking-ios/{{YOL}}` | {{VC_ADI}}, `mobilebanking-android/{{YOL}}` | {{ACTIVITY_ADI}}

---

##### 4.1.Y.2. Menü Tanımları

**MobileMenu Kayıtları (CommonDb.MobileMenu, ChannelID = 10):**

| MenuID | ParentID | Title (ResourceKey) | TransactionName | EnabledTR | EnabledEN | AllUser (1/2/3) | MenuType (Mapping) |
|--------|----------|------------------------|--------------------|-----------|-----------|-------------------|------------------------|
| {{ID_1}} | {{PID_1}} | {{KEY_1}} | {{TXN_1}} | 1 | 1 | 1 | — |

**Configuration JSON Özeti:**

{{CONFIG_OZETI_PARAGRAFI}}

**Validation Kuralları (ClientValidationList — AND/OR):**

{{VALIDATION_OZETI_PARAGRAFI}}

**MobileMenuMapping Kayıtları:**

| ReferenceID | MenuType (1-15) | ParentMenu | TitleKey |
|--------------|-------------------|-------------|-----------|
| {{REF_1}} | {{TIP_1}} | 0/1 | {{KEY_1}} |

---

##### 4.1.Y.3. Servisler (MCS)

**Servis İş Mantığı (paragraf):**

{{SERVIS_IS_MANTIGI_PARAGRAFI}}

**MCS TransactionName Listesi:**

| # | Türkçe Servis Adı | Transaction Name | Ne Yapıyor | Giriş Özü | Çıkış Özü |
|---|---------------------|--------------------|-------------|------------|------------|
| 1 | {{TR_AD_1}} | {{TXN_1}} | {{NE_1}} | {{IN_1}} | {{OUT_1}} |

**Host Mapping (VpVeriBranchHostCallMappingView + VpHostCallMappingDetail):**

{{MAPPING_PARAGRAFI}}

**Backend İş Mantığı (mwbackend DDD):**

> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `mwbackend/Application/{{Domain}}/UseCase/{{Dosya}}.cs` | {{HANDLER_ADI}}
> `mwbackend/Domain/{{Domain}}/Service/{{Dosya}}.cs` | TransactionNameConstants.{{TXN}}

---

##### 4.1.Y.4. Erişim Noktaları

| Erişim Tipi | MenuType | Kaynağı | Açıklama |
|---------------|----------|---------|----------|
| Ana Menü | — | MobileMenu | {{ACK_1}} |
| Pano | 1 | MobileMenuMapping | {{ACK_2}} |
| Mandatory | 2 | MobileMenuMapping | {{ACK_3}} |
| 3D Touch | 9 | MobileMenuMapping | {{ACK_4}} |
| Spotlight (iOS) | 10 | MobileMenuMapping | {{ACK_5}} |
| NBT Sık Kullanılan | 12 | MobileMenuMapping | {{ACK_6}} |
| Pega Sık Kullanılan | 13 | MobileMenuMapping | {{ACK_7}} |
| Hızlı Erişim Panosu | 14 | MobileMenuMapping | {{ACK_8}} |
| Başvuru Merkezi | 15 | MobileMenuMapping | {{ACK_9}} |
| Deep Link | — | Configuration JSON | {{ACK_10}} |

---

##### 4.1.Y.5. Resource / CMS İçeriği

**VpStringResource Kayıtları (ChannelID = 10, 3 Dil):**

| ResourceType | ResourceKey | tr-TR | en-US | ar-SA |
|---------------|--------------|--------|--------|--------|
| MobileMenu | {{KEY_1}} | {{TR_1}} | {{EN_1}} | {{AR_1}} |
| GeneralResource | {{KEY_2}} | {{TR_2}} | {{EN_2}} | {{AR_2}} |
| DigitalConfirmTemplate{{ID}} | {{KEY_3}} | {{TR_3}} | {{EN_3}} | {{AR_3}} |

**CMS Drop-down İçeriği:**

{{CMS_PARAGRAFI}}

---

##### 4.1.Y.6. SMS / PN Bildirimleri

> **Müşteri Bilgilendirme Sistemi:** SMG Wiki (Confluence pageId: 8815310)
> **SMS Queue OID:** 9600010000000116 | **PN Refresh:** NOTIFICATION_PN_TEMPLATE

| Form Code | Tip (SMS / PN) | Tetiklenme | Şablon (ResourceKey) | İçerik Özeti |
|-----------|------------------|-------------|------------------------|----------------|
| {{KOD_1}} | {{TIP_1}} | {{KOSUL_1}} | {{KEY_1}} | {{ICERIK_1}} |

**Bildirim İşleyişi:** {{BILDIRIM_PARAGRAFI}}

---

##### 4.1.Y.7. Loglama

| Loglama Tipi | Tablo / Sistem | Tetiklenme | Alanlar |
|---------------|------------------|-------------|---------|
| Oturum log | VpMobileContact (MobileDefaultLog) | Login | ContactID, SessionID, DeviceName, OSVersion, IsRoot, IsEmulator, CreateDate |
| İşlem geçmişi | VpMobileContactHistory | Her işlem | ContactHistoryID, TransactionName, Amount, Duration, TransactionResult |
| Detaylı log | VpDefaultLog | Her işlem | TxnUniqueID, XmlInputData, XmlOutputData, ErrorData, MethodType |
| Hata log | VpExceptionLog | Exception | ErrorType, Message, StackTrace, IsCritical |
| Özet log | VpTransactionHistoryLog | Her işlem | IsSuccess, CoreExceptionID |
| Mobil event | TrackMobileEvent | UI / iş aksiyonu | {{EVENT_LISTESI}} |
| Dataroid | Dataroid SDK | UI / iş aksiyonu | {{EVENT_LISTESI}} |
| Adjust | Adjust SDK | Attribution / dönüşüm | {{EVENT_LISTESI}} |
| SAS | SAS Fraud log | Fraud kuralları | {{ATTRIBUTE_LISTESI}} |

---

##### 4.1.Y.8. Pilot / Versiyon

| PilotKey | ReversePilot | MinBuildNumber iOS | MinBuildNumber Android | MaxBuildNumber | ForceUpdate |
|-----------|---------------|----------------------|---------------------------|------------------|---------------|
| {{KEY_1}} | true / false | {{IOS_BUILD}} | {{ANDROID_BUILD}} | {{MAX}} | {{FU}} |

---

##### 4.1.Y.9. Uyarı / Hata Mesajları

| Validation FilterKey | FilterValue | FilterOperation | ActionType (0/1/2) | ActionMessage ResourceKey | Davranış |
|------------------------|--------------|--------------------|----------------------|------------------------------|------------|
| {{KEY_1}} | {{VAL_1}} | equal / greaterThanEqual / lessThanEqual | 0 | {{MSG_KEY_1}} | Menüyü gizle |

> ActionType: 0 = Menüyü gizle; 1 = Akışı kes + popup göster; 2 = Popup göster + sayfaya yönlendir.

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

---
description:
globs:
alwaysApply: true
---
# 🧠 Mobile Menu Rule Documentation

## 🚨 **GENEL ChannelID Kuralları - TÜM TABLOLAR İÇİN ZORUNLU**

### **⚠️ KRİTİK KURAL: ChannelID Filtreleme (GLOBAL)**
- **TÜM veritabanlarında ve tablolarda** `ChannelID` filtresi **ZORUNLUDUR**
- **Kullanıcı belirli bir ChannelID belirtirse** → O değeri kullan
- **Kullanıcı ChannelID belirtmezse** → `ChannelID = 10` (Mobil kanal) varsayılan olarak kullan
- **ASLA ChannelID filtresi olmadan sorgu yapma!**
- **Bu kural şu tablolar için geçerlidir:**
 - **CommonDb**: VpStringResource, MobileMenu, MobileMenuMapping
 - **MobileDefaultLog**: VpExceptionLog, VpDefaultLog, VpMobileContact, VpMobileContactHistory, VpTransactionHistoryLog
 - **Diğer tüm tablolar**: ChannelID alanı bulunan her tablo

### **📋 ChannelID Değerleri (GLOBAL):**
- **10**: Mobil Kanal (varsayılan)
- **20**: Web Kanal
- **30**: Çağrı Merkezi
- **40**: ATM
- **50**: Şube

### **✅ Doğru Kullanım Örnekleri (GLOBAL):**
```sql
-- Kullanıcı ChannelID belirtmediğinde
WHERE [DateField] >= DATEADD(HOUR, -12, GETDATE()) AND ChannelID = 10

-- Kullanıcı belirli ChannelID istediğinde
WHERE [DateField] >= DATEADD(HOUR, -12, GETDATE()) AND ChannelID = 20

-- VpStringResource için
WHERE ResourceKey = 'SomeKey' AND ChannelID = 10

-- MobileMenu için
WHERE MenuID = 123 AND ChannelID = 10

-- Tüm sorgularda ChannelID filtresi zorunlu!
```

### **❌ Yanlış Kullanım (GLOBAL):**
```sql
-- ASLA BU ŞEKİLDE YAPMA!
WHERE [DateField] >= DATEADD(HOUR, -12, GETDATE())
-- ChannelID filtresi eksik!

-- VpStringResource'da da ASLA böyle yapma!
WHERE ResourceKey = 'SomeKey'
-- ChannelID filtresi eksik!
```

### **🎯 Özel ChannelID Kuralları:**
- **VpStringResource**: ChannelID=10 (Mobil) sabit, tüm sorgularda zorunlu
- **MobileMenu**: ChannelID=10 (Mobil) sabit, tüm sorgularda zorunlu
- **MobileMenuMapping**: ChannelID=10 (Mobil) sabit, tüm sorgularda zorunlu
- **Log tabloları**: Kullanıcının belirttiği veya varsayılan ChannelID kullan

---

## 📁 Tablolar ve Konseptler

### 📌 MobileMenu
Mobil client'lara gösterilen ana menü öğeleri burada tutulur.
- Her kayıt, menünün bireysel bir item'ıdır
- Parent-Child ilişkileri ile menü ağacı kurulur
- **⚠️ ChannelID = 10 zorunlu**

### 📌 MobileMenuMapping
Ana menü harici tüm pano, NBT, 3D Touch, Spotlight, Pega vs. gibi setlerin tutulduğu mapping tablosudur.
- **⚠️ ChannelID = 10 zorunlu**

---

## 🧩 Menü Ekleme Kuralları

### 🔸 Parent Menü
- `IsMenuStep`: 1
- `IsMenuRoot`: 0
- `ParentID` = `MenuID`
- `ClassName`/`Keyword` girilmez
- `checknavi`: 0
- **⚠️ ChannelID = 10 zorunlu**

### 🔸 Child Menü (Sayfa açmayan)
- `ClassName`/`Keyword` girilmez
- `checknavi`: 0
- **⚠️ ChannelID = 10 zorunlu**

### 🔸 Child Menü (Sayfa açan)
- `TransactionName` zorunludur
- `ClassName`, `StoryboardName`, `ViewControllerId`, `Bundle` girilir
- `checknavi`: 1
- **⚠️ ChannelID = 10 zorunlu**

---

## 🧾 MobileMenu Kolon Kuralları

| Kolon Adı | Açıklama |
|-----------|----------|
| `ParentID` | Menü kırılımı, parent ile ilişkili |
| `MenuID` | Menüye özel benzersiz ID |
| `Title` | VpStringResource içindeki MobileMenu ResourceKey'i |
| `TransactionName` | Sayfaya yönlendirme/log için kullanılır |
| `DescriptionName` | TR açıklama (Client'a gitmez) |
| `EnabledTR`/`EnabledEN` | 1 → göster, 0 → gösterme |
| `IsMenuRoot` | İlk kırılım dışı: 1 |
| `AllUser` | 1: hepsi, 2: bireysel, 3: tüzel |
| `Keywords` | Arama kelimeleri, sadece uç menüler için |
| `MenuAdress` | Breadcrumb olarak kullanılır |
| `SearchOrderIndex` | Search sırası |
| `Configuration` | JSON, platform bazlı config |
| `Validation` | JSON, kurallar dizisi |
| `CorporateOrder` | Tüzel kullanıcı menü sıralamaları |
| **`ChannelID`** | **Kanal ID (10: mobil) - ZORUNLU FİLTRE** |

---

## ⚙️ Configuration Yapısı (JSON)

```json
{
 "AndroidMenuItem": {
   "MenuVisible": "1",
   "LightLoginEnable": "1",
   "MinBuildNumber": "259",
   "MaxBuildNumber": "300",
   "MenuStatus": "1",
   "ClassName": "com.bank.app.FeatureActivity",
   "PilotKey": "SomePilotKey",
   "ReversePilot": false
 },
 "IosMenuItem": {
   "MenuVisible": "1",
   "LightLoginEnable": "1",
   "MinBuildNumber": "207",
   "StoryboardName": "FeatureStoryboard",
   "ViewControllerId": "FeatureVC",
   "ClassName": "FeatureVC",
   "Bundle": "FeatureModule",
   "PilotKey": "SomePilotKey",
   "ReversePilot": false
 },
 "HuaweiMenuItem": {
   "MinBuildNumber": "259",
   "MaxBuildNumber": "300",
   "ClassName": "com.bank.app.HuaweiFeatureActivity"
 }
}
```

---

## ✅ Validation Yapısı (JSON)

```json
{
 "ClientValidationList": [
   {
     "Rule": [
       {
         "FilterKey": "IsAvailableDigitalConfirm",
         "FilterValue": "1",
         "FilterOperation": "equal",
         "ActionType": "0",
         "ActionMessage": "",
         "ActionResultType": ""
       }
     ]
   }
 ]
}
```

### 🎯 ActionType Açıklamaları

| ActionType | Açıklama |
|------------|----------|
| 0 | Menüyü gizle |
| 1 | Menüye tıklandığında akışı kes, popup göster |
| 2 | Menüye tıklandığında popup göster ama sayfaya yönlen |

---

## 🧮 Validasyon Kuralları

- **AND**: Aynı rule içindeki koşullar
- **OR**: Farklı rule objeleri arası

### Örnek: Versiyon kontrolü + Pilot
```json
{
 "ClientValidationList": [
   {
     "Rule": [
       {
         "FilterKey": "BuildNoAndroid",
         "FilterValue": "260",
         "FilterOperation": "greaterThanEqual",
         "ActionType": "0"
       },
       {
         "FilterKey": "IsPaymentPilot",
         "FilterValue": "1",
         "FilterOperation": "equal",
         "ActionType": "0"
       }
     ]
   }
 ]
}
```

---

## 📦 Mapping Kuralları (MobileMenuMapping)

| Alan | Anlamı |
|------|--------|
| `ReferenceID` | Pano ID, Menü tipi ID'si |
| `MenuID` | Eklenen menü ID'si |
| `MenuType` | 1: Board, 2: Mandatory, 15: Başvuru Merkezi vs. |
| `ParentMenu` | Parent mı? (1: evet) |
| `Validation` | Mapping özel kural varsa buraya |
| `TitleKey` | ResourceKey - Title için |
| **`ChannelID`** | **Kanal ID (10: mobil) - ZORUNLU FİLTRE** |

---

## 🧪 TransactionName Gerekliliği

- Uç menülerde zorunludur
- Tanımlandığında 3 tabloya insert edilir:
 - `VpTransaction`
 - `VpTransactionConfig`
 - `VpTransactionAttributes`
- **⚠️ Tüm bu tablolarda da ChannelID = 10 zorunlu**

---

## 📊 Menü Tipleri (MenuType)

| Tip | Açıklama |
|-----|----------|
| 1 | Board |
| 2 | Mandatory |
| 3 | Default Analytics |
| 4 | Analytic Suggestion |
| 5 | Pega Suggestion |
| 6 | Default Pega |
| 7 | Tüm İşlemler Butonu |
| 8 | Tüm İşlemler Sheet |
| 9 | Kısayollar (3D Touch) |
| 10 | Spotlight Search (iOS Only) |
| 12 | NBT Sık Kullanılanlar |
| 13 | Pega Sık Kullanılanlar |
| 14 | Hızlı Erişim Panosu |
| 15 | Başvuru Merkezi |

---

## 🏗 Kullanıcı Tipine Göre Sıralama (CorporateOrder)

```json
{
 "MenuOrder": [
   { "type": "Corporate", "order": "2" },
   { "type": "FIB", "order": "1" },
   { "type": "MicroEnterprice", "order": "3" }
 ]
}
```

---

## 🧩 Ek Özellikler

- **LogTaskCodeValueObject**: Menü bazlı log'lama kodları
- **BundleObject**: Sayfaya parametre geçişi
- **PickerConfiguration**: Hesap/Kart seçimi, mesajlar vs.
- **IsEnabledUnder18Age**: 18 yaş altı kullanıcı için görünürlük kontrolü
- **⚠️ Tüm bu özelliklerde de ChannelID = 10 zorunlu**

---

## 💾 CommonDb MCP Kullanımı

Bu dokümantasyon CommonDb üzerinde MCP kullanarak menü işlemleri yapılırken referans olarak kullanılacaktır.

### Önemli Notlar:
- Menü eklerken yukarıdaki kuralları takip edin
- JSON yapılarını doğru formatta kullanın
- Validation kurallarını test edin
- TransactionName gerekliliğini kontrol edin
- Platform özelliklerini göz önünde bulundurun
- **⚠️ HER ZAMAN ChannelID = 10 filtresi kullan**

---

# 📊 MobileDefaultLog Veritabanı - Tablo ve Alan Rehberi

Bu rehber, MobileDefaultLog veritabanındaki tabloların hangi amaçla kullanılacağını ve hangi alanlara bakılacağını açıklar.

---

## 🏗️ **Veritabanı: MobileDefaultLog**

### **📱 VpMobileContact (Ana Oturum Tablosu)**
**📌 Ne İçin Kullanılır:**
- Kullanıcı oturum başlangıç bilgileri
- Device bilgileri ve güvenlik kontrolleri
- Session süreleri analizi

**🔍 Önemli Alanlar:**
- `ContactID` (36 char) - Primary Key, diğer tablolarla ilişki
- `SessionID` (36 char) - Oturum takibi için
- `CustomerUserCode` - Müşteri koduna göre filtreleme
- `DeviceName`, `OSVersion`, `Build` - Platform analizi için
- `IsRoot`, `IsEmulator` - Güvenlik risk değerlendirmesi
- `CreateDate`, `LogoutTime` - Oturum süresi hesaplaması
- `IPAddress`, `ClientIP` - Güvenlik ve lokasyon analizi
- **`ChannelID` - ZORUNLU FİLTRE (Global Kural Geçerli)**

**💡 Kullanım Senaryoları:**
- SessionID ile kullanıcı bilgilerini getirme
- Platform (iOS/Android) dağılım analizi
- Root/Emulator cihaz tespiti
- Günlük aktif kullanıcı sayısı

---

### **📈 VpMobileContactHistory (İşlem Geçmişi)**
**📌 Ne İçin Kullanılır:**
- Her kullanıcının yaptığı işlemlerin özet bilgileri
- İşlem başarı/başarısızlık oranları
- İşlem süreleri ve performans analizi

**🔍 Önemli Alanlar:**
- `MobileContactID` → VpMobileContact.ContactID ile bağlantı
- `ContactHistoryID` (36 char) - İşlem takibi için
- `TransactionName`, `MainTransactionName` - İşlem tipleri
- `Amount`, `Commission`, `FxCode` - Mali işlem bilgileri
- `StartTime`, `EndTime`, `Duration` - Performans analizi
- `TransactionResult` (1/0) - Başarı durumu
- `InsertDate` - Tarih bazlı filtreleme
- **`ChannelID` - ZORUNLU FİLTRE (Global Kural Geçerli)**

**💡 Kullanım Senaryoları:**
- En popüler işlemleri bulma
- İşlem başarı oranları hesaplama
- Yavaş işlemleri tespit etme
- Mali işlem hacmi analizi

---

### **🗂️ VpDefaultLog (Detaylı İşlem Logları)**
**📌 Ne İçin Kullanılır:**
- İşlemlerin en detaylı log kayıtları
- Input/Output verilerinin incelenmesi
- Hata detaylarının analizi

**🔍 Önemli Alanlar:**
- `ContactID` → VpMobileContact.ContactID
- `ContactHistoryID` → VpMobileContactHistory.ContactHistoryID
- `TransactionID`, `TxnUniqueID` - İşlem takibi
- `SessionID`, `CoreSessionID` - Oturum bağlantısı
- `TransactionNameDetailed` - Detaylı işlem adı
- `TransactionTime` - Tarih bazlı analiz
- `TransactionResult` - Başarı durumu
- `XmlInputData`, `XmlOutputData` - İşlem detayları
- `ErrorData`, `ResponseData` - Hata ve yanıt analizi
- `MethodType` - İşlem tipi (1:Start, 3:Execute, 4:Fetch)
- `Amount`, `FxCode` - Mali bilgiler
- **`ChannelID` - ZORUNLU FİLTRE (Global Kural Geçerli)**

**💡 Kullanım Senaryoları:**
- Belirli bir TxnUniqueID'nin detaylı analizi
- Hata mesajlarının incelenmesi
- İşlem input/output verilerinin analizi
- Core sistem ile entegrasyon problemleri

---

### **🚨 VpExceptionLog (Hata Kayıtları)**
**📌 Ne İçin Kullanılır:**
- Sistem hatalarının detaylı kayıtları
- Hata trendlerinin analizi
- Problem giderme süreçleri

**🔍 Önemli Alanlar:**
- `SessionID`, `TxnUniqueID` - Diğer tablolarla bağlantı
- `ErrorType` - Hata kategorisi
- `Message`, `Exception` - Hata detayları
- `StackTrace` - Teknik hata detayı
- `TransactionName`, `ExecutingTransactionName` - Hangi işlemde hata
- `ExceptionDate` - Tarih bazlı analiz
- **`ChannelID` - ZORUNLU FİLTRE (Global Kural Geçerli)**
- `ClientIP`, `ServerName` - Teknik bilgiler
- `IsCritical` - Kritik hata flagı

**💡 Kullanım Senaryoları:**
- Son 24 saatteki en sık hatalar
- Platform bazlı hata analizi
- Kritik hataların işlem etkisi
- Hata hotspot analizi

---

### **📊 VpTransactionHistoryLog (İşlem Özet Geçmişi)**
**📌 Ne İçin Kullanılır:**
- İşlem özetlerinin hafif kayıtları
- Hızlı başarı/başarısızlık kontrolü
- Genel istatistikler

**🔍 Önemli Alanlar:**
- `TxnUniqueID`, `SessionID` - Bağlantı anahtarları
- `CustomerUserCode`, `ChannelID` - Kullanıcı ve kanal
- `IsSuccess` (1/0) - İşlem sonucu
- `CoreExceptionID` - Hata referansı
- `Date` - Tarih bazlı filtreleme
- `TransactionName` - İşlem tipi
- **`ChannelID` - ZORUNLU FİLTRE (Global Kural Geçerli)**

**💡 Kullanım Senaryoları:**
- Hızlı başarı oranı hesaplama
- Günlük işlem sayıları
- Channel bazlı analiz

---

## 🔗 **Tablo İlişkileri**

```
VpMobileContact (ContactID, SessionID)
   ↓ (ContactID = MobileContactID)
VpMobileContactHistory (ContactHistoryID)
   ↓ (ContactHistoryID)
VpDefaultLog (TxnUniqueID, SessionID)
   ↓ (TxnUniqueID, SessionID)
VpExceptionLog & VpTransactionHistoryLog
```

---

## 🎯 **Analiz Senaryoları ve Hangi Tabloya Bakılacağı**

### **📊 SessionID Analizi**
**Hedef:** Belirli bir session'ın tüm aktivitelerini görmek
**Kullanılacak Tablolar:**
1. `VpMobileContact` - Kullanıcı ve device bilgileri
2. `VpMobileContactHistory` - Yapılan işlemler
3. `VpDefaultLog` - Detaylı işlem logları
4. `VpExceptionLog` - Hatalar (varsa)

**⚠️ TÜM SORGULARDA GLOBAL ChannelID KURALI GEÇERLİ!**

### **🚨 Hata Analizi**
**Hedef:** Sistem hatalarını analiz etmek
**Ana Tablo:** `VpExceptionLog`
**Bağlantı Tabloları:**
- `VpMobileContact` - Platform bilgileri için
- `VpDefaultLog` - İşlem detayları için

**⚠️ TÜM SORGULARDA GLOBAL ChannelID KURALI GEÇERLİ!**

### **📈 Performans Analizi**
**Hedef:** Yavaş işlemleri tespit etmek
**Ana Tablo:** `VpMobileContactHistory`
**Bakılacak Alanlar:** `Duration`, `TransactionResult`
**Bağlantı:** `VpMobileContact` - Device bilgileri

**⚠️ TÜM SORGULARDA GLOBAL ChannelID KURALI GEÇERLİ!**

### **👤 Kullanıcı Analizi**
**Hedef:** Belirli kullanıcının davranış analizi
**Başlangıç:** `VpMobileContact.CustomerUserCode`
**Takip Tabloları:** Tüm tablolar bu bilgiyle bağlanabilir

**⚠️ TÜM SORGULARDA GLOBAL ChannelID KURALI GEÇERLİ!**

### **💰 Mali İşlem Analizi**
**Hedef:** Para transferi, ödeme vb. işlemler
**Ana Tablolar:** `VpMobileContactHistory`, `VpDefaultLog`
**Bakılacak Alanlar:** `Amount`, `FxCode`, `Commission`

**⚠️ TÜM SORGULARDA GLOBAL ChannelID KURALI GEÇERLİ!**

### **🕐 Zaman Bazlı Analiz**
**Hedef:** Saatlik, günlük trendler
**Tarih Alanları:**
- `VpMobileContact.CreateDate` - Session başlangıç
- `VpMobileContactHistory.StartTime` - İşlem başlangıç
- `VpDefaultLog.TransactionTime` - Detaylı işlem zamanı
- `VpExceptionLog.ExceptionDate` - Hata zamanı

**⚠️ TÜM SORGULARDA GLOBAL ChannelID KURALI GEÇERLİ!**

---

## ⚡ **Performans İpuçları**

### **🔍 Index'li Alanlar (Hızlı Sorgular İçin)**
- `VpMobileContact`: `CreateDate`, `ContactID`, `CustomerUserCode`, `SessionID`, `ChannelID`
- `VpMobileContactHistory`: `InsertDate`, `MobileContactID`, `ContactHistoryID`, `ChannelID`
- `VpDefaultLog`: `TransactionTime`, `SessionID`, `TxnUniqueID`, `ContactID`, `ChannelID`
- `VpExceptionLog`: `ExceptionDate`, `SessionID`, `TxnUniqueID`, `ChannelID`
- `VpTransactionHistoryLog`: `Date`, `CustomerUserCode`, `SessionID`, `ChannelID`

### **📅 Tarih Filtreleme Kuralları**
- Büyük veri setleri için tarih aralığını dar tutun
- `>= DATEADD(DAY, -7, GETDATE())` formatında kullanın
- `DATEDIFF` fonksiyonunu WHERE'de kullanmayın (index kullanmaz)
- **HER ZAMAN Global ChannelID kuralı ile birlikte kullan**

### **🎯 JOIN Optimizasyonu**
- En küçük veri setinden başlayın (genellikle VpMobileContact)
- LEFT JOIN kullanırken dikkatli olun
- DISTINCT kullanımını minimize edin
- **HER JOIN'de Global ChannelID kuralı kontrol edin**

---

## 💾 **MCP Kullanım Rehberi**

### **Veritabanı Bağlantısı:**
- **Database Name:** `MobileDefaultLog`
- **Tüm tablolar** bu veritabanında yer alır

### **Örnek MCP Çağrıları:**
```
mcp_mcp-mssql-db-operations_read_data:
- databaseName: "MobileDefaultLog"
- sql: [Your SQL query here with GLOBAL ChannelID filter]
```

### **🚨 GLOBAL ZORUNLU Filtreler:**
- **`WHERE ChannelID = 10`** (Kullanıcı belirtmediğinde varsayılan)
- **`WHERE ChannelID = {user_specified}`** (Kullanıcı belirttiğinde)
- `WHERE SessionID = 'your-session-id'`
- `WHERE CustomerUserCode = 'customer-code'`
- `WHERE CreateDate >= DATEADD(DAY, -1, GETDATE())`

### **✅ Doğru Örnek Sorgular:**
```sql
-- Hata analizi (varsayılan mobil kanal)
SELECT * FROM VpExceptionLog
WHERE ExceptionDate >= DATEADD(HOUR, -12, GETDATE())
AND ChannelID = 10

-- Kullanıcı web kanal istediğinde
SELECT * FROM VpExceptionLog
WHERE ExceptionDate >= DATEADD(HOUR, -12, GETDATE())
AND ChannelID = 20
```

---

# VpStringResource Çok Dilli Kayıt Ekleme Rehberi

## 📋 Genel Kurallar
- **Veritabanı:** CommonDb
- **Tablo:** VpStringResource
- **ChannelID:** 10 (Mobil kanal) - **GLOBAL KURAL GEÇERLİ**
- **UserId:** T65714 (Aktif kullanıcı)
- **Desteklenen Diller:** en-US, tr-TR, ar-SA
- **Status:** 1 (Aktif)
- **IsDeleted:** 0 (Silinmemiş)

## 🔍 Tablo Alanları
- `ResourceType` - Resource kategorisi (MobileMenu, GeneralResource, vb.)
- `CultureCode` - Dil kodu (en-US, tr-TR, ar-SA)
- `ResourceKey` - Benzersiz kaynak anahtarı
- `ResourceValue` - Görüntülenecek metin
- `Status` - Aktiflik durumu (1: aktif)
- `IsDeleted` - Silinme durumu (0: silinmemiş)
- **`ChannelID` - Kanal ID (10: mobil) - GLOBAL KURAL GEÇERLİ**
- `CreateBy` - Oluşturan kullanıcı

## 🎯 Kullanım Amaçları

### **1. MobileMenu Resource**
**Ne İçin:** Menü başlıkları ve açıklamaları
**ResourceType:** `MobileMenu`
**Örnek ResourceKey:** `PaymentMenuTitle`
**⚠️ ChannelID = 10 zorunlu**

### **2. GeneralResource**
**Ne İçin:** Genel uygulama metinleri
**ResourceType:** `GeneralResource`
**Örnek ResourceKey:** `SuccessMessage`
**⚠️ ChannelID = 10 zorunlu**

### **3. DigitalConfirmTemplate**
**Ne İçin:** Dijital onay mesajları
**ResourceType:** `DigitalConfirmTemplate180001005`
**Örnek ResourceKey:** `ConfirmationText`
**⚠️ ChannelID = 10 zorunlu**

## ⚠️ Önemli Kurallar
1. **ResourceKey** her ResourceType içinde benzersiz olmalı
2. **3 dil için de** kayıt eklenmeli (en-US, tr-TR, ar-SA)
3. **ChannelID = 10** sabit (Mobil kanal) - **GLOBAL KURAL**
4. **Status = 1** sabit (Aktif)
5. **IsDeleted = 0** sabit (Silinmemiş)
6. **TÜM sorgularda ChannelID filtresi ZORUNLU**

## 📝 SQL Template:

### English (en-US)
```sql
---Lang:en-US---
IF NOT EXISTS(Select * from vpStringResource where ResourceType='{ResourceType}' and CultureCode='en-US' and ResourceKey='{ResourceKey}' and ChannelID=10)
BEGIN
INSERT INTO vpStringResource(ResourceType,CultureCode,ResourceKey,ResourceValue,Status,IsDeleted,ChannelID,CreateBy)
VALUES
('{ResourceType}','en-US','{ResourceKey}','{ResourceValueEN}',1,0,10,'T65714')
END
```

### Türkçe (tr-TR)
```sql
---Lang:tr-TR---
IF NOT EXISTS(Select * from vpStringResource where ResourceType='{ResourceType}' and CultureCode='tr-TR' and ResourceKey='{ResourceKey}' and ChannelID=10)
BEGIN
INSERT INTO vpStringResource(ResourceType,CultureCode,ResourceKey,ResourceValue,Status,IsDeleted,ChannelID,CreateBy)
VALUES
('{ResourceType}','tr-TR','{ResourceKey}','{ResourceValueTR}',1,0,10,'T65714')
END
```

### Arapça (ar-SA)
```sql
---Lang:ar-SA---
IF NOT EXISTS(Select * from vpStringResource where ResourceType='{ResourceType}' and CultureCode='ar-SA' and ResourceKey='{ResourceKey}' and ChannelID=10)
BEGIN
INSERT INTO vpStringResource(ResourceType,CultureCode,ResourceKey,ResourceValue,Status,IsDeleted,ChannelID,CreateBy)
VALUES
('{ResourceType}','ar-SA','{ResourceKey}','{ResourceValueAR}',1,0,10,'T65714')
END
```

## 🔧 MCP Kullanımı
```
mcp_mcp-mssql-db-operations_update_data:
- databaseName: "CommonDb"
- sql: [INSERT INTO vpStringResource script - ChannelID=10 zorunlu]
```

## 📊 Kontrol Sorguları
### Eklenen kayıtları kontrol:
```sql
SELECT * FROM vpStringResource
WHERE ResourceKey = '{ResourceKey}'
AND ResourceType = '{ResourceType}'
AND ChannelID = 10  -- GLOBAL KURAL GEÇERLİ
ORDER BY CultureCode
```

### Eksik dilleri kontrol:
```sql
SELECT CultureCode FROM (VALUES ('en-US'), ('tr-TR'), ('ar-SA')) AS Langs(CultureCode)
WHERE CultureCode NOT IN (
   SELECT CultureCode FROM vpStringResource
   WHERE ResourceKey = '{ResourceKey}'
   AND ResourceType = '{ResourceType}'
   AND ChannelID = 10  -- GLOBAL KURAL GEÇERLİ
)
```

## 🎯 **Diğer ChannelID İçeren Tablolar:**

### **CommonDb Tabloları:**
- **VpStringResource** - ChannelID = 10 (Mobil) sabit
- **MobileMenu** - ChannelID = 10 (Mobil) sabit
- **MobileMenuMapping** - ChannelID = 10 (Mobil) sabit
- **VpTransaction** - ChannelID = 10 (Mobil) sabit
- **VpTransactionConfig** - ChannelID = 10 (Mobil) sabit
- **VpTransactionAttributes** - ChannelID = 10 (Mobil) sabit

### **Tüm Bu Tablolarda:**
- **GLOBAL ChannelID kuralı geçerlidir**
- **Kullanıcı belirtmediğinde ChannelID = 10 varsayılan**
- **Kullanıcı belirttiğinde o değer kullanılır**
- **ASLA ChannelID filtresi olmadan sorgu yapılmaz**

---

# 🔧 Transaction Tanımı ve MCS Servis Tanımı Rehberi

Bu rehber, kullanıcılar transaction tanımı veya MCS servis tanımı yapmak istediğinde takip edilecek kuralları içerir.

---

## 🎯 **Transaction/MCS Servis Tanımı Talepleri**

### **📝 Kullanıcı Talep Senaryoları:**
- **"Transaction tanımı yap"**
- **"MCS servis tanımı yap"**
- **"Servis tanımı oluştur"**
- **"Transaction ekle"**
- **"Yeni servis tanımla"**

### **🔍 Gerekli Bilgiler:**
Kullanıcıdan aşağıdaki bilgileri alın:
1. **Servis Adı (TransactionName)** - Örnek: "VbKrediKartiBilgileri"
2. **Servis Açıklaması (Description)** - Örnek: "Kredi Kartı Bilgileri Servisi"
3. **İsteğe bağlı:** Özel konfigürasyon gereksinimleri

---

## 📋 **Transaction Tanımı SQL Template**

### **🔧 Tam Tanım Template:**
```sql
-------------------------------------------------------{ServisAdi}--------------------------------------------------------
IF NOT EXISTS(Select * from VpTransaction where TransactionName= '{ServisAdi}' )
BEGIN
INSERT INTO [dbo].[VpTransaction](mdc:[TransactionName],[Description],[LastActionDate],[LastActionUser],[LastAction],[TransactionTypeId],[IsFinancial],[IsInquiry],[HostGroupType],[isCross],[isLead],[isVirtual],[IsInternetBankingTransaction],[IsTransactionBasedLoggingEnabled])
VALUES('{ServisAdi}','{ServisAciklamasi}',getDate(),'T65714',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL)
END
---------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS(select * from VpTransactionConfig where ChannelID =10 and TransactionID =(select ID from VpTransaction where TransactionName = '{ServisAdi}'))
BEGIN
INSERT INTO VpTransactionConfig(TransactionID,Configuration,ChannelProductOID,CreateDate,CreateBy,ChannelID)
VALUES((select ID from VpTransaction where TransactionName = '{ServisAdi}'),
      '<?xml version="1.0" encoding="utf-8"?>
 <TransactionConfig  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xmlns:xsd="http://www.w3.org/2001/XMLSchema"
     xmlns="http://tempuri.org/VeriBranchMessages.xsd">
 <TransactionFlow>
  <Step Name="Start" Action="RedirectToPage"  StepNameResourceKey="Start"></Step>
 </TransactionFlow>
 <ImplementationData>
  <RequestType>VeriBranch.Common.MessageDefinitions.{ServisAdi}Request,VeriBranch.Common.MessageDefinitions</RequestType>
  <ResponseType>VeriBranch.Common.MessageDefinitions.{ServisAdi}Response,VeriBranch.Common.MessageDefinitions</ResponseType>
  <ClassType>Finansbank.Business.Transactions.HostIntegrationTransaction,   Finansbank.Business.Transactions</ClassType>
 </ImplementationData>
 <Name>{ServisAdi}</Name>
 <Simulate>false</Simulate>
</TransactionConfig>',
      NULL,getdate(),'T65714',10)
END
---------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (select * from VpTransactionAttributes where ChannelID =10 and TransactionID =(select ID from VpTransaction where TransactionName = '{ServisAdi}'))
BEGIN
INSERT INTO VpTransactionAttributes(TransactionID,ChannelID,IsDeleted,IsOTPRequired,FraudType,IsHistoryLoggingEnabled,LoggingVerbosity,IsPerformanceCounterEnabled,IsEnabled,FraudState,HostCallLogVerbosity,HostProcessCode,DescriptionForChannel,TransactionType,CreateDate,CreateBy,ModifyDate,ModifyBy,TrustedDeviceCheckEnabled,LogLifetime)
VALUES((select ID from VpTransaction where TransactionName='{ServisAdi}'),10,0,0,NULL,1,1111,0,1,NULL,11,100000,'{ServisAciklamasi}',null,null,null,null,null,null,null)
END
```

---

## 🔍 **Servis Tanımı Kontrol Sorguları**

### **📊 Servis Var Mı Kontrolü:**
Kullanıcı **"Bu servis tanımı yapıldı mı?"** veya **"X servisi mevcut mu?"** dediğinde aşağıdaki kontrolleri yap:

#### **1️⃣ VpTransaction Kontrolü:**
```sql
SELECT TransactionName, Description, LastActionDate, LastActionUser
FROM VpTransaction
WHERE TransactionName = '{ServisAdi}'
```

#### **2️⃣ VpTransactionConfig Kontrolü:**
```sql
SELECT tc.*, t.TransactionName
FROM VpTransactionConfig tc
INNER JOIN VpTransaction t ON tc.TransactionID = t.ID
WHERE t.TransactionName = '{ServisAdi}'
AND tc.ChannelID = 10
```

#### **3️⃣ VpTransactionAttributes Kontrolü:**
```sql
SELECT ta.*, t.TransactionName
FROM VpTransactionAttributes ta
INNER JOIN VpTransaction t ON ta.TransactionID = t.ID
WHERE t.TransactionName = '{ServisAdi}'
AND ta.ChannelID = 10
```

#### **4️⃣ Tam Durum Kontrolü:**
```sql
SELECT
   t.TransactionName,
   t.Description,
   CASE WHEN tc.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END as ConfigVarMi,
   CASE WHEN ta.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END as AttributesVarMi,
   CASE WHEN tc.ID IS NOT NULL AND ta.ID IS NOT NULL THEN 'TAMAM' ELSE 'EKSİK' END as TamDurum
FROM VpTransaction t
LEFT JOIN VpTransactionConfig tc ON t.ID = tc.TransactionID AND tc.ChannelID = 10
LEFT JOIN VpTransactionAttributes ta ON t.ID = ta.TransactionID AND ta.ChannelID = 10
WHERE t.TransactionName = '{ServisAdi}'
```

---

## 📋 **Zorunlu Konfigürasyon Alanları**

### **🔧 VpTransaction Tablosu:**
- **TransactionName**: Servis adı (benzersiz)
- **Description**: Servis açıklaması
- **LastActionUser**: 'T65714' (sabit)
- **IsFinancial**: 0 (varsayılan)
- **isLead**: 0 (varsayılan)

### **🔧 VpTransactionConfig Tablosu:**
- **ChannelID**: 10 (Mobil kanal - GLOBAL KURAL)
- **Configuration**: XML konfigürasyon (template kullan)
- **CreateBy**: 'T65714' (sabit)

### **🔧 VpTransactionAttributes Tablosu:**
- **ChannelID**: 10 (Mobil kanal - GLOBAL KURAL)
- **IsEnabled**: 1 (aktif)
- **IsHistoryLoggingEnabled**: 1 (log aktif)
- **LoggingVerbosity**: 1111 (varsayılan)
- **HostCallLogVerbosity**: 11 (varsayılan)
- **HostProcessCode**: 100000 (varsayılan)

---

## ⚠️ **Önemli Kurallar ve Kısıtlamalar**

### **🚨 GLOBAL Kurallar:**
- **ChannelID = 10** tüm tablolarda zorunlu (Mobil kanal)
- **CreateBy/LastActionUser = 'T65714'** sabit kullanıcı
- **Transaction tanımı 3 tabloya birden eklenmeli**

### **🔍 Kontrol Kuralları:**
- Servis eklemeden önce **mevcut olup olmadığını kontrol et**
- IF NOT EXISTS kullanarak **duplicate önle**
- Eksik table varsa **kullanıcıyı bilgilendir**

### **📝 Template Kullanım Kuralları:**
- **{ServisAdi}** → Kullanıcıdan alınan servis adı
- **{ServisAciklamasi}** → Kullanıcıdan alınan açıklama
- **XML konfigürasyonda** servis adı aynı olmak zorunda

---

## 🚀 **İşlem Akışı**

### **1️⃣ Yeni Servis Tanımı İsteği:**
1. Kullanıcıdan **ServisAdi** ve **ServisAciklamasi** al
2. **Mevcut olup olmadığını kontrol et**
3. Template'i doldur ve **3 tabloya da ekle**
4. **Başarı durumunu kontrol et ve bildir**

### **2️⃣ Servis Durum Kontrolü İsteği:**
1. Kullanıcıdan **ServisAdi** al
2. **3 tabloda da kontrol et**
3. **Eksik/Tam durum raporla**
4. Gerekirse **eksik tabloları tamamla**

### **3️⃣ MCP Kullanımı:**
```
mcp_mcp-mssql-db-operations_update_data:
- databaseName: "CommonDb"
- sql: [Transaction tanım SQL'i - ChannelID=10 zorunlu]
```

---

## 💡 **Örnek Kullanım Senaryoları**

### **📞 Kullanıcı: "VbKrediKartiBilgileri servisi tanımla"**
**Yanıt:**
1. "VbKrediKartiBilgileri servisinin açıklamasını da belirtir misiniz?"
2. Açıklama alındıktan sonra template'i doldur
3. 3 tabloya da ekle
4. "VbKrediKartiBilgileri servisi başarıyla tanımlandı" diye bildir

### **📞 Kullanıcı: "VbOdemeIslemi servisi yapıldı mı?"**
**Yanıt:**
1. Tam durum kontrolü yap
2. "VbOdemeIslemi servisi: [TAMAM/EKSİK] - Detaylar: [Config:VAR, Attributes:YOK]" şeklinde raporla

### **📞 Kullanıcı: "Transaction tanımı yap"**
**Yanıt:**
1. "Hangi servis için transaction tanımı yapmak istiyorsunuz? Servis adını belirtiniz."
2. "Bu servisin açıklamasını da belirtir misiniz?"
3. Template'i kullanarak tanım yap

---

# 🗺️ MCS Servis Mapping Rehberi

Bu rehber, MCS servis mapping bilgilerini getirmek için kullanılacak sorguları ve kuralları içerir.

---

## 🎯 **MCS Servis Mapping Talepleri**

### **📝 Kullanıcı Talep Senaryoları:**
- **"MCS servis mapping getir"**
- **"Host mapping bilgilerini göster"**
- **"Servis mapping detayları"**
- **"X servisi hangi host'a bağlı?"**
- **"Mapping detaylarını getir"**
- **"VeriBranch mapping bilgileri"**

### **🔍 Gerekli Bilgiler:**
Kullanıcıdan aşağıdaki bilgiyi alın:
1. **Servis Adı (VeribranchTransactionName)** - Örnek: "GetCreditCardList"

---

## 📋 **MCS Servis Mapping Sorgu Template**

### **🔧 Tam Mapping Bilgisi Template:**
```sql
DECLARE @myvar char(70);
SET @myvar = '{ServisAdi}'

-- Mapping detay bilgileri
SELECT * FROM dbo.VpHostCallMappingDetail
WHERE HostCallMappingID IN (
   SELECT VpVeriBranchHostCallMappingView.ID
   FROM dbo.VpVeriBranchHostCallMappingView
   WHERE VeribranchTransactionName = @myvar
)

-- Ana mapping bilgileri
SELECT * FROM dbo.VpVeriBranchHostCallMappingView
WHERE VeribranchTransactionName = @myvar
```

### **🔍 Sadece Ana Mapping Bilgisi:**
```sql
SELECT * FROM dbo.VpVeriBranchHostCallMappingView
WHERE VeribranchTransactionName = '{ServisAdi}'
```

### **🔍 Sadece Detay Mapping Bilgisi:**
```sql
SELECT vhmd.* FROM dbo.VpHostCallMappingDetail vhmd
INNER JOIN dbo.VpVeriBranchHostCallMappingView vbhcmv ON vhmd.HostCallMappingID = vbhcmv.ID
WHERE vbhcmv.VeribranchTransactionName = '{ServisAdi}'
```

---

## 📊 **Mapping Tablo Açıklamaları**

### **🗂️ VpVeriBranchHostCallMappingView (Ana Mapping Tablosu)**
**📌 Ne İçin Kullanılır:**
- VeriBranch transaction'ların host sistemlerine mapping bilgileri
- Servis adı ile host call mapping ilişkisi
- Genel mapping konfigürasyonları

**🔍 Önemli Alanlar:**
- `ID` - Mapping ID (Primary Key)
- `VeribranchTransactionName` - VeriBranch servis adı
- `HostCallMappingID` - Host call mapping referansı
- `IsActive` - Aktiflik durumu
- `CreateDate` - Oluşturulma tarihi
- `ModifyDate` - Değişiklik tarihi

### **🗂️ VpHostCallMappingDetail (Detay Mapping Tablosu)**
**📌 Ne İçin Kullanılır:**
- Host call mapping'lerin detaylı konfigürasyonları
- Request/Response mapping detayları
- Host sistem bağlantı parametreleri

**🔍 Önemli Alanlar:**
- `HostCallMappingID` - Ana mapping ID ile bağlantı
- `ParameterName` - Parametre adı
- `ParameterValue` - Parametre değeri
- `ParameterType` - Parametre tipi
- `IsRequired` - Zorunluluk durumu
- `OrderIndex` - Sıralama indexi

---

## 🔍 **Mapping Durum Kontrol Sorguları**

### **📊 Servis Mapping Var Mı Kontrolü:**
```sql
SELECT
   CASE
       WHEN COUNT(*) > 0 THEN 'VAR'
       ELSE 'YOK'
   END as MappingDurumu,
   COUNT(*) as MappingSayisi
FROM dbo.VpVeriBranchHostCallMappingView
WHERE VeribranchTransactionName = '{ServisAdi}'
```

### **📊 Detaylı Mapping Durum Raporu:**
```sql
SELECT
   vbhcmv.VeribranchTransactionName,
   vbhcmv.ID as MappingID,
   vbhcmv.IsActive,
   COUNT(vhmd.ID) as DetaySayisi,
   vbhcmv.CreateDate,
   vbhcmv.ModifyDate
FROM dbo.VpVeriBranchHostCallMappingView vbhcmv
LEFT JOIN dbo.VpHostCallMappingDetail vhmd ON vbhcmv.ID = vhmd.HostCallMappingID
WHERE vbhcmv.VeribranchTransactionName = '{ServisAdi}'
GROUP BY vbhcmv.VeribranchTransactionName, vbhcmv.ID, vbhcmv.IsActive, vbhcmv.CreateDate, vbhcmv.ModifyDate
```

### **📊 Mapping Parametreleri Listesi:**
```sql
SELECT
   vhmd.ParameterName,
   vhmd.ParameterValue,
   vhmd.ParameterType,
   vhmd.IsRequired,
   vhmd.OrderIndex
FROM dbo.VpHostCallMappingDetail vhmd
INNER JOIN dbo.VpVeriBranchHostCallMappingView vbhcmv ON vhmd.HostCallMappingID = vbhcmv.ID
WHERE vbhcmv.VeribranchTransactionName = '{ServisAdi}'
ORDER BY vhmd.OrderIndex
```

---

## ⚠️ **Önemli Kurallar ve Kısıtlamalar**

### **🔍 Kontrol Kuralları:**
- Servis adı **case-sensitive** olabilir, dikkatli ol
- **Aktif mapping** kontrolü yap (IsActive = 1)
- **Detay sayısını** kontrol et (boş detay olabilir)

### **📝 Template Kullanım Kuralları:**
- **{ServisAdi}** → Kullanıcıdan alınan servis adı
- **DECLARE @myvar** kullanarak parametrik sorgu yap
- **char(70)** boyut sınırına dikkat et

### **🚨 Veritabanı Kuralları:**
- Bu tablolar **CommonDb** veritabanında
- **ChannelID filtresi gerekmiyor** (mapping tabloları için)
- **View ve Detail** tabloları birlikte kullan

---

## 🚀 **İşlem Akışı**

### **1️⃣ Mapping Bilgisi İsteği:**
1. Kullanıcıdan **ServisAdi** al
2. **Template'i doldur ve sorguyu çalıştır**
3. **Ana mapping + Detay mapping** bilgilerini getir
4. **Sonuçları kullanıcıya raporla**

### **2️⃣ Mapping Durum Kontrolü İsteği:**
1. Kullanıcıdan **ServisAdi** al
2. **Mapping var mı kontrol et**
3. **Aktif/Pasif durum** bilgisini raporla
4. **Detay sayısını** belirt

### **3️⃣ MCP Kullanımı:**
```
mcp_mcp-mssql-db-operations_read_data:
- databaseName: "CommonDb"
- sql: [Mapping sorgu SQL'i]
```

---

## 💡 **Örnek Kullanım Senaryoları**

### **📞 Kullanıcı: "GetCreditCardList servis mapping getir"**
**Yanıt:**
1. Template'i "GetCreditCardList" ile doldur
2. Ana mapping + detay mapping sorgularını çalıştır
3. Mapping ID, aktiflik durumu, parametre detaylarını raporla

### **📞 Kullanıcı: "VbOdemeIslemi hangi host'a bağlı?"**
**Yanıt:**
1. "VbOdemeIslemi" için mapping kontrolü yap
2. Host bağlantı bilgilerini getir
3. Mapping var/yok durumunu raporla

### **📞 Kullanıcı: "MCS servis mapping getir"**
**Yanıt:**
1. "Hangi servis için mapping bilgilerini getirmek istiyorsunuz? Servis adını belirtiniz."
2. Servis adı alındıktan sonra template'i doldur
3. Tam mapping bilgilerini getir ve raporla

### **📞 Kullanıcı: "Mapping detaylarını göster"**
**Yanıt:**
1. Servis adını sor
2. Ana mapping + detay mapping + parametre listesi getir
3. Tablo formatında organize ederek sun

---

# 📝 Contact History Log Ekleme Rehberi

Bu rehber, contact history log tanımı eklemek için kullanılacak sorguları ve kuralları içerir.

---

## 🎯 **Contact History Log Talepleri**

### **📝 Kullanıcı Talep Senaryoları:**
- **"Contact history log ekle"**
- **"Contact history tanımı yap"**
- **"Log task type oluştur"**
- **"Contact history mapping ekle"**
- **"Contact log konfigürasyonu yap"**
- **"İşlem log tanımı ekle"**

### **🔍 Gerekli Bilgiler:**
Kullanıcıdan aşağıdaki bilgileri alın:
1. **Task Code** - Örnek: "ANINDA_IADE_GIRIS_GOZLEM"
2. **Friendly Name** - Örnek: "Anında İade Giriş Tutar Yazma Ekranı"
3. **İsteğe bağlı:** Özel criterion mapping'ler

---

## 📋 **Contact History Log SQL Template**

### **🔧 Tam Contact History Log Template:**
```sql
USE VeriBranchFinansbank_Common
DECLARE @myvar char(70);
SET @myvar = '{TaskCode}'

-- Task Type tanımı
IF NOT EXISTS(Select * from VpContactHistoryTaskType where TaskCode= LTRIM(RTRIM(@myvar)) AND ChannelID=10)
BEGIN
INSERT INTO VpContactHistoryTaskType (TaskCode,FriendlyName,TaskType,Description,ChannelID)
VALUES(LTRIM(RTRIM(@myvar)),'{FriendlyName}',2,'T65714',10)
END

-- Transaction Task Relation tanımı
IF NOT EXISTS(Select * from VpContactHistoryTransactionTaskRelation where TransactionName= LTRIM(RTRIM(@myvar)) AND ChannelID=10)
BEGIN
INSERT INTO VpContactHistoryTransactionTaskRelation (TransactionName, TaskCode,ChannelID,ConditionSource)
VALUES(LTRIM(RTRIM(@myvar)),LTRIM(RTRIM(@myvar)),10,0)
END

-- Contact History Mapping tanımı
IF NOT EXISTS(Select * from VpContactHistoryMapping where TransactionName= LTRIM(RTRIM(@myvar)) AND ChannelID=10)
BEGIN
INSERT INTO VpContactHistoryMapping (TransactionName,ChannelID,Configuration,ModifyDate,ModifyBy,CreateDate,CreateBy,TransactionID)
VALUES(LTRIM(RTRIM(@myvar)),10,
'<LogConfig xmlns="http://tempuri.org/VeriBranchMessages.xsd">
<ListInfo />
<ColumnMappings>
<ColumnItem RequestPropertyName="LogContainer[ExceptionID]" ColumnName="ExceptionID" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[ExceptionText]" ColumnName="ExceptionText" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[TransactionCreditCard]" ColumnName="TransactionCreditCard" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[BoardName]" ColumnName="BoardName" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[BoardCode]" ColumnName="BoardCode" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[BankCode]" ColumnName="BankCode" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[BankName]" ColumnName="BankName" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[LoginStatus]" ColumnName="LoginStatus" ResponsePropertyName="" ListBased="false" />
<ColumnItem RequestPropertyName="LogContainer[ScreenCode]" ColumnName="ScreenCode" ResponsePropertyName="" ListBased="false" />
</ColumnMappings>
<AdditionalInfoMappings />
</LogConfig>',getDate(),'T65714',getDate(),'T65714',0)
END

-- Criterion Mapping tanımları
IF NOT EXISTS(Select * from VpContactHistoryCriterionMapping where TransactionName= LTRIM(RTRIM(@myvar)) AND RequestPropertyName='LogContainer[CardNo]' AND ChannelID=10)
BEGIN
INSERT INTO VpContactHistoryCriterionMapping (TransactionName,ChannelID,RequestPropertyName,CriterionValueColumnName,FriendlyName, ModifyDate,ModifyBy,CreateDate,CreateBy,IsActive)
VALUES(LTRIM(RTRIM(@myvar)),10,'LogContainer[CardNo]','Criterion1Value','Kart No',GETDATE(),'T65714',getDate(),'T65714',1)
END

IF NOT EXISTS(Select * from VpContactHistoryCriterionMapping where TransactionName= LTRIM(RTRIM(@myvar)) AND RequestPropertyName='LogContainer[TransactionDescription]' AND ChannelID=10)
BEGIN
INSERT INTO VpContactHistoryCriterionMapping (TransactionName,ChannelID,RequestPropertyName,CriterionValueColumnName,FriendlyName, ModifyDate,ModifyBy,CreateDate,CreateBy,IsActive)
VALUES(LTRIM(RTRIM(@myvar)),10,'LogContainer[TransactionDescription]','Criterion2Value','İşlem Açıklaması',GETDATE(),'T65714',getDate(),'T65714',1)
END
```

---

## 📊 **Contact History Log Tablo Açıklamaları**

### **🗂️ VpContactHistoryTaskType (Task Type Tanımları)**
**📌 Ne İçin Kullanılır:**
- Contact history log task tiplerinin tanımlanması
- Task kodları ve friendly name'lerin yönetimi
- Log kategorilerinin belirlenmesi

**🔍 Önemli Alanlar:**
- `TaskCode` - Task benzersiz kodu
- `FriendlyName` - Kullanıcı dostu isim
- `TaskType` - Task tipi (varsayılan: 2)
- `Description` - Açıklama (T65714 sabit)
- `ChannelID` - Kanal ID (10: mobil) - **GLOBAL KURAL**

### **🗂️ VpContactHistoryTransactionTaskRelation (Transaction-Task İlişkisi)**
**📌 Ne İçin Kullanılır:**
- Transaction ile task arasındaki ilişkinin tanımlanması
- Transaction bazlı log yönlendirmesi
- Task-transaction mapping kontrolü

**🔍 Önemli Alanlar:**
- `TransactionName` - Transaction adı
- `TaskCode` - İlişkili task kodu
- `ChannelID` - Kanal ID (10: mobil) - **GLOBAL KURAL**
- `ConditionSource` - Koşul kaynağı (varsayılan: 0)

### **🗂️ VpContactHistoryMapping (Mapping Konfigürasyonu)**
**📌 Ne İçin Kullanılır:**
- Log data mapping konfigürasyonları
- XML tabanlı column mapping tanımları
- Request-response property eşlemeleri

**🔍 Önemli Alanlar:**
- `TransactionName` - Transaction adı
- `ChannelID` - Kanal ID (10: mobil) - **GLOBAL KURAL**
- `Configuration` - XML log konfigürasyonu
- `CreateBy/ModifyBy` - T65714 (sabit kullanıcı)
- `TransactionID` - Transaction ID (varsayılan: 0)

### **🗂️ VpContactHistoryCriterionMapping (Kriter Mapping)**
**📌 Ne İçin Kullanılır:**
- Log kriterleri tanımlaması
- Arama ve filtreleme parametreleri
- Criterion column mapping'ler

**🔍 Önemli Alanlar:**
- `TransactionName` - Transaction adı
- `ChannelID` - Kanal ID (10: mobil) - **GLOBAL KURAL**
- `RequestPropertyName` - Request property adı
- `CriterionValueColumnName` - Kriter column adı
- `FriendlyName` - Kullanıcı dostu isim
- `IsActive` - Aktiflik durumu (1: aktif)

---

## 🔍 **Contact History Log Kontrol Sorguları**

### **📊 Contact History Log Var Mı Kontrolü:**
```sql
SELECT
   CASE WHEN COUNT(*) > 0 THEN 'VAR' ELSE 'YOK' END as TaskTypeDurumu
FROM VpContactHistoryTaskType
WHERE TaskCode = '{TaskCode}' AND ChannelID = 10

UNION ALL

SELECT
   CASE WHEN COUNT(*) > 0 THEN 'VAR' ELSE 'YOK' END as TransactionRelationDurumu
FROM VpContactHistoryTransactionTaskRelation
WHERE TransactionName = '{TaskCode}' AND ChannelID = 10

UNION ALL

SELECT
   CASE WHEN COUNT(*) > 0 THEN 'VAR' ELSE 'YOK' END as MappingDurumu
FROM VpContactHistoryMapping
WHERE TransactionName = '{TaskCode}' AND ChannelID = 10

UNION ALL

SELECT
   CASE WHEN COUNT(*) > 0 THEN 'VAR' ELSE 'YOK' END as CriterionDurumu
FROM VpContactHistoryCriterionMapping
WHERE TransactionName = '{TaskCode}' AND ChannelID = 10
```

### **📊 Detaylı Contact History Durum Raporu:**
```sql
SELECT
   '{TaskCode}' as TaskCode,
   (SELECT COUNT(*) FROM VpContactHistoryTaskType WHERE TaskCode = '{TaskCode}' AND ChannelID = 10) as TaskTypeCount,
   (SELECT COUNT(*) FROM VpContactHistoryTransactionTaskRelation WHERE TransactionName = '{TaskCode}' AND ChannelID = 10) as RelationCount,
   (SELECT COUNT(*) FROM VpContactHistoryMapping WHERE TransactionName = '{TaskCode}' AND ChannelID = 10) as MappingCount,
   (SELECT COUNT(*) FROM VpContactHistoryCriterionMapping WHERE TransactionName = '{TaskCode}' AND ChannelID = 10) as CriterionCount
```

### **📊 Criterion Mapping Listesi:**
```sql
SELECT
   RequestPropertyName,
   CriterionValueColumnName,
   FriendlyName,
   IsActive,
   CreateDate
FROM VpContactHistoryCriterionMapping
WHERE TransactionName = '{TaskCode}' AND ChannelID = 10
ORDER BY FriendlyName
```

---

## ⚠️ **Önemli Kurallar ve Kısıtlamalar**

### **🚨 GLOBAL Kurallar:**
- **ChannelID = 10** tüm tablolarda zorunlu (Mobil kanal)
- **CreateBy/ModifyBy = 'T65714'** sabit kullanıcı
- **Contact history tanımı 4 tabloya birden eklenmeli**
- **LTRIM(RTRIM(@myvar))** kullanarak string temizleme

### **🔍 Kontrol Kuralları:**
- Task code eklemeden önce **mevcut olup olmadığını kontrol et**
- IF NOT EXISTS kullanarak **duplicate önle**
- **4 tabloda da** tanım olup olmadığını kontrol et
- Eksik table varsa **kullanıcıyı bilgilendir**

### **📝 Template Kullanım Kuralları:**
- **{TaskCode}** → Kullanıcıdan alınan task code
- **{FriendlyName}** → Kullanıcıdan alınan friendly name
- **XML konfigürasyonu** sabit template kullan
- **Criterion mapping'ler** standart CardNo ve TransactionDescription

### **🚨 Veritabanı Kuralları:**
- **VeriBranchFinansbank_Common** veritabanı kullan
- **char(70)** boyut sınırına dikkat et
- **XML konfigürasyon** format bozulmasın

---

## 🚀 **İşlem Akışı**

### **1️⃣ Yeni Contact History Log İsteği:**
1. Kullanıcıdan **TaskCode** ve **FriendlyName** al
2. **Mevcut olup olmadığını 4 tabloda da kontrol et**
3. Template'i doldur ve **4 tabloya da ekle**
4. **Başarı durumunu kontrol et ve bildir**

### **2️⃣ Contact History Durum Kontrolü İsteği:**
1. Kullanıcıdan **TaskCode** al
2. **4 tabloda da kontrol et**
3. **Eksik/Tam durum raporla**
4. Gerekirse **eksik tabloları tamamla**

### **3️⃣ MCP Kullanımı:**
```
mcp_mcp-mssql-db-operations_update_data:
- databaseName: "VeriBranchFinansbank_Common"
- sql: [Contact History Log tanım SQL'i - ChannelID=10 zorunlu]
```

---

## 💡 **Örnek Kullanım Senaryoları**

### **📞 Kullanıcı: "KREDI_KARTI_SORGULAMA contact history log ekle"**
**Yanıt:**
1. "KREDI_KARTI_SORGULAMA task'ının friendly name'ini belirtir misiniz?"
2. Friendly name alındıktan sonra template'i doldur
3. 4 tabloya da ekle
4. "KREDI_KARTI_SORGULAMA contact history log tanımı başarıyla eklendi" diye bildir

### **📞 Kullanıcı: "ANINDA_IADE_GIRIS_GOZLEM log tanımı yapıldı mı?"**
**Yanıt:**
1. Detaylı durum kontrolü yap
2. "ANINDA_IADE_GIRIS_GOZLEM: [TAMAM/EKSİK] - TaskType:VAR, Relation:VAR, Mapping:YOK, Criterion:VAR" raporla

### **📞 Kullanıcı: "Contact history log ekle"**
**Yanıt:**
1. "Hangi task için contact history log eklemek istiyorsunuz? Task code'unu belirtiniz."
2. "Bu task'ın friendly name'ini de belirtir misiniz?"
3. Template'i kullanarak tanım yap

### **📞 Kullanıcı: "Contact log konfigürasyonu yap"**
**Yanıt:**
1. Task code'unu sor
2. Friendly name'i sor
3. 4 tabloya da tam tanım ekle
4. Criterion mapping'leri dahil et

# 🏷️ VpLabel Sistem Kuralları

## 📋 Sistem Amacı
VpLabel sistemi ile string resource'ları takip etmek ve otomatik INSERT query'leri oluşturmak.

## 🗄️ Tablo İlişkileri
```
VpLabel (Label Tanımları)
   ↓ LabelID
VpLabelObject (İlişki Tablosu)
   ↓ ObjectId + ObjectType=0
VpStringResource (String Kayıtları)
```

## 🏷️ ObjectType Değerleri
- **0** = VpStringResource
- **1** = VpTransaction
- **2** = MobileMenu
- **3** = VpContactHistoryMapping

## 📝 Label Naming Convention
**Format:** `{FeatureName}_{TaskType}_{Version}`
**Örnek:** `CreditCardApplication_Resources_v1.0`

## 🔧 Workflow
1. **Label Oluştur** → VpLabel tablosuna kayıt
2. **Resource Ekle** → VpStringResource + VpLabelObject ilişkisi
3. **Script Üret** → Label bazlı INSERT query'leri oluştur

## ⚠️ Zorunlu Kurallar
- **ChannelID = 10** (Global Kural)
- **CreateBy = 'T65714'** (Sabit kullanıcı)
- **3 Dil Zorunlu** (tr-TR, en-US, ar-SA)
- **Unique LabelName** (Tekrar edemez)

## 🎯 Ana Sorgular

### Label Oluşturma:
```sql
INSERT INTO VpLabel (LabelName, Description, CreateBy, CreateDate, IsActive)
VALUES ('{LabelName}', '{Description}', 'T65714', GETDATE(), 1)
```

### Resource-Label İlişkisi:
```sql
INSERT INTO VpLabelObject (LabelID, ObjectType, ObjectId, CreateBy, CreateDate)
VALUES ({LabelID}, 0, {ResourceID}, 'T65714', GETDATE())
```

### Label'daki Resource'ları Getirme:
```sql
SELECT sr.* FROM VpStringResource sr
INNER JOIN VpLabelObject lo ON sr.ID = lo.ObjectId
WHERE lo.LabelID = {LabelID} AND lo.ObjectType = 0
AND sr.ChannelID = 10
ORDER BY sr.ResourceKey, sr.CultureCode
```

## 📁 Script Çıktı Formatı
```sql
-- Label: {LabelName}
-- Generated: {DateTime}
-- Total Resources: {Count}

---Lang:tr-TR---
IF NOT EXISTS(Select * from vpStringResource where ...)
BEGIN
INSERT INTO vpStringResource(...)
VALUES(...)
END
```

## 🚨 Kritik Noktalar
- ObjectType=0 sadece VpStringResource için
- Label silinmeden önce tüm ilişkiler temizlenmeli
- Deployment script'leri version kontrolünde tutulmalı
- Aynı ResourceKey farklı label'larda olabilir

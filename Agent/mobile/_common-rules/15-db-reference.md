# Common-Rules — 15: DB Referansı (CommonDb + MobileDefaultLog)

> Bu modül, `mobilemenu-mssqlmcp.md` (kök) içeriğinin agent yapısına uygun, kayıpsız yeniden yapılandırılmış halidir.
> **mcp-mssql-db-operations ile DB işlemi yapan tüm agentlar için kanonik tablo/kolon/sorgu rehberidir.**
> Context yönetimi: agent yalnızca ihtiyaç duyduğu tablo bölümünü (DB2-DB7) okur.

## Hızlı Erişim İndeksi

| İhtiyaç | Bölüm | Tablo(lar) | DB |
|---------|-------|------------|-----|
| ChannelID kuralı + istisna | [DB1] | (global) | — |
| Menü ekleme / okuma | [DB2] | MobileMenu | CommonDb |
| Pano / NBT / 3D Touch / Spotlight mapping | [DB3] | MobileMenuMapping | CommonDb |
| Çoklu dil metin (resource/CMS) | [DB4] | VpStringResource | CommonDb |
| Servis (transaction) tanımı | [DB5] | VpTransaction + Config + Attributes | CommonDb |
| MCS host mapping (input/output param) | [DB6] | VpVeriBranchHostCallMappingView + VpHostCallMappingDetail | CommonDb |
| Log / oturum / işlem / hata analizi | [DB7] | VpMobileContact, VpMobileContactHistory, VpDefaultLog, VpExceptionLog, VpTransactionHistoryLog | MobileDefaultLog |
| Sabitler (T65714, ChannelID değerleri) | [DB8] | — | — |

---

## [DB1] Global ChannelID Kuralı

**TÜM veritabanı ve tablolarda `ChannelID` filtresi ZORUNLUDUR.** (Tek istisna: MCS mapping tabloları — bkz. [DB6].)

| Değer | Kanal |
|-------|-------|
| 10 | Mobil (varsayılan) |
| 20 | Web |
| 30 | Çağrı Merkezi |
| 40 | ATM |
| 50 | Şube |

- Kullanıcı kanal belirtmezse → `ChannelID = 10`.
- Kullanıcı belirtirse → o değer.
- **ASLA ChannelID filtresi olmadan sorgu yapılmaz.**

**Sabit ChannelID = 10 tablolar (mobil):** VpStringResource, MobileMenu, MobileMenuMapping, VpTransaction, VpTransactionConfig, VpTransactionAttributes.

**Log tabloları (MobileDefaultLog):** kullanıcının belirttiği veya varsayılan (10) ChannelID kullanılır.

---

## [DB2] MobileMenu (CommonDb)

Mobil client'lara gösterilen ana menü öğeleri. Her kayıt bir menü item'ıdır; Parent-Child ilişkisiyle menü ağacı kurulur. **ChannelID = 10 zorunlu.**

### Kolonlar

| Kolon | Açıklama |
|-------|----------|
| `ParentID` | Menü kırılımı, parent ile ilişkili |
| `MenuID` | Menüye özel benzersiz ID |
| `Title` | VpStringResource içindeki MobileMenu ResourceKey'i |
| `TransactionName` | Sayfaya yönlendirme / log için |
| `DescriptionName` | TR açıklama (Client'a GİTMEZ) |
| `EnabledTR` / `EnabledEN` | 1 → göster, 0 → gösterme |
| `IsMenuRoot` | İlk kırılım dışı: 1 |
| `IsMenuStep` | Parent menü adımı: 1 |
| `AllUser` | 1: hepsi, 2: bireysel, 3: tüzel |
| `Keywords` | Arama kelimeleri (yalnızca uç menüler) |
| `MenuAdress` | Breadcrumb |
| `SearchOrderIndex` | Arama sırası |
| `Configuration` | JSON, platform bazlı config (bkz. aşağı) |
| `Validation` | JSON, kurallar dizisi (bkz. aşağı) |
| `CorporateOrder` | Tüzel kullanıcı menü sıralamaları |
| `ChannelID` | Kanal ID (10: mobil) — ZORUNLU FİLTRE |

### Menü Ekleme Kuralları

| Tip | Kural |
|-----|-------|
| **Parent menü** | `IsMenuStep=1`, `IsMenuRoot=0`, `ParentID=MenuID`, ClassName/Keyword girilmez, `checknavi=0` |
| **Child (sayfa açmayan)** | ClassName/Keyword girilmez, `checknavi=0` |
| **Child (sayfa açan)** | `TransactionName` zorunlu, `ClassName`+`StoryboardName`+`ViewControllerId`+`Bundle` girilir, `checknavi=1` |

> Uç (sayfa açan) menülerde `TransactionName` zorunludur; tanımlandığında 3 tabloya insert edilir (VpTransaction, VpTransactionConfig, VpTransactionAttributes — bkz. [DB5]).

### Configuration JSON

```json
{
  "AndroidMenuItem": {
    "MenuVisible": "1", "LightLoginEnable": "1",
    "MinBuildNumber": "259", "MaxBuildNumber": "300", "MenuStatus": "1",
    "ClassName": "com.bank.app.FeatureActivity",
    "PilotKey": "SomePilotKey", "ReversePilot": false
  },
  "IosMenuItem": {
    "MenuVisible": "1", "LightLoginEnable": "1", "MinBuildNumber": "207",
    "StoryboardName": "FeatureStoryboard", "ViewControllerId": "FeatureVC",
    "ClassName": "FeatureVC", "Bundle": "FeatureModule",
    "PilotKey": "SomePilotKey", "ReversePilot": false
  },
  "HuaweiMenuItem": {
    "MinBuildNumber": "259", "MaxBuildNumber": "300",
    "ClassName": "com.bank.app.HuaweiFeatureActivity"
  }
}
```

### Validation JSON + ActionType

```json
{
  "ClientValidationList": [
    { "Rule": [
        { "FilterKey": "IsAvailableDigitalConfirm", "FilterValue": "1",
          "FilterOperation": "equal", "ActionType": "0",
          "ActionMessage": "", "ActionResultType": "" }
    ] }
  ]
}
```

| ActionType | Anlamı |
|------------|--------|
| 0 | Menüyü gizle |
| 1 | Menüye tıklandığında akışı kes, popup göster |
| 2 | Menüye tıklandığında popup göster ama sayfaya yönlen |

**Validasyon mantığı:** AND = aynı `Rule` içindeki koşullar; OR = farklı `Rule` objeleri arası. `FilterOperation`: equal / greaterThanEqual / lessThanEqual vb. (örn. versiyon kontrolü `BuildNoAndroid >= 260` + pilot `IsPaymentPilot = 1`).

### Ek Özellikler

- **LogTaskCodeValueObject** — menü bazlı loglama kodları
- **BundleObject** — sayfaya parametre geçişi
- **PickerConfiguration** — hesap/kart seçimi, mesajlar
- **IsEnabledUnder18Age** — 18 yaş altı kullanıcı görünürlük kontrolü
- Tümünde **ChannelID = 10 zorunlu**

### Örnek Sorgu

```sql
SELECT MenuID, ParentID, Title, TransactionName, ClassName, StoryboardName,
       EnabledTR, EnabledEN, AllUser, Configuration, Validation
FROM MobileMenu
WHERE (Title LIKE '%{KEY}%' OR DescriptionName LIKE '%{KEY}%')
  AND ChannelID = 10;
```

---

## [DB3] MobileMenuMapping (CommonDb)

Ana menü harici tüm pano, NBT, 3D Touch, Spotlight, Pega vb. setlerin tutulduğu mapping tablosu. **ChannelID = 10 zorunlu.**

### Alanlar

| Alan | Anlamı |
|------|--------|
| `ReferenceID` | Pano ID, menü tipi ID'si |
| `MenuID` | Eklenen menü ID'si |
| `MenuType` | Set tipi (aşağıdaki tablo) |
| `ParentMenu` | Parent mı? (1: evet) |
| `Validation` | Mapping özel kural |
| `TitleKey` | ResourceKey — Title için |
| `ChannelID` | Kanal ID (10: mobil) — ZORUNLU |

### MenuType Listesi

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
| 11 | **Rezerve / kullanım dışı** |
| 12 | NBT Sık Kullanılanlar |
| 13 | Pega Sık Kullanılanlar |
| 14 | Hızlı Erişim Panosu |
| 15 | Başvuru Merkezi |

### CorporateOrder (Tüzel Sıralama)

```json
{ "MenuOrder": [
    { "type": "Corporate", "order": "2" },
    { "type": "FIB", "order": "1" },
    { "type": "MicroEnterprice", "order": "3" }
] }
```

---

## [DB4] VpStringResource (CommonDb)

Çoklu dil metin (resource / CMS içerik). **ChannelID = 10 zorunlu**, **CreateBy = 'T65714'**, **Status = 1**, **IsDeleted = 0**. Desteklenen diller: **en-US, tr-TR, ar-SA**.

### Alanlar

`ResourceType`, `CultureCode` (en-US/tr-TR/ar-SA), `ResourceKey`, `ResourceValue`, `Status`, `IsDeleted`, `ChannelID`, `CreateBy`.

### ResourceType Örnekleri

| ResourceType | Ne İçin | Örnek Key |
|---------------|---------|-----------|
| `MobileMenu` | Menü başlık/açıklama | `PaymentMenuTitle` |
| `GeneralResource` | Genel uygulama metni | `SuccessMessage` |
| `DigitalConfirmTemplate{ID}` | Dijital onay mesajı | `ConfirmationText` |

### Kurallar

1. `ResourceKey` her ResourceType içinde benzersiz.
2. **3 dil için de** kayıt eklenir (en-US, tr-TR, ar-SA).
3. `ChannelID = 10`, `Status = 1`, `IsDeleted = 0` sabit.

### Insert Şablonu (her dil için)

```sql
---Lang:tr-TR---
IF NOT EXISTS(Select * from vpStringResource where ResourceType='{ResourceType}' and CultureCode='tr-TR' and ResourceKey='{ResourceKey}' and ChannelID=10)
BEGIN
INSERT INTO vpStringResource(ResourceType,CultureCode,ResourceKey,ResourceValue,Status,IsDeleted,ChannelID,CreateBy)
VALUES ('{ResourceType}','tr-TR','{ResourceKey}','{ResourceValueTR}',1,0,10,'T65714')
END
-- en-US ve ar-SA için aynı blok (ResourceValueEN / ResourceValueAR ile)
```

### Kontrol Sorguları

```sql
-- Eklenen kayıtlar
SELECT * FROM vpStringResource
WHERE ResourceKey = '{ResourceKey}' AND ResourceType = '{ResourceType}' AND ChannelID = 10
ORDER BY CultureCode;

-- Eksik diller
SELECT CultureCode FROM (VALUES ('en-US'),('tr-TR'),('ar-SA')) AS Langs(CultureCode)
WHERE CultureCode NOT IN (
  SELECT CultureCode FROM vpStringResource
  WHERE ResourceKey = '{ResourceKey}' AND ResourceType = '{ResourceType}' AND ChannelID = 10
);
```

---

## [DB5] VpTransaction + VpTransactionConfig + VpTransactionAttributes (CommonDb)

Servis (transaction) tanımı **3 tabloya birden** eklenir. **ChannelID = 10**, **CreateBy/LastActionUser = 'T65714'**.

### Zorunlu Alanlar

| Tablo | Anahtar Alanlar |
|-------|------------------|
| VpTransaction | `TransactionName` (benzersiz), `Description`, `LastActionUser='T65714'`, `IsFinancial=0` (varsayılan), `isLead=0` |
| VpTransactionConfig | `ChannelID=10`, `Configuration` (XML), `CreateBy='T65714'` |
| VpTransactionAttributes | `ChannelID=10`, `IsEnabled=1`, `IsHistoryLoggingEnabled=1`, `LoggingVerbosity=1111`, `HostCallLogVerbosity=11`, `HostProcessCode=100000`, `IsOTPRequired` (0/1) |

### Insert Şablonu (3 tablo)

```sql
-- 1) VpTransaction
IF NOT EXISTS(Select * from VpTransaction where TransactionName='{ServisAdi}')
BEGIN
INSERT INTO [dbo].[VpTransaction]([TransactionName],[Description],[LastActionDate],[LastActionUser],[LastAction],[TransactionTypeId],[IsFinancial],[IsInquiry],[HostGroupType],[isCross],[isLead],[isVirtual],[IsInternetBankingTransaction],[IsTransactionBasedLoggingEnabled])
VALUES('{ServisAdi}','{ServisAciklamasi}',getDate(),'T65714',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL)
END

-- 2) VpTransactionConfig (XML Configuration)
IF NOT EXISTS(select * from VpTransactionConfig where ChannelID=10 and TransactionID=(select ID from VpTransaction where TransactionName='{ServisAdi}'))
BEGIN
INSERT INTO VpTransactionConfig(TransactionID,Configuration,ChannelProductOID,CreateDate,CreateBy,ChannelID)
VALUES((select ID from VpTransaction where TransactionName='{ServisAdi}'),
'<?xml version="1.0" encoding="utf-8"?>
<TransactionConfig xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://tempuri.org/VeriBranchMessages.xsd">
 <TransactionFlow><Step Name="Start" Action="RedirectToPage" StepNameResourceKey="Start"></Step></TransactionFlow>
 <ImplementationData>
  <RequestType>VeriBranch.Common.MessageDefinitions.{ServisAdi}Request,VeriBranch.Common.MessageDefinitions</RequestType>
  <ResponseType>VeriBranch.Common.MessageDefinitions.{ServisAdi}Response,VeriBranch.Common.MessageDefinitions</ResponseType>
  <ClassType>Finansbank.Business.Transactions.HostIntegrationTransaction, Finansbank.Business.Transactions</ClassType>
 </ImplementationData>
 <Name>{ServisAdi}</Name><Simulate>false</Simulate>
</TransactionConfig>', NULL,getdate(),'T65714',10)
END

-- 3) VpTransactionAttributes
IF NOT EXISTS (select * from VpTransactionAttributes where ChannelID=10 and TransactionID=(select ID from VpTransaction where TransactionName='{ServisAdi}'))
BEGIN
INSERT INTO VpTransactionAttributes(TransactionID,ChannelID,IsDeleted,IsOTPRequired,FraudType,IsHistoryLoggingEnabled,LoggingVerbosity,IsPerformanceCounterEnabled,IsEnabled,FraudState,HostCallLogVerbosity,HostProcessCode,DescriptionForChannel,TransactionType,CreateDate,CreateBy,ModifyDate,ModifyBy,TrustedDeviceCheckEnabled,LogLifetime)
VALUES((select ID from VpTransaction where TransactionName='{ServisAdi}'),10,0,0,NULL,1,1111,0,1,NULL,11,100000,'{ServisAciklamasi}',null,null,null,null,null,null,null)
END
```

### Tam Durum Kontrolü

```sql
SELECT t.TransactionName, t.Description,
  CASE WHEN tc.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END as ConfigVarMi,
  CASE WHEN ta.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END as AttributesVarMi,
  CASE WHEN tc.ID IS NOT NULL AND ta.ID IS NOT NULL THEN 'TAMAM' ELSE 'EKSİK' END as TamDurum
FROM VpTransaction t
LEFT JOIN VpTransactionConfig tc ON t.ID=tc.TransactionID AND tc.ChannelID=10
LEFT JOIN VpTransactionAttributes ta ON t.ID=ta.TransactionID AND ta.ChannelID=10
WHERE t.TransactionName='{ServisAdi}';
```

---

## [DB6] MCS Mapping — VpVeriBranchHostCallMappingView + VpHostCallMappingDetail (CommonDb)

MCS servislerin host sistemlerine mapping'i + request/response parametreleri. **ÖNEMLİ İSTİSNA: bu iki tabloda ChannelID filtresi GEREKMEZ.** CommonDb'dedir.

### VpVeriBranchHostCallMappingView (Ana Mapping)

`ID` (PK), `VeribranchTransactionName`, `HostCallMappingID`, `IsActive`, `CreateDate`, `ModifyDate`.

### VpHostCallMappingDetail (Detay — Input/Output Parametreleri)

`HostCallMappingID` (ana mapping bağlantısı), `ParameterName`, `ParameterValue`, `ParameterType`, `IsRequired`, `OrderIndex`.

### Sorgular

```sql
DECLARE @myvar char(70); SET @myvar = '{ServisAdi}';

-- Ana mapping
SELECT * FROM dbo.VpVeriBranchHostCallMappingView WHERE VeribranchTransactionName = @myvar;

-- Detay mapping (parametre listesi)
SELECT vhmd.ParameterName, vhmd.ParameterValue, vhmd.ParameterType, vhmd.IsRequired, vhmd.OrderIndex
FROM dbo.VpHostCallMappingDetail vhmd
INNER JOIN dbo.VpVeriBranchHostCallMappingView vbhcmv ON vhmd.HostCallMappingID = vbhcmv.ID
WHERE vbhcmv.VeribranchTransactionName = @myvar
ORDER BY vhmd.OrderIndex;

-- Mapping var mı
SELECT CASE WHEN COUNT(*)>0 THEN 'VAR' ELSE 'YOK' END as MappingDurumu, COUNT(*) as MappingSayisi
FROM dbo.VpVeriBranchHostCallMappingView WHERE VeribranchTransactionName = '{ServisAdi}';
```

### Kurallar

- Servis adı **case-sensitive** olabilir.
- Aktif mapping kontrolü: `IsActive = 1`.
- `char(70)` boyut sınırına dikkat (DECLARE @myvar).
- View ve Detail birlikte kullanılır.
- Bu mapping (modül 10 [C17]) MCS input/output/çağrı zinciri analizinin kaynağıdır.

---

## [DB7] MobileDefaultLog — Log Tabloları

Oturum, işlem, hata ve özet log'lar. **ChannelID kuralı geçerli** (kullanıcı belirtmezse 10).

### Tablo İlişkileri

```
VpMobileContact (ContactID, SessionID)
   ↓ (ContactID = MobileContactID)
VpMobileContactHistory (ContactHistoryID)
   ↓ (ContactHistoryID)
VpDefaultLog (TxnUniqueID, SessionID)
   ↓ (TxnUniqueID, SessionID)
VpExceptionLog & VpTransactionHistoryLog
```

### VpMobileContact (Ana Oturum)

Oturum başlangıç + device + güvenlik. Alanlar: `ContactID`(36, PK), `SessionID`(36), `CustomerUserCode`, `DeviceName`, `OSVersion`, `Build`, `IsRoot`, `IsEmulator`, `CreateDate`, `LogoutTime`, `IPAddress`, `ClientIP`, `ChannelID`. → Platform dağılımı, root/emulator tespiti, oturum süresi, günlük aktif kullanıcı.

### VpMobileContactHistory (İşlem Geçmişi)

İşlem özet + performans. Alanlar: `MobileContactID`(→ContactID), `ContactHistoryID`(36), `TransactionName`, `MainTransactionName`, `Amount`, `Commission`, `FxCode`, `StartTime`, `EndTime`, `Duration`, `TransactionResult`(1/0), `InsertDate`, `ChannelID`. → Popüler işlemler, başarı oranı, yavaş işlemler, mali hacim.

### VpDefaultLog (Detaylı İşlem Log)

En detaylı kayıt + input/output. Alanlar: `ContactID`, `ContactHistoryID`, `TransactionID`, `TxnUniqueID`, `SessionID`, `CoreSessionID`, `TransactionNameDetailed`, `TransactionTime`, `TransactionResult`, `XmlInputData`, `XmlOutputData`, `ErrorData`, `ResponseData`, `MethodType` (1:Start, 3:Execute, 4:Fetch), `Amount`, `FxCode`, `ChannelID`. → TxnUniqueID detay analizi, hata mesajı, input/output, core entegrasyon.

### VpExceptionLog (Hata)

Alanlar: `SessionID`, `TxnUniqueID`, `ErrorType`, `Message`, `Exception`, `StackTrace`, `TransactionName`, `ExecutingTransactionName`, `ExceptionDate`, `ChannelID`, `ClientIP`, `ServerName`, `IsCritical`. → Son 24 saat hatalar, platform bazlı hata, kritik hata etkisi.

### VpTransactionHistoryLog (Özet)

Alanlar: `TxnUniqueID`, `SessionID`, `CustomerUserCode`, `ChannelID`, `IsSuccess`(1/0), `CoreExceptionID`, `Date`, `TransactionName`. → Hızlı başarı oranı, günlük işlem sayısı, kanal bazlı analiz.

### Analiz Senaryoları (Hangi Tablo)

| Senaryo | Ana Tablo | Bağlantı |
|---------|-----------|----------|
| SessionID analizi | VpMobileContact | History → DefaultLog → ExceptionLog |
| Hata analizi | VpExceptionLog | MobileContact + DefaultLog |
| Performans (yavaş işlem) | VpMobileContactHistory (`Duration`, `TransactionResult`) | MobileContact |
| Kullanıcı analizi | VpMobileContact.`CustomerUserCode` | Tümü |
| Mali işlem | VpMobileContactHistory + VpDefaultLog (`Amount`, `FxCode`, `Commission`) | — |
| Zaman bazlı | CreateDate / StartTime / TransactionTime / ExceptionDate | — |

### Performans İpuçları

- **Index'li alanlar:** her tabloda `ChannelID` + tarih + SessionID/ContactID/TxnUniqueID.
- Tarih filtreleme: `>= DATEADD(DAY, -7, GETDATE())`; **`DATEDIFF`'i WHERE'de kullanma** (index kullanmaz).
- JOIN: en küçük setten başla (genelde VpMobileContact); DISTINCT'i minimize et; her JOIN'de ChannelID kontrol et.

### Örnek

```sql
SELECT * FROM VpExceptionLog
WHERE ExceptionDate >= DATEADD(HOUR, -12, GETDATE()) AND ChannelID = 10;
```

---

## [DB8] Sabitler ve MCP Kullanımı

| Sabit | Değer |
|-------|-------|
| CreateBy / LastActionUser | `'T65714'` |
| Mobil ChannelID | `10` |
| Diller | en-US, tr-TR, ar-SA |
| Status / IsDeleted (resource) | 1 / 0 |
| LoggingVerbosity / HostCallLogVerbosity / HostProcessCode | 1111 / 11 / 100000 |

**MCP çağrı:**

```
mcp_mcp-mssql-db-operations_read_data:  databaseName "CommonDb" | "MobileDefaultLog", sql (ChannelID filtreli)
mcp_mcp-mssql-db-operations_update_data: databaseName "CommonDb", sql (IF NOT EXISTS + ChannelID=10 + CreateBy='T65714')
```

> Sorguda yalnızca gerekli kolonları SELECT et; tablo/kolon bilgisi uydurma — bu modülde yoksa kullanıcıya/DBA'ya sor.

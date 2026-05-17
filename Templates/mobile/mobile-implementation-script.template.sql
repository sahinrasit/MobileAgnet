-- =========================================================================
-- QNB Mobile Implementation Scripts — {{PROJE_ADI}}
-- =========================================================================
-- Proje:        {{PROJE_KODU}} — {{PROJE_ADI}}
-- Versiyon:     {{VERSIYON}}
-- Tarih:        {{TARIH}}
-- Hazırlayan:   {{HAZIRLAYAN}}
-- Ortam:        {{ORTAM}} (DEV / UAT / Production)
-- Kanal:        Mobil (ChannelID = 10)
-- Girdi:        docs/mobile-analiz.md (mobile-02 çıktısı)
-- =========================================================================
--
-- NOT: Bu script DBA ekibi tarafından prod ortamda manuel çalıştırılır.
--      mobile-05 agent script'i otomatik uygulamaz.
--      IF NOT EXISTS koruması her insert'te aktiftir (idempotent).
--      Rollback blokları comment olarak en sonda; manuel onay ile çalıştırılır.
--
-- =========================================================================
-- BÖLÜM 1: VpStringResource (Resource Key'ler — 3 Dil)
-- Veritabanı: CommonDb | ChannelID = 10 | CreateBy = 'T65714'
-- =========================================================================
--
-- NOT (mobile-05 üretim notu): Aşağıdaki placeholder'lar mobile-05 Adım 2.1'de
--      kullanıcıdan toplanan ResourceType + ResourceKey + 3 dil değerleriyle
--      doldurulur. Çıktıda {{...}} placeholder KALMAMALIDIR. Eksik değer varsa
--      ilgili satırın üstüne `-- TODO: ...` yorumuyla işaretlenir.
--
-- DOLDURULMUŞ ÖRNEK (rendered):
--
--   SELECT COUNT(*) AS MevcutResourceSayi FROM vpStringResource
--   WHERE ResourceType = 'MobileMenu'
--     AND ResourceKey = 'KartLimitDetay'
--     AND ChannelID = 10;
--
--   INSERT INTO vpStringResource (ResourceType, CultureCode, ResourceKey, ResourceValue,
--                                  Status, IsDeleted, ChannelID, CreateBy)
--   VALUES ('MobileMenu', 'tr-TR', 'KartLimitDetay', 'Kart Limit Detayı', 1, 0, 10, 'T65714');
--   ... (en-US, ar-SA için aynı şekilde)
--

-- Pre-Insert Kontrol
SELECT COUNT(*) AS MevcutResourceSayi FROM vpStringResource
WHERE ResourceType = '{{ResourceType}}'
  AND ResourceKey = '{{ResourceKey}}'
  AND ChannelID = 10;
-- Beklenen: 0 (3 dil için 3 satır eklenecek)

---Lang:en-US---
IF NOT EXISTS (
  SELECT 1 FROM vpStringResource
  WHERE ResourceType = '{{ResourceType}}'
    AND CultureCode = 'en-US'
    AND ResourceKey = '{{ResourceKey}}'
    AND ChannelID = 10
)
BEGIN
  INSERT INTO vpStringResource (ResourceType, CultureCode, ResourceKey, ResourceValue, Status, IsDeleted, ChannelID, CreateBy)
  VALUES ('{{ResourceType}}', 'en-US', '{{ResourceKey}}', '{{ResourceValueEN}}', 1, 0, 10, 'T65714');
END

---Lang:tr-TR---
IF NOT EXISTS (
  SELECT 1 FROM vpStringResource
  WHERE ResourceType = '{{ResourceType}}'
    AND CultureCode = 'tr-TR'
    AND ResourceKey = '{{ResourceKey}}'
    AND ChannelID = 10
)
BEGIN
  INSERT INTO vpStringResource (ResourceType, CultureCode, ResourceKey, ResourceValue, Status, IsDeleted, ChannelID, CreateBy)
  VALUES ('{{ResourceType}}', 'tr-TR', '{{ResourceKey}}', '{{ResourceValueTR}}', 1, 0, 10, 'T65714');
END

---Lang:ar-SA---
IF NOT EXISTS (
  SELECT 1 FROM vpStringResource
  WHERE ResourceType = '{{ResourceType}}'
    AND CultureCode = 'ar-SA'
    AND ResourceKey = '{{ResourceKey}}'
    AND ChannelID = 10
)
BEGIN
  INSERT INTO vpStringResource (ResourceType, CultureCode, ResourceKey, ResourceValue, Status, IsDeleted, ChannelID, CreateBy)
  VALUES ('{{ResourceType}}', 'ar-SA', '{{ResourceValueAR}}', 1, 0, 10, 'T65714');
  -- UYARI: ar-SA çevirisi eksikse mobile-05 buraya "PLACEHOLDER — çeviri sonra eklenecek" yazar
END

-- (Birden fazla ResourceKey varsa yukarıdaki 3 dil bloğu her key için tekrarlanır.)

-- =========================================================================
-- BÖLÜM 2: VpTransaction + Config + Attributes (3 Tablo Birlikte)
-- Veritabanı: CommonDb | ChannelID = 10 | CreateBy = 'T65714'
-- =========================================================================
--
-- NOT (mobile-05 üretim notu): mobile-05 Adım 2.4'te kullanıcıdan toplanan
--      TransactionName + Description + IsFinancial + HostProcessCode + IsOTPRequired
--      değerleriyle doldurulur. Çıktıda placeholder KALMAMALIDIR.
--
-- DOLDURULMUŞ ÖRNEK (rendered):
--
--   IF NOT EXISTS (SELECT 1 FROM VpTransaction WHERE TransactionName = 'GetCreditCardLimitDetail')
--   BEGIN
--     INSERT INTO [dbo].[VpTransaction] (...)
--     VALUES ('GetCreditCardLimitDetail', 'Kredi Kartı Limit Detayı Servisi',
--             GETDATE(), 'T65714', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL);
--   END
--   ... (VpTransactionConfig XML + VpTransactionAttributes aynı sırada)
--

-- Pre-Insert Kontrol
SELECT
  CASE WHEN t.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END AS TransactionVar,
  CASE WHEN tc.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END AS ConfigVar,
  CASE WHEN ta.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END AS AttributesVar
FROM (SELECT 1 AS Dummy) d
LEFT JOIN VpTransaction t ON t.TransactionName = '{{TransactionName}}'
LEFT JOIN VpTransactionConfig tc ON tc.TransactionID = t.ID AND tc.ChannelID = 10
LEFT JOIN VpTransactionAttributes ta ON ta.TransactionID = t.ID AND ta.ChannelID = 10;

-- VpTransaction
IF NOT EXISTS (SELECT 1 FROM VpTransaction WHERE TransactionName = '{{TransactionName}}')
BEGIN
  INSERT INTO [dbo].[VpTransaction]
    ([TransactionName], [Description], [LastActionDate], [LastActionUser], [LastAction],
     [TransactionTypeId], [IsFinancial], [IsInquiry], [HostGroupType], [isCross], [isLead],
     [isVirtual], [IsInternetBankingTransaction], [IsTransactionBasedLoggingEnabled])
  VALUES
    ('{{TransactionName}}', '{{ServisAciklamasi}}', GETDATE(), 'T65714', NULL,
     NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL);
END

-- VpTransactionConfig (XML Configuration)
IF NOT EXISTS (
  SELECT 1 FROM VpTransactionConfig
  WHERE ChannelID = 10
    AND TransactionID = (SELECT ID FROM VpTransaction WHERE TransactionName = '{{TransactionName}}')
)
BEGIN
  INSERT INTO VpTransactionConfig (TransactionID, Configuration, ChannelProductOID, CreateDate, CreateBy, ChannelID)
  VALUES (
    (SELECT ID FROM VpTransaction WHERE TransactionName = '{{TransactionName}}'),
    '<?xml version="1.0" encoding="utf-8"?>
<TransactionConfig xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                   xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                   xmlns="http://tempuri.org/VeriBranchMessages.xsd">
  <TransactionFlow>
    <Step Name="Start" Action="RedirectToPage" StepNameResourceKey="Start"></Step>
  </TransactionFlow>
  <ImplementationData>
    <RequestType>VeriBranch.Common.MessageDefinitions.{{TransactionName}}Request,VeriBranch.Common.MessageDefinitions</RequestType>
    <ResponseType>VeriBranch.Common.MessageDefinitions.{{TransactionName}}Response,VeriBranch.Common.MessageDefinitions</ResponseType>
    <ClassType>Finansbank.Business.Transactions.HostIntegrationTransaction,Finansbank.Business.Transactions</ClassType>
  </ImplementationData>
  <Name>{{TransactionName}}</Name>
  <Simulate>false</Simulate>
</TransactionConfig>',
    NULL, GETDATE(), 'T65714', 10);
END

-- VpTransactionAttributes
IF NOT EXISTS (
  SELECT 1 FROM VpTransactionAttributes
  WHERE ChannelID = 10
    AND TransactionID = (SELECT ID FROM VpTransaction WHERE TransactionName = '{{TransactionName}}')
)
BEGIN
  INSERT INTO VpTransactionAttributes
    (TransactionID, ChannelID, IsDeleted, IsOTPRequired, FraudType, IsHistoryLoggingEnabled,
     LoggingVerbosity, IsPerformanceCounterEnabled, IsEnabled, FraudState, HostCallLogVerbosity,
     HostProcessCode, DescriptionForChannel, TransactionType, CreateDate, CreateBy, ModifyDate,
     ModifyBy, TrustedDeviceCheckEnabled, LogLifetime)
  VALUES
    ((SELECT ID FROM VpTransaction WHERE TransactionName = '{{TransactionName}}'),
     10, 0, 0, NULL, 1, 1111, 0, 1, NULL, 11, 100000, '{{ServisAciklamasi}}',
     NULL, NULL, NULL, NULL, NULL, NULL, NULL);
END

-- =========================================================================
-- BÖLÜM 3: MobileMenu
-- Veritabanı: CommonDb | ChannelID = 10
-- =========================================================================
--
-- NOT (mobile-05 üretim notu): mobile-05 Adım 2.2'de kullanıcıdan toplanan
--      MenuID + ParentID + Title (Adım 2.1 ResourceKey) + TransactionName + AllUser
--      + IsMenuStep/Root + Configuration JSON (iOS/Android/Huawei build numaraları,
--      PilotKey, ReversePilot) + Validation JSON (FilterKey/Value/ActionType)
--      değerleriyle doldurulur. Configuration ve Validation JSON'larını agent
--      kullanıcı cevaplarından kendi oluşturur — kullanıcı JSON yazmaz.
--
-- DOLDURULMUŞ ÖRNEK (rendered) — sayfa açan child menü:
--
--   IF NOT EXISTS (SELECT 1 FROM MobileMenu WHERE MenuID = 18001234 AND ChannelID = 10)
--   BEGIN
--     INSERT INTO MobileMenu
--       (ParentID, MenuID, Title, TransactionName, DescriptionName, EnabledTR, EnabledEN,
--        IsMenuStep, IsMenuRoot, AllUser, Keywords, MenuAdress, SearchOrderIndex,
--        Configuration, Validation, CorporateOrder, ChannelID, CreateBy)
--     VALUES
--       (18001100, 18001234, 'KartLimitDetay', 'GetCreditCardLimitDetail',
--        'Kart Limit Detay Sayfası', 1, 1, 0, 0, 1,
--        'limit,kart,detay', 'Ana Menü > Kartlar > Limit Detayı', 50,
--        '{"AndroidMenuItem":{"MenuVisible":"1","LightLoginEnable":"1","MinBuildNumber":"259","ClassName":"com.bank.app.CreditCardLimitActivity","PilotKey":"CreditCardLimitPilot","ReversePilot":false},"IosMenuItem":{"MenuVisible":"1","LightLoginEnable":"1","MinBuildNumber":"207","StoryboardName":"CardLimitStoryboard","ViewControllerId":"CardLimitVC","ClassName":"CardLimitVC","Bundle":"CardModule","PilotKey":"CreditCardLimitPilot","ReversePilot":false}}',
--        '{"ClientValidationList":[{"Rule":[{"FilterKey":"IsAvailableDigitalConfirm","FilterValue":"1","FilterOperation":"equal","ActionType":"0","ActionMessage":"","ActionResultType":""}]}]}',
--        NULL, 10, 'T65714');
--   END
--

-- Pre-Insert Kontrol
SELECT COUNT(*) AS MevcutMenu FROM MobileMenu
WHERE MenuID = {{MenuID}} AND ChannelID = 10;

IF NOT EXISTS (SELECT 1 FROM MobileMenu WHERE MenuID = {{MenuID}} AND ChannelID = 10)
BEGIN
  INSERT INTO MobileMenu
    (ParentID, MenuID, Title, TransactionName, DescriptionName, EnabledTR, EnabledEN,
     IsMenuStep, IsMenuRoot, AllUser, Keywords, MenuAdress, SearchOrderIndex,
     Configuration, Validation, CorporateOrder, ChannelID, CreateBy)
  VALUES
    ({{ParentID}}, {{MenuID}}, '{{TitleResourceKey}}', '{{TransactionName_VeyaNULL}}',
     '{{DescriptionName}}', 1, 1, {{IsMenuStep}}, {{IsMenuRoot}}, {{AllUser_1_2_3}},
     '{{Keywords}}', '{{MenuAdress}}', {{SearchOrderIndex}},
     '{{ConfigurationJSON}}',
     '{{ValidationJSON}}',
     '{{CorporateOrderJSON}}',
     10, 'T65714');
END

-- =========================================================================
-- BÖLÜM 4: MobileMenuMapping (Pano / NBT / 3D Touch / Spotlight / Pega / vb.)
-- Veritabanı: CommonDb | ChannelID = 10
-- =========================================================================
--
-- NOT (mobile-05 üretim notu): mobile-05 Adım 2.3'te kullanıcıdan toplanan
--      seçili MenuType'lar (1=Pano, 2=Mandatory, 9=3D Touch, 10=Spotlight,
--      12=NBT, 13=Pega, 14=Hızlı Erişim, 15=Başvuru Merkezi — 11 rezerve!) ve
--      her tip için ReferenceID + ParentMenu değerleriyle doldurulur. Tek
--      menünün birden fazla MenuType'a eklenmesi durumunda her MenuType
--      için ayrı INSERT bloğu üretilir.
--
-- DOLDURULMUŞ ÖRNEK (rendered) — bir menünün Pano + NBT'ye eklenmesi:
--
--   IF NOT EXISTS (SELECT 1 FROM MobileMenuMapping WHERE MenuID = 18001234 AND MenuType = 1 AND ChannelID = 10)
--   BEGIN
--     INSERT INTO MobileMenuMapping (ReferenceID, MenuID, MenuType, ParentMenu, Validation, TitleKey, ChannelID, CreateBy)
--     VALUES (5001, 18001234, 1, 0, NULL, 'KartLimitDetay', 10, 'T65714');
--   END
--
--   IF NOT EXISTS (SELECT 1 FROM MobileMenuMapping WHERE MenuID = 18001234 AND MenuType = 12 AND ChannelID = 10)
--   BEGIN
--     INSERT INTO MobileMenuMapping (ReferenceID, MenuID, MenuType, ParentMenu, Validation, TitleKey, ChannelID, CreateBy)
--     VALUES (7002, 18001234, 12, 0, NULL, 'KartLimitDetay', 10, 'T65714');
--   END
--

-- Pre-Insert Kontrol
SELECT COUNT(*) AS MevcutMapping FROM MobileMenuMapping
WHERE MenuID = {{MenuID}} AND MenuType = {{MenuType}} AND ChannelID = 10;

IF NOT EXISTS (
  SELECT 1 FROM MobileMenuMapping
  WHERE MenuID = {{MenuID}} AND MenuType = {{MenuType}} AND ChannelID = 10
)
BEGIN
  INSERT INTO MobileMenuMapping
    (ReferenceID, MenuID, MenuType, ParentMenu, Validation, TitleKey, ChannelID, CreateBy)
  VALUES
    ({{ReferenceID}}, {{MenuID}}, {{MenuType}}, {{ParentMenu_0_1}},
     '{{ValidationJSON_VeyaNULL}}', '{{TitleKey}}', 10, 'T65714');
END

-- NOT: MenuType 11 rezerve / kullanım dışı — bu satıra MenuType = 11 YAZILMAZ.
-- Geçerli MenuType değerleri: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15.

-- =========================================================================
-- BÖLÜM 5: MCS Mapping Referans Sorgusu (DBA için bilgi)
-- =========================================================================
-- Bu bölüm INSERT içermez. MCS mapping ayrı bir ekip tarafından yönetilir.
-- Aşağıdaki sorgular DBA / MCS ekibi için mevcut mapping durumunu kontrol eder.

DECLARE @ServisAdi CHAR(70);
SET @ServisAdi = '{{TransactionName}}';

-- Ana mapping
SELECT * FROM dbo.VpVeriBranchHostCallMappingView
WHERE VeribranchTransactionName = @ServisAdi;

-- Detay mapping
SELECT vhmd.* FROM dbo.VpHostCallMappingDetail vhmd
INNER JOIN dbo.VpVeriBranchHostCallMappingView vbhcmv
  ON vhmd.HostCallMappingID = vbhcmv.ID
WHERE vbhcmv.VeribranchTransactionName = @ServisAdi;

-- =========================================================================
-- BÖLÜM 6: Post-Insert Doğrulama
-- =========================================================================

-- VpStringResource
SELECT ResourceType, CultureCode, ResourceKey, ResourceValue, Status, ChannelID
FROM vpStringResource
WHERE ResourceKey = '{{ResourceKey}}'
  AND ChannelID = 10
ORDER BY CultureCode;
-- Beklenen: 3 satır (en-US, tr-TR, ar-SA)

-- VpTransaction Tam Durum
SELECT
  t.TransactionName,
  t.Description,
  CASE WHEN tc.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END AS ConfigVarMi,
  CASE WHEN ta.ID IS NOT NULL THEN 'VAR' ELSE 'YOK' END AS AttributesVarMi,
  CASE WHEN tc.ID IS NOT NULL AND ta.ID IS NOT NULL THEN 'TAMAM' ELSE 'EKSIK' END AS TamDurum
FROM VpTransaction t
LEFT JOIN VpTransactionConfig tc ON t.ID = tc.TransactionID AND tc.ChannelID = 10
LEFT JOIN VpTransactionAttributes ta ON t.ID = ta.TransactionID AND ta.ChannelID = 10
WHERE t.TransactionName = '{{TransactionName}}';
-- Beklenen: TamDurum = 'TAMAM'

-- MobileMenu + Mapping
SELECT m.MenuID, m.Title, m.TransactionName, m.EnabledTR, m.EnabledEN, m.AllUser,
       mm.MenuType, mm.ReferenceID
FROM MobileMenu m
LEFT JOIN MobileMenuMapping mm ON mm.MenuID = m.MenuID AND mm.ChannelID = 10
WHERE m.MenuID = {{MenuID}} AND m.ChannelID = 10;

-- =========================================================================
-- BÖLÜM 7: ROLLBACK (Manuel onay sonrası çalıştır — comment'li)
-- =========================================================================
-- DİKKAT: Aşağıdaki satırlar comment'li. Sadece kullanıcı / DBA manuel onayı
--         sonrası comment'i kaldırarak çalıştırılır.

-- Rollback — VpStringResource
-- DELETE FROM vpStringResource
-- WHERE ResourceKey = '{{ResourceKey}}'
--   AND ResourceType = '{{ResourceType}}'
--   AND ChannelID = 10;

-- Rollback — VpTransactionAttributes
-- DELETE FROM VpTransactionAttributes
-- WHERE TransactionID = (SELECT ID FROM VpTransaction WHERE TransactionName = '{{TransactionName}}')
--   AND ChannelID = 10;

-- Rollback — VpTransactionConfig
-- DELETE FROM VpTransactionConfig
-- WHERE TransactionID = (SELECT ID FROM VpTransaction WHERE TransactionName = '{{TransactionName}}')
--   AND ChannelID = 10;

-- Rollback — VpTransaction
-- DELETE FROM VpTransaction
-- WHERE TransactionName = '{{TransactionName}}';

-- Rollback — MobileMenuMapping
-- DELETE FROM MobileMenuMapping
-- WHERE MenuID = {{MenuID}} AND ChannelID = 10;

-- Rollback — MobileMenu
-- DELETE FROM MobileMenu
-- WHERE MenuID = {{MenuID}} AND ChannelID = 10;

-- =========================================================================
-- Script Sonu — {{TARIH}}
-- =========================================================================

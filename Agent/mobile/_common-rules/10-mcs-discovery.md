# Common-Rules — 10: MCS Servis Input / Output / Çağrı Zinciri Çıkarımı

> İçerik [C17] (5 adımlı MCS analiz yöntemi).

Bir MCS TransactionName için **input alanları, output alanları, hangi mwbackend bileşeninde hangi alanın kullanıldığı, çağrı zinciri** aşağıdaki 5 adımlı yöntemle çıkarılır. mobile-01 (mevcut MCS), mobile-02 (yeni / değişen MCS), mobile-04 (etki yüzeyi) tarafından kullanılır.

## [C17.1] Adım 1 — Mobil Kanalda (ChannelID = 10) Servis Tanımı Kontrol

```sql
SELECT t.TransactionName, tc.Configuration AS XmlConfig
FROM VpTransaction t
INNER JOIN VpTransactionConfig tc ON tc.TransactionID = t.ID
WHERE t.TransactionName = '{{TransactionName}}'
  AND tc.ChannelID = 10;
```

- **Sonuç var:** XML config'ten `RequestType` ve `ResponseType` çıkarılır. Adım 3'e git.
- **Sonuç YOK:** Adım 2'ye git (diğer kanal fallback).

## [C17.2] Adım 2 — Diğer Kanal Fallback

```sql
SELECT t.TransactionName, tc.ChannelID, tc.Configuration AS XmlConfig
FROM VpTransaction t
INNER JOIN VpTransactionConfig tc ON tc.TransactionID = t.ID
WHERE t.TransactionName = '{{TransactionName}}';
```

**Yorum:**

- Web (20)'de varsa: input/output yapısı web ile aynı; mobil için "tanım eklenmesi gerekiyor" notu.
- CC (30) varsa: kanal bağımsız çoğunlukla aynı.
- Hiçbir kanalda yoksa: servis henüz mwbackend tanımlı değil; semantic-search ile `MCSVeribranchBI` tarafında bul.

## [C17.3] Adım 3 — Parametre Detayları (Host Mapping)

```sql
DECLARE @t CHAR(70); SET @t = '{{TransactionName}}';

SELECT vbhcmv.*
FROM dbo.VpVeriBranchHostCallMappingView vbhcmv
WHERE vbhcmv.VeribranchTransactionName = @t;

SELECT vhmd.ParameterName, vhmd.ParameterValue, vhmd.ParameterType,
       vhmd.IsRequired, vhmd.OrderIndex
FROM dbo.VpHostCallMappingDetail vhmd
INNER JOIN dbo.VpVeriBranchHostCallMappingView vbhcmv
  ON vhmd.HostCallMappingID = vbhcmv.ID
WHERE vbhcmv.VeribranchTransactionName = @t
ORDER BY vhmd.OrderIndex;
```

`ParameterName` listesi servisin gerçek input/output alan adlarıdır.

## [C17.4] Adım 4 — mwbackend'de Alan Kullanımı

```
search_code(
  query: "{{TransactionName}}Request kullanım Handler UseCase",
  extensionFilter: [".cs"],
  scopeProject: "mobilebanking",
  limit: 25
)

search_code(
  query: "{{TransactionName}}Response field mapping",
  extensionFilter: [".cs"],
  scopeProject: "mobilebanking",
  limit: 25
)
```

**İnceleme örnekleri:**

| Bulgu | Yorum |
|--------|-------|
| `{{TXN}}Request.CustomerNo = ...` Handler içinde set | CustomerNo MCS'e gönderilen input |
| `var x = response.Cards.Select(c => c.MaskedPan)` UseCase içinde | Cards[].MaskedPan clienta dönüyor |
| `if (response.IsSuccess) { ... }` Handler içinde | IsSuccess başarı kontrolü |

## [C17.5] Adım 5 — Çağrı Zinciri Inferansı

```
search_code(
  query: "{{Konu/Senaryo}} TransactionNameConstants Execute",
  extensionFilter: [".cs"],
  scopeProject: "mobilebanking",
  limit: 25
)
```

Aynı dosya / UseCase içinde birden fazla `TransactionNameConstants.X` görüldüğünde **çağrı zinciri tablosu** çıkarılır:

| Sıra | TransactionName | Kaynak | Amaç |
|------|------------------|---------|------|
| 1 | GetCustomerInfo | UseCase X | Müşteri doğrulama |
| 2 | GetCreditCardList | UseCase X | Asıl kart listesi |
| 3 | GetCardLimitInfo | UseCase X | Her kart için limit detayı |

**Karar dalları:** `if (response.ShortFlow)` veya `switch (cardStatus)` bulduğunda ShortFlow/LongFlow gibi alt akışlar ayrı incelenir.

## [C17.6] Çıktıya Yansıtma

3 tablo ile yansıtılır (template'lerde hazır iskelet var):

**Tablo A — Servis Tanım Durumu:**

| Alan | Değer | Kaynak |
|------|-------|--------|
| TransactionName | `{{ad}}` | VpTransaction |
| ChannelID = 10 tanımlı mı? | Evet / Hayır + hangi kanaldan fallback | VpTransactionConfig |
| RequestType | `VeriBranch.Common.MessageDefinitions.{{Ad}}Request` | XML Config |
| ResponseType | `VeriBranch.Common.MessageDefinitions.{{Ad}}Response` | XML Config |
| HostProcessCode | `100000` (veya farklıysa o değer) | VpTransactionAttributes |

**Tablo B — Input / Output Alanları:**

| Yön | Alan Adı | Tip | Zorunlu | mwbackend Kullanım Yeri |
|------|-----------|-----|----------|----------------------------|

**Tablo C — Çağrı Zinciri:**

| Sıra | TransactionName | UseCase / Handler | Karar Koşulu |
|------|------------------|---------------------|---------------|

> **Eksik bilgi:** Adımlar sonuç dönmezse `[BELIRSIZ]` etiketle ve AskUserQuestion ile kullanıcıya sor (modül 07 "Teknik & Servis" kategorisi).

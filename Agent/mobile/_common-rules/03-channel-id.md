# Common-Rules — 03: ChannelID Kuralı

> İçerik [C3] (esnek default + sabit kanal tabloları).

**TÜM CommonDb ve MobileDefaultLog sorgularında ChannelID filtresi ZORUNLU.**

| Senaryo | Kullanılacak Değer |
|---------|----------------------|
| Kullanıcı kanal belirtmedi | **`ChannelID = 10`** (Mobil — varsayılan) |
| Kullanıcı "web kanal için de bakalım" dedi | `ChannelID = 20` (Web) |
| Kullanıcı CC için sordu | `ChannelID = 30` |
| Kullanıcı ATM için sordu | `ChannelID = 40` |
| Kullanıcı şube için sordu | `ChannelID = 50` |

**ASLA `ChannelID` filtresi olmadan sorgu YAPILMAZ.**

**Sabit ChannelID = 10 olan tablolar (mobil özelinde override edilmez):**

- VpStringResource
- MobileMenu
- MobileMenuMapping
- VpTransactionConfig
- VpTransactionAttributes

**Diğer kanal fallback (MCS analizi için, modül 10 [C17]):** Bir MCS servis ChannelID = 10'da tanımlı değilse, sırasıyla 20 → 30 → 40 → 50 fallback ile input/output yapısı öğrenilir. Mobil için "tanım eklenmesi gerekiyor" notu çıkarılır.

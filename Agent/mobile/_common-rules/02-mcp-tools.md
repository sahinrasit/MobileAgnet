# Common-Rules — 02: MCP Araç Seti

> İçerik [C2] (4 MCP listesi, tool isimleri, parametre şemaları).

Mobil agentlar yalnızca aşağıdaki 4 MCP'yi kullanır. **Azure DevOps kod araması (mcp-code-search / azure-search-code) YASAKTIR** — mobilde tek kod arama aracı semantic-search'tür.

| # | MCP | Asıl Tool Adı | Kullanım |
|---|-----|----------------|----------|
| 1 | **semantic-search** | `search_code` | Kod tabanı (mwbackend, ios, android, MCSVeribranchBI, smg) |
| 2 | **mcp-figma** | `get_file`, `get_node` | Figma ekran, komponent, resource key |
| 3 | **mcp-mssql-db-operations** | `mcp_mcp-mssql-db-operations_read_data`, `mcp_mcp-mssql-db-operations_update_data` | CommonDb / MobileDefaultLog tabloları |
| 4 | **mcp-atlassian** | `confluence_get_page` | Confluence (SDLC şablon, BDDK, SMG Wiki, POTA) |

## [C2.1] semantic-search — `search_code`

**ZORUNLU header'lar:**

- `X-Default-Project: mobilebanking`
- `X-Default-Branch: prod`

**Cluster'da indexli 5 proje:**

| Proje | Kapsam | Tipik Uzantı |
|-------|--------|---------------|
| **mwbackend** | DDD backend (Application + Domain) | `.cs` |
| **ios** | iOS native client | `.swift` |
| **android** | Android native client | `.kt`, `.java` |
| **MCSVeribranchBI** | MCS servis tanımları | `.cs` |
| **smg** | mwbackend framework projesi | `.cs` |

**Tool şeması:**

```
search_code(
  query: "2-6 kelimelik anlamlı doğal dil / iş ifadesi — TR + EN karışık olabilir",
  limit: 20,
  extensionFilter: [".cs"],
  scopeProject: "mobilebanking"
)
```

**Query yazım:**

- Tek dosya adı veya tek token YASAK. En az iki anlamlı kelime; iş süreci + katman + konu.
- İyi örnekler: `kredi başvuru ekranı UseCase Handler`, `GetStringResource resource key handler`, `TransactionNameConstants MCS scoring`.
- YASAK: yalnızca `Something.cs`, yalnızca `search`, tek harf, sadece dosya yolu.

**Sonuç çok büyükse / kırpılırsa:** sorguyu daralt (somut class/TransactionName adı cümle içinde), yine en az iki anlamlı kelime tut.

**İteratif derinleştirme:** minimum 4-5 tur. Her bulunan class/metod/transaction adını bir sonraki turda cümle içinde kullan.

**Sonuç filtresi:**

- **DEĞERLİ (öncelik):** `.../UseCase/*.cs`, `.../Handler/*.cs`, `.../Helper/*.cs`, `.../Service/*.cs`, `.../Constant/*.cs`, `.../Model/*.cs`.
- **Client (sınırlı):** `*.swift`, `*.kt`, `*.java` — yalnızca UI bağlamı.
- **GÜRÜLTÜ (atla):** `*Test*.cs`, `*Lgcy*`, `*Legacy*`, generated dosyalar.

## [C2.2] mcp-mssql-db-operations

**Veritabanları:**

| DB | Tablolar |
|------|----------|
| **CommonDb** | MobileMenu, MobileMenuMapping, VpStringResource, VpTransaction, VpTransactionConfig, VpTransactionAttributes, VpVeriBranchHostCallMappingView, VpHostCallMappingDetail |
| **MobileDefaultLog** | VpMobileContact, VpMobileContactHistory, VpDefaultLog, VpExceptionLog, VpTransactionHistoryLog |

**Tool şeması:**

```
mcp_mcp-mssql-db-operations_read_data(
  databaseName: "CommonDb",
  sql: "SELECT ... WHERE ChannelID = 10"
)

mcp_mcp-mssql-db-operations_update_data(
  databaseName: "CommonDb",
  sql: "INSERT INTO ... VALUES (..., 10, 'T65714')"
)
```

> ChannelID kuralı için modül 03'e bak.

## [C2.3] mcp-figma

Figma linki opsiyoneldir. Verilmezse agent "Figma sağlanmadı — MSSQL menü taraması ve semantic search ile devam ediyorum" notuyla geçer. Verilirse ekran adları, komponent isimleri, resource key referansları çıkarılır; sonraki MSSQL taraması (VpStringResource) ile doğrulanır.

## [C2.4] mcp-atlassian

Sık başvurulan Confluence sayfa ID'leri:

| Sayfa | pageId | İçerik |
|-------|--------|--------|
| Proje Analizi Dokümanı Şablonu | 341516098 | BT_REQM00004 master |
| Proje Analiz Dokümanı Şablon Bilgileri | 41064380 | Detaylı dolum talimatları |
| MADDE 13 — İz kayıtlarının oluşturulması | 52235469 | BDDK Tebliği, 5 yıl saklama |
| Müşteri Bilgilendirme (SMG Wiki) | 8815310 | SMS/PN/Email yapısı |

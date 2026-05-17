# Common-Rules — 11: Hata Yönetimi (Yeni — [C18])

> Bu modül agentların MCP / dosya / kullanıcı tarafında karşılaştığı hatalarda nasıl davranacağını tanımlar.

## [C18.1] MCP Retry Politikası

| Hata Tipi | Davranış |
|-----------|----------|
| Geçici hata (5xx, network reset) | **1. retry** 3 saniye sonra, **2. retry** 8 saniye sonra, **3. retry** 20 saniye sonra |
| Timeout (>30 sn) | Kullanıcıya: "{MCP adı} bağlantısı yavaş, devam etmemi ister misiniz?" AskUserQuestion |
| 3 başarısız retry | `[BELIRSIZ — MCP erişilemiyor]` etiketle, dokümana not düş, sonraki adıma geç |
| 4xx (yetki / şema hatası) | retry yapma; kullanıcıya net hata mesajı + "MCP yapılandırmasını kontrol edin" |

## [C18.2] Pre-Flight Bağlantı Kontrolü

Her agent başında (Adım 0 öncesi) hızlı bağlantı testi yapılır:

```sql
-- mcp-mssql-db-operations
SELECT 1 AS PreFlight FROM VpTransaction WHERE 1=0 AND ChannelID = 10;
-- Sıfır satır döner ama bağlantı + ChannelID kuralı doğrulanır
```

```
-- semantic-search
search_code(
  query: "TransactionNameConstants",
  extensionFilter: [".cs"],
  scopeProject: "mobilebanking",
  limit: 1
)
-- En az 1 sonuç dönüyorsa cluster sağlıklı
```

```
-- mcp-figma (Figma linki verilmişse)
get_file(file_key: "{{FIGMA_KEY}}")
-- Hata dönüyorsa link özel veya erişim yok
```

```
-- mcp-atlassian
confluence_get_page(page_id: "341516098")
-- SDLC şablon sayfası erişilebiliyor mu
```

**Sonuç:**

- Tüm MCP'ler yeşil → Adım 0'a devam.
- Bir MCP kırmızı → kullanıcıya: "{MCP adı} erişilemiyor. Şunu yapabiliriz: (a) devam et — bu MCP'siz çalış (sınırlı), (b) durdur ve düzelt" AskUserQuestion.
- Birden fazla MCP kırmızı → durdur, kullanıcıya tam liste sun.

## [C18.3] Cevapsız Kalan AskUserQuestion

AskUserQuestion sonrası kullanıcı cevap vermezse (5 dakika+ inaktivite): agent otomatik devam etmez. Yeni session başladığında state dosyasından (modül 12) son AskUserQuestion'ı re-render eder: "Geçen seferden bu soru yanıtsız kalmıştı, devam edelim mi?"

## [C18.4] Dosya İşlem Hataları

| Hata | Davranış |
|------|----------|
| `Read` — dosya yok | Şu seçenekleri sun: (a) gerekli mi, (b) varsa farklı yolda olabilir mi, (c) atla ve `[ARASTIRILACAK]` etiketle |
| `Write` — yazma izni yok | Kullanıcıya yolu kontrol etmesini iste; agent durur |
| `Edit` — old_string bulunamadı | Önce dosyayı tekrar Read, hangi satır beklendiğini söyle, kullanıcıya manuel kontrol iste |

## [C18.5] Hata Raporlama Formatı

Agent her hatayı çıktı dokümanının son bölümünde "Hata ve Belirsizlik Raporu" altında listeler:

```markdown
### Hata ve Belirsizlik Raporu (Otomatik)

| # | Tip | Detay | Yeri | Etki |
|---|------|--------|------|------|
| 1 | MCP timeout | semantic-search 3 retry başarısız | Adım 5 Tur D | 4.1.Y.10 servis listesi eksik |
| 2 | [BELIRSIZ] | VpStringResource'da ar-SA yok | 3.4.5 CMS | Kullanıcıdan ar-SA değeri istenecek |
```

Bu rapor mobile-orchestrator tarafından okunarak "tamamlanmamış agent" tespit edilir.

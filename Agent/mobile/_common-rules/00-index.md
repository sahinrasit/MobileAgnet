# Common-Rules — 00: Index

> Mobil agentların tamamı için ortak kurallar. Bu klasör modüler dosyalardan oluşur; her agent yalnızca işine yarayan modülleri Read ile okur.

## Modül Listesi

| # | Modül | İçerik | Hangi Agent Okur |
|---|--------|--------|---------------------|
| 01 | [01-language-style.md](01-language-style.md) | Dil, yasaklar, stil, başlık silinmez ([C1], [C13], [C14], [C15]) | Tüm agentlar |
| 02 | [02-mcp-tools.md](02-mcp-tools.md) | 4 MCP, tool isimleri, parametre şemaları, 5 proje cluster ([C2]) | Tüm agentlar |
| 03 | [03-channel-id.md](03-channel-id.md) | ChannelID esnek kuralı, sabit kanal tabloları ([C3]) | mobile-01/02/04/05 |
| 04 | [04-repos-and-paths.md](04-repos-and-paths.md) | Repo yol konvansiyonu + dosya yolları ([C4], [C11]) | Tüm agentlar |
| 05 | [05-decision-matrix.md](05-decision-matrix.md) | 11 alt başlık karar matrisi, MenuType, parça stratejisi ([C5], [C9]) | mobile-01/02/03 |
| 06 | [06-askuser-question.md](06-askuser-question.md) | AskUserQuestion gerçek şeması, 4 seçenek stratejisi ([C6], [C6.1]) | Tüm agentlar |
| 07 | [07-questions-md.md](07-questions-md.md) | questions.md kategori → agent eşleme ([C7]) | Tüm agentlar |
| 08 | [08-agent-relations.md](08-agent-relations.md) | Agent zinciri, mobile-02 §3.4 ↔ mobile-04 ([C8]) | mobile-02, mobile-04, orchestrator |
| 09 | [09-changelog.md](09-changelog.md) | SemVer, Keep a Changelog formatı ([C12]) | Tüm agentlar (sunum öncesi) |
| 10 | [10-mcs-discovery.md](10-mcs-discovery.md) | 5 adımlı MCS input/output/çağrı zinciri analizi ([C17]) | mobile-01/02/04 |
| 11 | [11-error-handling.md](11-error-handling.md) | MCP retry, pre-flight, hata raporlama ([C18]) | Tüm agentlar |
| 12 | [12-state-recovery.md](12-state-recovery.md) | State dosyaları, çıktı doğrulama, AS-IS özet, rolling summary ([C19]) | Tüm agentlar |
| 13 | [13-preferences.md](13-preferences.md) | docs/.mobile-preferences.json tercih saklama ([C20]) | Tüm agentlar |
| 14 | [14-quality-gate.md](14-quality-gate.md) | Quality gate kriterleri, completeness raporu ([C21]) | Tüm agentlar + orchestrator |
| 15 | [15-db-reference.md](15-db-reference.md) | DB kanonik referansı — CommonDb + MobileDefaultLog tüm tablolar, kolonlar, sorgular, şablonlar ([DB1]-[DB8]) | DB işlemi yapan tüm agentlar (mobile-00/01/02/04/05) |
| 16 | [16-domain-conventions.md](16-domain-conventions.md) | Domain konvansiyonları — bildirim izni tek ortak noktadan yönetilir vb. ([C22]) | Tüm agentlar (özellikle mobile-00 + mobile-architect) |

## Hangi Modülü Ne Zaman Oku?

**Her agent başında (zorunlu):**
- 01 (dil/stil), 02 (MCP), 11 (pre-flight), 12 (state recovery), 13 (preferences), 16 (domain konvansiyonları)

**İhtiyaca göre:**
- 03 ChannelID: DB sorgusu varsa
- 04 Repos/paths: kod referansı veya çıktı dosyası oluşturulurken
- 05 Decision matrix: mobile-01/02/03 için (mobile-04/05 atlayabilir)
- 06 AskUserQuestion: kullanıcıya soru sorulduğunda
- 07 questions.md: belirsizlik etiketi atıldığında
- 08 Agent relations: mobile-04 (3.4 referansı) ve orchestrator için
- 09 Changelog: sunum öncesi
- 10 MCS Discovery: MCS servis analizi yapılırken (mobile-01/02/04 4.1.Y.10)
- 14 Quality gate: sunum öncesi completeness raporu
- 15 DB Reference: herhangi bir mcp-mssql sorgusu/insert'i yapmadan önce ilgili tablo bölümü ([DB2]-[DB7])

## Agent Başlangıç Kontrol Listesi

Her agent ilk adımda şu sırayı uygular:

1. `Read` _common-rules/00-index.md (bu dosya)
2. `Read` _common-rules/01-language-style.md
3. `Read` _common-rules/02-mcp-tools.md
4. `Read` _common-rules/11-error-handling.md
5. `Read` _common-rules/12-state-recovery.md (state varsa Adım 1.5'e atla)
6. `Read` _common-rules/13-preferences.md (preferences varsa kullan)
7. Agent-spesifik modülleri Read (yukarıdaki "İhtiyaca göre" listesi)
8. Pre-flight check (modül 11 [C18.2])
9. Agent workflow Adım 0'a geç

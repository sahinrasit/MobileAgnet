---
name: mobile-common-rules
description: QNB Mobile (mobilebanking) agentlarının tamamı için ortak kurallar (modüler — 15 dosya)
applies_to: mobile-01-analyze-as-is, mobile-02-write-analysis, mobile-03-write-test-cases, mobile-04-impact-analysis, mobile-05-write-implementation-scripts, mobile-orchestrator
---

# Mobile Agentlar — Ortak Kurallar (Index)

> Bu dosya **kısa index**'tir. Ortak kurallar `_common-rules/` klasöründeki 15 modüler dosyada tutulur. Her agent yalnızca işine yarayan modülleri Read ile okur — tek seferde 610 satır okunması engellenir.

## Modüller

[`_common-rules/00-index.md`](_common-rules/00-index.md) — Modül listesi, ne zaman ne okunmalı, agent başlangıç kontrol listesi

- 01 Dil & Stil ([C1], [C13], [C14], [C15])
- 02 MCP Tools ([C2])
- 03 ChannelID ([C3])
- 04 Repos & Paths ([C4], [C11])
- 05 Karar Matrisi ([C5], [C9])
- 06 AskUserQuestion ([C6], [C6.1])
- 07 questions.md ([C7])
- 08 Agent İlişkileri ([C8])
- 09 changelog.md ([C12])
- 10 MCS Discovery ([C17])
- 11 Hata Yönetimi ([C18])
- 12 State / Recovery ([C19])
- 13 Preferences ([C20])
- 14 Quality Gate ([C21])

## Slash Command Sözlüğü

| Komut | Agent | Çıktı |
|-------|-------|--------|
| `/mobile-orchestrator` | mobile-orchestrator | 01→02→03→04→05 ardışık akış |
| `/mobile-01-analyze-as-is` | mobile-01 | `docs/mobile-as-is-analiz.md` + `docs/.mobile-as-is-summary.json` |
| `/mobile-02-write-analysis` | mobile-02 | `docs/mobile-analiz.md` + `docs/mobile-developer-analiz.md` |
| `/mobile-03-write-test-cases` | mobile-03 | `docs/mobile-test-cases.md` |
| `/mobile-04-impact-analysis` | mobile-04 | `docs/mobile-etki-analizi.md` |
| `/mobile-05-write-implementation-scripts` | mobile-05 | `docs/mobile-implementation-scripts.sql` |

## İlk Adım — Tüm Agentlarda

Her agent workflow başlamadan önce şu modülleri sırasıyla Read eder:

1. `_common-rules/00-index.md` (bu klasörün rehberi)
2. `_common-rules/01-language-style.md`
3. `_common-rules/02-mcp-tools.md`
4. `_common-rules/11-error-handling.md` → **pre-flight check çalıştır**
5. `_common-rules/12-state-recovery.md` → **state dosyası varsa kurtarma sor**
6. `_common-rules/13-preferences.md` → **preferences varsa kullan**
7. Agent-spesifik modüller (00-index.md'deki "Hangi modülü ne zaman oku" listesine bak)

Pre-flight başarısız olursa kullanıcıyı bilgilendir ve workflow'u **başlatma**.

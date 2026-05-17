# Common-Rules — 08: Agent Aralarındaki İlişkiler

> İçerik [C8] (mobile-02 §3.4 ↔ mobile-04 rol ayrımı) + agent zinciri.

## Agent Zinciri ve Çıktı Bağımlılığı

```
mobile-01 (AS-IS)
   ↓ docs/mobile-as-is-analiz.md + docs/.mobile-as-is-summary.json
mobile-02 (Analiz + Developer Analiz)
   ↓ docs/mobile-analiz.md + docs/mobile-developer-analiz.md
mobile-03 (Test) ← mobile-02
   ↓ docs/mobile-test-cases.md
mobile-04 (Etki Analizi) ← mobile-02 §3.4
   ↓ docs/mobile-etki-analizi.md
mobile-05 (Implementation Script) ← mobile-02
   ↓ docs/mobile-implementation-scripts.sql
```

**Orchestrator akışı:** `mobile-orchestrator` agentı bu zinciri tek slash komutla tetikler; her geçişte AskUserQuestion ile onay alır.

## [C8] mobile-02 §3.4 ↔ mobile-04 Rol Ayrımı

İki agent **farklı şeyler üretir; içerik tekrarı değildir:**

| Kapsam | mobile-02 — 3.4 Bölümü | mobile-04 |
|--------|--------------------------|-------------|
| Konum | `docs/mobile-analiz.md` içinde 3.4 alt başlığı | Ayrı `docs/mobile-etki-analizi.md` dosyası |
| Format | 11 mobil-spesifik alt başlık (Kanal/Engelsiz/SAS/Chatbot/CMS/TTS-DYS/MDYS/Mevzuat/Anomali/EBHS/İngilizce) | QNB resmi etki analizi formu (Genel/Kanallar/Güvenlik/EDW/Test 5 kategori) |
| Detay | İşlev özelinde özetleme | Daraltılmış kapsam — POTA formu için detay |
| Sahibi | SDLC analiz dokümanı yazarı | Etki analizi sorumlusu |
| Zaman | Analiz dokümanı oluşurken | Discovery + analiz sonrası |

mobile-04 mobile-02'nin 3.4'üne **bağımlıdır ama tekrarı değildir.** mobile-04 çalıştırılırken mobile-02'nin 3.4 bölümü özet olarak okunur, mobile-04 ise POTA formunun mobil daraltılmış halini detaylı doldurur.

> mobile-04 başlangıcında `docs/mobile-analiz.md` 3.4'ü Read ile okur ve "3.4'te şu maddeler 'Evet' işaretli: ..." diye özetle başlar.

## Slash Command Sözlüğü

| Komut | Agent | Çıktı |
|-------|-------|--------|
| `/mobile-orchestrator` | mobile-orchestrator | 01→02→03→04→05 ardışık akış |
| `/mobile-01-analyze-as-is` | mobile-01 | `docs/mobile-as-is-analiz.md` + `docs/.mobile-as-is-summary.json` |
| `/mobile-02-write-analysis` | mobile-02 | `docs/mobile-analiz.md` + `docs/mobile-developer-analiz.md` |
| `/mobile-03-write-test-cases` | mobile-03 | `docs/mobile-test-cases.md` |
| `/mobile-04-impact-analysis` | mobile-04 | `docs/mobile-etki-analizi.md` |
| `/mobile-05-write-implementation-scripts` | mobile-05 | `docs/mobile-implementation-scripts.sql` |

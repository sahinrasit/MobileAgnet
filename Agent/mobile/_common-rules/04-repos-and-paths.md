# Common-Rules — 04: Repository Yolları ve Dosya Konvansiyonu

> İçerik [C4] (repo yapısı) + [C11] (dosya yolu).

## [C4] Kod Referans Formatı

Kod referansları aşağıdaki kalıba uyar:

```
> {{IS_MANTIGI_OZETI}}
>
> **Kaynak:** `{{REPO}}/{{KATMAN}}/{{DOSYA}}` | {{CLASS_VEYA_METOD}}
```

**Repo bazlı tipik yollar:**

| Repo | Tipik Yol Örneği |
|------|--------------------|
| mwbackend | `mwbackend/Application/{{Domain}}/UseCase/{{Dosya}}.cs` |
| mwbackend | `mwbackend/Application/{{Domain}}/Handler/{{Dosya}}.cs` |
| mwbackend | `mwbackend/Domain/{{Domain}}/Service/{{Dosya}}.cs` (MCS / TransactionNameConstants) |
| mwbackend | `mwbackend/Domain/{{Domain}}/Helper/{{Dosya}}.cs` |
| ios | `ios/{{Modul}}/{{StoryboardVeyaVC}}.swift` |
| android | `android/{{Modul}}/{{Activity}}.kt` |
| MCSVeribranchBI | `MCSVeribranchBI/{{Servis}}/{{Dosya}}.cs` |
| smg | `smg/{{Modul}}/{{Dosya}}.cs` |

**AS-IS / Analiz dokümanlarına kod bloğu (triple backtick) EKLENMEZ.** Sadece referans formatı. İstisnalar: kısa sabitler/enum'lar satır içi backtick; Mermaid, Gherkin serbest; developer-analiz dokümanında küçük (3-5 satır) Swift/Kotlin/C# örneği izinli.

## [C11] Dosya Yolu Konvansiyonu

| Türü | Yol |
|------|-----|
| Agent dosyaları | `Agent/mobile/mobile-XX-*.md` |
| Orchestrator | `Agent/mobile/mobile-orchestrator.md` |
| Ortak kurallar (modüler) | `Agent/mobile/_common-rules/{NO}-{konu}.md` |
| Ortak kurallar (index) | `Agent/mobile/_common-rules.md` |
| Template dosyaları | `Templates/mobile/mobile-*.template.md` |
| SQL template (mobile-05) | `Templates/mobile/mobile-implementation-script.template.sql` |
| Çıktı dokümanları | `docs/mobile-*.md` |
| Çıktı SQL (mobile-05) | `docs/mobile-implementation-scripts.sql` |
| Developer çıktı (mobile-02 2. çıktı) | `docs/mobile-developer-analiz.md` |
| Multi-işlev çıktı (mobile-02, ≥3 işlev) | `docs/mobile-analiz/4.1.X-{slug}.md` + `docs/mobile-analiz/index.md` |
| AS-IS özet handoff | `docs/.mobile-as-is-summary.json` (mobile-01 çıktısı, mobile-02 girdisi) |
| State / recovery | `docs/.mobile-XX-state.json` (her agent için ayrı) |
| Kullanıcı tercihleri | `docs/.mobile-preferences.json` |
| Açık sorular | `questions.md` (proje kökü) |
| Veritabanı kanonik referansı | `_common-rules/15-db-reference.md` (agent modülü — esas) |
| Veritabanı dokümantasyonu (orijinal kaynak) | `mobilemenu-mssqlmcp.md` (proje kökü) |
| Değişiklik geçmişi | `changelog.md` (proje kökü) |

Yollar workspace-relative; absolute path kullanılmaz.

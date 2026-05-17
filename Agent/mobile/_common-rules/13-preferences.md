# Common-Rules — 13: Kullanıcı Tercihleri Persistence (Yeni — [C20])

> Aynı kullanıcıya aynı soruyu tekrar tekrar sormamak için.

## [C20.1] Tercih Dosyası

`docs/.mobile-preferences.json` proje seviyesinde tutulur. Birden fazla agent ortak okur ve yazar.

**Şema:**

```json
{
  "version": "1.0.0",
  "last_updated_at": "2026-05-17T20:00:00Z",
  "musteri_tipi": ["Bireysel", "Tüzel"],
  "segment": ["Standart", "ÜGS"],
  "dil_seti": ["tr-TR", "en-US", "ar-SA"],
  "pilot_kapsam_tercihi": "Menü üzerinden pilot",
  "test_framework": ["KIF", "Espresso"],
  "loglama_kapsami": ["TrackMobileEvent", "VpDefaultLog", "Dataroid"],
  "etki_analizi_kapsami": "daraltilmis",
  "ortam": "UAT",
  "createby_user": "T65714",
  "channel_id_default": 10,
  "force_update_strategy": "Menü özelinde",
  "rollback_plan": "var"
}
```

## [C20.2] Tercih Kullanma Algoritması

Agent bir AskUserQuestion sormadan önce:

1. `docs/.mobile-preferences.json` var mı kontrol et.
2. Sorulacak konu preferences'ta varsa → "Önceki seçiminiz: {{Değer}}. Aynı kullanılsın mı?" tek seçimli soru.

```
AskUserQuestion(
  questions: [{
    question: "Önceki proje tercihiniz: Müşteri tipi = Bireysel + Tüzel. Bu projede de aynı mı?",
    header: "Tercih",
    multiSelect: false,
    options: [
      { label: "Evet, aynı (Önerilen)", description: "Önceki seçimi kullan" },
      { label: "Bu projede farklı", description: "Yeniden sor (cascade soru gelecek)" }
    ]
  }]
)
```

3. Cevap "Evet aynı" → preferences'tan oku, sormayı atla.
4. Cevap "Farklı" → standart AskUserQuestion akışı; sonra preferences güncellenir.

## [C20.3] İlk Kez Çalışan Agent

Preferences dosyası yoksa: agent normal sorularını sorar, **cevaplandıkça preferences.json'a yazar.** İlk session sonunda dosya oluşur, sonraki session bunu kullanır.

## [C20.4] Tercih Dışı Bırakılan Alanlar

Aşağıdaki bilgiler **her seferinde sorulur**, preferences'ta saklanmaz:

| Alan | Neden |
|------|-------|
| Proje adı / kodu | Her proje farklı |
| Kapsam (hangi menü/servis) | Her geliştirme farklı |
| Figma link | Her tasarım farklı |
| MenuID / TransactionName | Her geliştirme farklı |
| Resource Key değerleri | Her geliştirme farklı |
| Acil özel istisnalar | Tek seferlik |

## [C20.5] Preferences Güncelleme

Kullanıcı bir cevap verdiğinde:

- Eğer cevap mevcut preferences ile **tutarlı**: değişiklik yok.
- Eğer cevap **farklı**: agent sonunda "Tercih güncellendi: {{Eski}} → {{Yeni}}" notu + dosya güncellenir.

## [C20.6] Tercih Sıfırlama

Agent çalıştırma sırasında kullanıcı "tercihleri unut" derse: `docs/.mobile-preferences.json` silinir, yeni session sıfırdan başlar.

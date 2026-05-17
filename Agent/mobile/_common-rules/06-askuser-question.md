# Common-Rules — 06: AskUserQuestion Şeması

> İçerik [C6] (gerçek şema) + [C6.1] (4 seçenek aşma stratejisi).

## [C6] Cowork Gerçek Şeması

> **KRİTİK:** Eski CoE pseudo-syntax (`title`, `id`, `prompt`, `options[{id, label}]`) **YASAK**.

```
AskUserQuestion(
  questions: [
    {
      question: "Tam soru cümlesi — soru işaretiyle bitmeli (max 1-2 cümle)",
      header: "Kısa chip etiketi (max 12 karakter)",
      multiSelect: false,
      options: [
        { label: "Seçenek 1 (1-5 kelime)", description: "Tradeoff veya sonucu açıklayan kısa metin" },
        { label: "Seçenek 2", description: "..." }
      ]
    }
  ]
)
```

**Kurallar:**

- Her soruda **2-4 seçenek** zorunlu (Other otomatik eklenir, manuel "Diğer / Other" YASAK).
- "Önerilen" seçenek varsa **ilk sırada**, label sonunda "(Önerilen)".
- `multiSelect: true` → çoklu seçim (kapsam, log tipleri vb.).
- Tek AskUserQuestion çağrısında **1-4 soru** gruplandırılabilir.
- Prompt KISA; bağlam bilgisi AskUserQuestion'dan ÖNCE düz metin olarak yazılır.

**Doğru kullanım örneği:**

> "Kaynaktan şu bilgileri çıkardım:
> - Proje: 8904 — Vadeli Temdit Kampanyaları
> - Kapsam: 3 yeni menü, 2 yeni MCS"
>
> AskUserQuestion(...)

## [C6.1] 4'ten Fazla Seçenek Gerekiyorsa

AskUserQuestion bir soru için **maksimum 4 seçenek** kabul eder.

| Strateji | Ne Zaman |
|----------|----------|
| **2 ayrı soruya böl** (multiSelect: true) | Seçenekler doğal olarak iki kategoriye ayrılabiliyorsa |
| **En kritik 3 + "Diğer"** | Tool otomatik "Other" ekler; 3 sık seçenek + Other yeterli |
| **AskUserQuestion yerine düz metin iste** | Çok özel girdi (PilotKey adı, MenuID, çeviri değeri): kullanıcıdan düz metinle yazmasını iste |
| **Cascade: önce kategori, sonra detay** | "Hangi kategori? (3 seçenek)" → sonra seçilen kategorinin detayını sor |

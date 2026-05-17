# Common-Rules — 12: State Dosyaları, Kurtarma ve Output Validation (Yeni — [C19])

> Partial completion, çıktı doğrulama, AS-IS handoff özeti.

## [C19.1] State Dosyası Yapısı

Her agent kendi state dosyasını tutar:

```
docs/.mobile-01-state.json
docs/.mobile-02-state.json
docs/.mobile-03-state.json
docs/.mobile-04-state.json
docs/.mobile-05-state.json
docs/.mobile-orchestrator-state.json
```

**Şema:**

```json
{
  "agent": "mobile-02",
  "started_at": "2026-05-17T20:00:00Z",
  "last_updated_at": "2026-05-17T20:35:12Z",
  "status": "in_progress",
  "current_step": "Adım 7 — 4.1.Y 11 Alt Başlık Doldurma",
  "completed_parts": [
    { "part": 1, "completed_at": "2026-05-17T20:05:00Z", "file_size_lines": 124 },
    { "part": 2, "completed_at": "2026-05-17T20:12:00Z", "file_size_lines": 287 }
  ],
  "pending_parts": [3, 4, 5, 6, 7, 8, 9],
  "askuser_answers": {
    "kapsam-onay": "Evet, kapsam doğru",
    "musteri-tipi": ["Bireysel", "Tüzel"]
  },
  "mcp_cache_keys": [
    "search_code:GetCreditCardList Handler:.cs",
    "mssql:VpStringResource:KartLimit"
  ],
  "errors": []
}
```

## [C19.2] Yeni Session Başladığında Kurtarma

Agent başlatıldığında:

1. State dosyası var mı kontrol et.
2. Varsa `status: "in_progress"` ise AskUserQuestion ile:

```
AskUserQuestion(
  questions: [{
    question: "Önceki session 'Adım 7 — 4.1.Y 11 Alt Başlık Doldurma'da kaldı. Nasıl devam edelim?",
    header: "Kurtarma",
    multiSelect: false,
    options: [
      { label: "Kaldığım yerden devam (Önerilen)", description: "State'i kullan, parça 7'den başla" },
      { label: "Baştan başla", description: "State'i sil, yeni session aç" },
      { label: "Durumu göster önce", description: "Tamamlanan parçaları + AskUserQuestion cevaplarını listele" }
    ]
  }]
)
```

3. `status: "completed"` ise: "Önceki çalışma tamamlandı (tarih X). Yeniden çalıştırmak için 'Sıfırdan' seç."

## [C19.3] Çıktı Doğrulama (Output Validation Gate)

Her parça yazıldıktan sonra agent kendisi şunu kontrol eder:

| Kontrol | Yöntem | Hata Davranışı |
|---------|---------|-----------------|
| Parça başlığı var mı? | Read + grep `^## ` veya `^### ` | Parçayı yeniden yaz |
| Placeholder `{{...}}` kalmadı mı? (mobile-05 hariç) | Read + grep `{{` | Eksik veri toplama tekrar |
| "Hayır" / etkisiz başlıklarda standart cümle var mı? | Read + grep "bulunmamaktadır" | Cümle eksikse ekle |
| Türkçe ASCII (I, i, s, c, g, u, o yerine ı, ş, ç, ğ, ü, ö var mı?) | Read + regex `\b(yazilim|dokuman|kontrol|sirket)\b` | Karakter eksikse uyarı |

Hata bulunursa state'e `validation_errors: [...]` array'i eklenir; o parça yeniden yazılır (en fazla 2 deneme; 3. denemede kullanıcıya gösterilir).

## [C19.4] AS-IS Handoff Özet Dosyası

mobile-01 çıktısının yanında `docs/.mobile-as-is-summary.json` üretilir. Bu, mobile-02'nin **1500+ satırlık AS-IS dokümanı baştan okumaktan kurtulması** içindir.

**Şema:**

```json
{
  "version": "1.0.0",
  "as_is_doc_path": "docs/mobile-as-is-analiz.md",
  "as_is_doc_size_lines": 1842,
  "generated_at": "2026-05-17T19:00:00Z",
  "proje_kodu": "8904",
  "proje_adi": "Kart Limit Detayı",
  "kapsam_ozeti": "...",
  "islev_listesi": ["4.1.1 Kart Limit Sayfası"],
  "karar_matrisi": {
    "4.1.1": {
      "ekran": "Evet",
      "batchler": "Hayır (default)",
      "cikti": "Hayır",
      "menu": "Evet",
      "erisim": "Evet",
      "sms_pn": "Hayır",
      "email": "Hayır",
      "memo_ekstre": "Hayır",
      "uyari_hata": "Evet",
      "servisler": "Evet",
      "etki_analizi": "Evet"
    }
  },
  "mevcut_mcs_listesi": [
    {
      "transaction_name": "GetCreditCardList",
      "channel_10_tanimli": true,
      "request_type": "GetCreditCardListRequest",
      "kullanilan_yerler": ["mwbackend/Application/Cards/UseCase/GetCardsUseCase.cs"]
    }
  ],
  "mevcut_resource_keys": ["KartListesi", "KartDetay"],
  "mevcut_menu_ids": [18001100, 18001200],
  "belirsiz_alanlar": ["3.4.4 Chatbot — bilgi eksik", "4.1.1.6 SMS — form code bulunamadı"]
}
```

mobile-02 başlangıçta önce summary.json'u okur, gerekli yerlerde tam AS-IS'e iner (line-range Read).

## [C19.5] Rolling Summary (Parça Bazlı)

Mobile-02 gibi 8+ parçalı çıktılarda her parça sonu `docs/.mobile-XX-rolling-summary.md` dosyasına 5-10 satırlık özet yazılır:

```markdown
## Parça 2 (Bölüm 3.1 + 3.2 + 3.3) — Tamamlandı

- 3.1: 3 müşteri gereksinimi (MG1-3); 4.1.1 ile eşlendi
- 3.2: Mermaid akış 12 düğüm; ana akış + 1 alt dal (ShortFlow)
- 3.3: Kapsam dışı: web kanal davranışı
- Karar: 4.1.1'in 11 alt başlığında "Evet" sayısı 5
- AskUserQuestion cevapları: "Tüm müşteri tipi: Bireysel + Tüzel"
```

Sonraki parça yalnızca özeti + ilgili template fragment'ini okur, full dosyaya inmez.

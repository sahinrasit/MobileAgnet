# Common-Rules — 07: questions.md Kontrol Listesi

> İçerik [C7] (kategori-agent eşleme + AskUserQuestion fallback).

`questions.md` proje kökünde, mobil ürün geliştirmede açıkta kalan kontrol sorularını içerir.

## Kategori → Hangi Agent

| Kategori | questions.md Bölümü | İlgili Agent(lar) |
|----------|----------------------|---------------------|
| Kapsam & Ekip | Mevcut/yeni menü, ekipler, Design Guideline | mobile-01, mobile-02 |
| Kullanıcı & Segment | Tüzel/gspara/fenerpara, ÜGS | mobile-02, mobile-03 |
| Erişim & Yönlendirme | Erişim noktaları, deep link, SMS/PN | mobile-02, mobile-04 |
| Performans & Oturum | Login süresi, session timeout | mobile-02, mobile-04 |
| Menü & Konfigürasyon | Q etkisi, CMS, görsel, HPC | mobile-02, mobile-05 |
| Pilot & Versiyon | Pilot, eski client, force update, rollback | mobile-02, mobile-03, mobile-04 |
| Teknik & Servis | MCS mapping, generic component | mobile-02, mobile-04 |
| Loglama & Analitik | TrackMobileEvent, EDW, Dataroid, Adjust, SAS | mobile-02, mobile-03, mobile-04 |
| Güvenlik & Hukuk | Hukuk, BDDK, Pentest, Seala, Encryption | mobile-02, mobile-04 |
| Dil & Erişilebilirlik | İngilizce/Arapça, erişilebilirlik | mobile-02, mobile-03 |
| Test | Otomasyon framework | mobile-03 |

## Fallback Kuralı

Araştırma sonunda bir bilgi hâlâ `[BELIRSIZ]` ise:

1. `questions.md`'deki ilgili kategoriden uygun soruyu seç.
2. AskUserQuestion (modül 06 şeması) ile kullanıcıya sor.
3. Cevap geldikten sonra dokümanı güncelle, etiketi `[DOGRULANDI]` veya `[KISMI]`'ye çevir.

## Generic Component Etki Taraması (sık takılan konu)

`questions.md` "Generic component kullanılacak mı?" sorusu için tarama:

```
search_code(
  query: "{ComponentAdi} usage VC Activity",
  extensionFilter: [".swift", ".kt", ".java"],
  scopeProject: "mobilebanking",
  limit: 25
)
```

Sonuç > 10 kullanım yeri ise kullanıcıya AskUserQuestion ile yan etki testi kapsamını sor.

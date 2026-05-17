# Common-Rules — 14: Quality Gate ve Completeness Raporu (Yeni — [C21])

> Her agent çıktısının minimum tamamlanma kriterleri. Orchestrator bunlara bakarak "bu agent başarılı bitti mi" karar verir.

## [C21.1] Agent Başına Quality Gate

### mobile-01 (AS-IS)

| Kriter | Minimum | Hata Davranışı |
|---------|----------|-----------------|
| 11 başlığın "Evet/Hayır" hepsi işaretli | 11 | Eksik başlık için AskUserQuestion |
| "Evet" başlık sayısı | ≥ 5 | <5 ise "Bu AS-IS analizi anlamlı mı?" sorgu |
| 4.1.Y.10 (Servisler) için en az 1 MCS [C17] tablosu dolu | ≥ 1 | 0 ise "MCS analizi yapılamadı, devam edelim mi?" |
| Belirsizlik raporu (Bölüm 5.2) listelenmiş | ≥ 0 satır | Boş bırakılırsa "yok" yazılmalı |

### mobile-02 (Analiz + Developer Analiz)

| Kriter | Minimum | Hata Davranışı |
|---------|----------|-----------------|
| 3.4'ün 11 alt başlığı tamamı dolu | 11/11 | Eksik için AskUserQuestion |
| 4.1.X.10 (Servisler) için her MCS'in [C17] Tablo A/B/C dolu | ≥ 1 set per MCS | Eksik tabloyu doldurmaya dön |
| Müşteri gereksinimi → Yazılım gereksinimi eşleme tablosu dolu | ≥ 1 satır | Eşleme yapılamamışsa AskUserQuestion |
| `docs/mobile-developer-analiz.md` 3 developer bölümü mevcut | iOS + Android + mwbackend | Eksik bölüm tekrar yazılır |

### mobile-03 (Test)

| Kriter | Minimum |
|---------|----------|
| Kapsam matrisinde "Evet" olan her başlık için en az 1 TC | ≥ 1 TC per "Evet" başlık |
| 3 dil için (tr-TR / en-US / ar-SA) en az 1 TC | 3 TC |
| Negatif test sayısı | ≥ %20 happy path sayısı |
| BDD senaryosu (.feature) ile TC eşlemesi | 100% |

### mobile-04 (Etki Analizi)

| Kriter | Minimum |
|---------|----------|
| Etki Durumu tek seçim işaretli (var / yok) | 1 işaret |
| Kapsamlı kategorilerin satır sayısı | Genel + Kanallar + Güvenlik + EDW + Test boş bırakılmaz |
| "Evet" işaretli her satır için açıklama dolu | %100 |
| Kapsam dışı kategoriler "Etkisiz" notu ile geçilmiş | 3 satır (Core + KOS + WEB/PORTAL) |

### mobile-05 (Implementation Script)

| Kriter | Minimum |
|---------|----------|
| Placeholder `{{...}}` kalmadı | 0 |
| Her INSERT'te IF NOT EXISTS | %100 |
| ChannelID = 10 her WHERE'de | %100 |
| CreateBy = 'T65714' her INSERT'te | %100 |
| Resource için 3 dil INSERT | her key × 3 |
| Rollback bloğu commentli mevcut | ≥ 1 |
| Post-insert kontrol sorguları mevcut | ≥ 3 (resource + menu + transaction) |

## [C21.2] Completeness Raporu

Her agent sunum öncesi (sondan bir önceki adım) `docs/.mobile-XX-completeness.md` üretir:

```markdown
# mobile-02 Completeness Raporu

**Çalıştırma:** 2026-05-17 20:00
**Toplam İşlev:** 1 (4.1.1)
**Genel Skor:** 9/11 (82%)

## 4.1.1 — Kart Limit Detayı

| Alt Başlık | Durum | Veri Yoğunluğu |
|-------------|--------|------------------|
| 4.1.1.1 Ekran | Dolu | Yüksek (Figma + 2 ekran + 5 komponent) |
| 4.1.1.2 Batchler | Standart cümle | — |
| 4.1.1.3 Çıktı | Standart cümle | — |
| 4.1.1.4 Menü | Dolu | Yüksek (1 menü + 2 mapping + JSON) |
| 4.1.1.5 Erişim | Dolu | Orta (3 erişim noktası) |
| 4.1.1.6 SMS/PN | Eksik veri | Düşük (1 form code referansı, içerik yok) |
| 4.1.1.7 E-Mail | Standart cümle | — |
| 4.1.1.8 Memo/Ekstre | Standart cümle | — |
| 4.1.1.9 Uyarı/Hata | Dolu | Orta (3 validation rule) |
| 4.1.1.10 Servisler | Kısmi | Orta (2 MCS, 1'inin C17 Tablo B eksik) |
| 4.1.1.11 Etki | Dolu | Orta |

## Eksik / Belirsiz Liste

| # | Konu | Bölüm | Tip |
|---|------|--------|-----|
| 1 | SMS form code içeriği | 4.1.1.6 | Veri eksik (AskUserQuestion gerekli) |
| 2 | GetCardLimitInfo MCS Tablo B (input/output) | 4.1.1.10 | C17 araştırması yarım |

## Önerilen Sonraki Adımlar

- [ ] Eksik bilgileri (1, 2) AskUserQuestion ile tamamla
- [ ] Genel skor 9/11; 11/11 hedef için 2 adım kaldı
- [ ] mobile-03'e geçmeden önce eksikleri kapatın
```

## [C21.3] Orchestrator Quality Gate Kararı

`mobile-orchestrator` bir agent tamamlandığında:

1. `docs/.mobile-XX-completeness.md`'i Read et.
2. Genel skor < %75 → kullanıcıya AskUserQuestion ile "skor düşük; devam mı, eksikleri tamamla mı, durdur mu?"
3. Skor ≥ %75 → otomatik sonraki agente geç (kullanıcı onayıyla).

## [C21.4] Quality Gate Override

Kullanıcı bilinçli olarak "düşük skorla devam edeceğim" derse: agent bunu state'e yazar ve sonraki agentlara uyarır ("Önceki agent %60 skorla bitti, dikkat").

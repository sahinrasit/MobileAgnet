# {{PROJE_KODU}} {{PROJE_ADI}} — Architect Teknik Analiz Index

> **Bu doküman `mobile-architect` agentı tarafından üretilir.** Üç platform dokümanının (iOS / Android / mwbackend) overview'i, cross-platform tutarlılık matrisi ve sprint koordinasyonu için master doküman.

---

## Değişiklik Tarihçesi

| Tarih | Sürüm | Hazırlayan | Değişiklik |
|-------|-------|------------|------------|
| {{TARIH}} | v1 | {{HAZIRLAYAN}} | İlk versiyon — SDLC çıktısından türetildi |

---

## İçindekiler

1. Genel Özet ve Hedef
2. Doküman Haritası (Hangi Developer Hangi Dosyayı Okur)
3. Etki Özeti (SDLC 3.4'ten)
4. Yazılım İşlevleri Listesi (4.1.X) + Gereksinim → İmplementasyon İzlenebilirlik Matrisi
5. Cross-Platform REST Endpoint Matrisi
6. Resource Key Haritası — Tam Envanter (3 platform senkron, Figma kaynaklı)
7. Loglama Event Sözlüğü (snake_case — 3 platform aynı)
8. Pilot ve MinBuildNumber Konfigürasyonu
9. Sprint Koordinasyon Sırası
10. Bilinmeyenler ve Belirsizlikler
11. Master Definition of Done (DoD)

---

## 1. Genel Özet ve Hedef

**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Geliştirme Tipi:** {{mevcut ek iş / sıfırdan yeni}}
**SDLC Kaynak Dokümanı:** `docs/mobile-sdlc-analiz.md` (mobile-00-sdlc-analyse çıktısı)
**Üretim Tarihi:** {{TARIH}}
**Üretilen Platformlar:** {{iOS / Android / mwbackend — seçime göre}}

> 1-3 cümle proje özeti (SDLC Bölüm 1'den).

---

## 2. Doküman Haritası

| Doküman | Hedef Kitle | Yol |
|---------|-------------|-----|
| `architect-index.md` | Tech lead, PM, tüm developer'lar (overview) | `docs/architect/architect-index.md` |
| `architect-ios.md` | iOS developer | `docs/architect/architect-ios.md` |
| `architect-android.md` | Android developer (Google + Huawei) | `docs/architect/architect-android.md` |
| `architect-backend.md` | mwbackend developer | `docs/architect/architect-backend.md` |
| `mobile-sdlc-analiz.md` | İş analist + tech lead (referans) | `docs/mobile-sdlc-analiz.md` |
| `mobile-test-cases.md` | QA + developer (sonraki adım) | `docs/mobile-test-cases.md` (mobile-03) |
| `mobile-implementation-script.sql` | DBA + backend dev (sonraki adım) | `docs/mobile-implementation-script.sql` (mobile-05) |

---

## 3. Etki Özeti (SDLC 3.4'ten)

| Etki Alanı | Durum | Sahibi / Aksiyon |
|-------------|--------|-------------------|
| Kanal (ADK) | {{Mobil bireysel: Var/Yok; Tüzel: Var/Yok; Diğer kanallar}} | {{Sorumlu}} |
| Engelsiz Bankacılık | {{Var / Yok}} | {{HPC + sözleşme detayı varsa}} |
| SAS Fraud | {{Var / Yok}} | (varsa) developer doc + güvenlik ekibi |
| Chatbot | {{Var / Yok}} | OZL DB ChatBot Apps Ba ekibi bilgilendirilecek |
| CMS | {{Var}} | Bölüm 6 Resource Key Haritası |
| Mevzuat | Yasal Uyum'dan onay alındı | — |
| Anomali Takibi | {{Var / Yok}} | — |
| Diğer (proje-spesifik) | {{...}} | — |

---

## 4. Yazılım İşlevleri Listesi (4.1.X)

| No | İşlev | iOS Etki | Android Etki | Backend Etki | Yeni MCS | Yeni Endpoint |
|----|-------|----------|--------------|--------------|----------|---------------|
| 4.1.1 | {{İşlev 1}} | {{V/Y}} | {{V/Y}} | {{V/Y}} | {{TXN listesi}} | {{endpoint listesi}} |
| 4.1.2 | {{İşlev 2}} | {{V/Y}} | {{V/Y}} | {{V/Y}} | {{...}} | {{...}} |
| ... | ... | ... | ... | ... | ... | ... |

> Her satır, ilgili platform dokümanında detaylı 3.1 alt başlığa link verir (yerel dosya içi link).

### 4.1 Gereksinim → İmplementasyon İzlenebilirlik Matrisi ([B16.3])

> SDLC Bölüm 4'teki **her gereksinim** için tam zincir. Boş hücre kalamaz; uygulanamıyorsa "—" + gerekçe.

| SDLC Gereksinim | Endpoint(ler) | Backend Class'lar (Controller/Handler/UseCase/Service) | MCS TXN | iOS Service Metodu | Android Repository Metodu | Resource Key'ler |
|------------------|----------------|----------------------------------------------------------|---------|---------------------|----------------------------|-------------------|
| 4.1.1 {{İşlev}} | `{{method route}}` | `{{C}}Controller.{{Action}}`, `{{H}}Handler`, `{{U}}UseCase`, `{{S}}Service` | `{{TXN}}` | `{{Service}}.{{metod}}()` | `{{Repo}}.{{metod}}()` | `{{KEY_1}}, {{KEY_2}}` |
| 4.1.2 {{İşlev}} | ... | ... | ... | ... | ... | ... |
| 4.3.1 Loglama | — | `[LoggableMethod]` | — | `TrackMobileEvent` | `TrackMobileEvent` | — |

---

## 5. Cross-Platform REST Endpoint Matrisi

> Backend dokümanındaki endpoint'lerin iOS ve Android tarafındaki çağrı kodlarıyla **birebir eşleşmesi** zorunlu ([B12] kontrol 3).

| Endpoint | Method | Backend Handler | iOS Service | Android Repository | Request DTO | Response DTO |
|----------|--------|------------------|-------------|---------------------|-------------|--------------|
| `/api/{{kebab-1}}` | POST | `{{H1}}Handler` | `{{Service}}.create()` | `{{Repo}}.create()` | `{{Adi}}Request` | `{{Adi}}Response` |
| `/api/{{kebab-1}}` | GET | `{{H1}}Handler.List` | `{{Service}}.list()` | `{{Repo}}.list()` | — | `{{Adi}}ListResponse` |
| `/api/{{kebab-1}}/{id}` | PUT | `{{H1}}Handler.Update` | `{{Service}}.update()` | `{{Repo}}.update()` | `{{Adi}}UpdateRequest` | `{{Adi}}UpdateResponse` |
| `/api/{{kebab-1}}/{id}` | DELETE | `{{H1}}Handler.Delete` | `{{Service}}.delete()` | `{{Repo}}.delete()` | — | `{{Adi}}DeleteResponse` |

> Yeni TransactionName listesi backend dokümanı 4.1.X.4'te detaylı; özet aşağıda:

| TransactionName | İlişkili Endpoint | ChannelID = 10 mevcut mu | HPC |
|------------------|-------------------|--------------------------|-----|
| `{{TXN1}}` | `POST /api/{{kebab}}` | {{E/H — fallback gerekiyor mu}} | `{{HPC}}` |

---

## 6. Resource Key Haritası — TAM Envanter (3 Platform Senkron)

> Kaynak: [B3.1] tam key envanteri — **Figma MCP / ekran tasarım görsellerindeki TÜM metinler** (mevcut + yeni) + SDLC 3.4.5. Üç platformda da **aynı key adı** ile kullanılır.
> **Dağıtım:** Key değerleri client'a **backend endpoint output'unda döner** ([B8]); "Dönen Endpoint" kolonu zorunludur.

| ResourceKey | Durum | Kaynak (Figma ekran/komponent) | tr-TR | en-US | ar-SA | Dönen Endpoint / Response Alanı | iOS Kullanım | Android Kullanım |
|-------------|-------|--------------------------------|-------|-------|-------|----------------------------------|----------------|-------------------|
| `{{KEY_1}}` | yeni | {{Ekran}} / başlık | {{TR}} | {{EN veya [ÇEVİRİ GEREKLİ]}} | {{AR}} | `GET /api/{{kebab}}` → `resourceKeys` | `titleLabel.text` | `binding.tvTitle.text` |
| `{{KEY_2}}` | yeni | {{Ekran}} / hata popup | {{TR}} | {{EN}} | {{AR}} | `BusinessException.MessageKey` | Alert message | AlertDialog message |
| `{{KEY_3}}` | mevcut | {{Ekran}} / toast | {{TR}} | {{EN}} | {{AR}} | `{{endpoint}}` → `resultMessageKey` | Toast | Toast.makeText |

> [ÇEVİRİ GEREKLİ] satırlar `VpStringResource` `mobile-05` INSERT script'inde çeviri ekibi tarafından doldurulur. Ekran tasarımında görünüp bu tabloda olmayan metin = [B12] kontrol 15 hatası.

---

## 7. Loglama Event Sözlüğü (snake_case)

> 3 platformda **birebir aynı event adı** ile gönderilir (raporlama tek tablo). SDLC 4.3.1 + agent [B11].

| Event Adı (snake_case) | Tetiklendiği Yer | Payload Alanları | iOS | Android | Backend |
|------------------------|-------------------|-------------------|-----|---------|---------|
| `{{event_1}}` | {{Ekran/aksiyon}} | {{alan1, alan2}} | `TrackMobileEvent.send` | `TrackMobileEvent.send` | `[LoggableMethod]` |
| `{{event_2}}` | {{...}} | {{...}} | `Adjust.trackEvent` | `Adjust.trackEvent` | — |
| `{{event_3}}` | {{...}} | {{...}} | `Dataroid.customEvent` | `Dataroid.customEvent` | — |

---

## 8. Pilot ve MinBuildNumber Konfigürasyonu

> Üç platformda aynı PilotKey; MinBuildNumber platform bazında farklı olabilir.

| Anahtar | Değer | Yer |
|---------|-------|-----|
| PilotKey | `{{PilotKey}}` | MobileMenu.Configuration JSON (backend), iOS `PilotManager`, Android `PilotManager` |
| ReversePilot | `false` | aynı |
| MinBuildNumber iOS | `{{MIN_BUILD_IOS}}` | MobileMenu.Configuration.IosMenuItem |
| MinBuildNumber Android (Google) | `{{MIN_BUILD_GOOGLE}}` | MobileMenu.Configuration.AndroidMenuItem |
| MinBuildNumber Huawei | `{{MIN_BUILD_HUAWEI}}` | MobileMenu.Configuration.HuaweiMenuItem |
| Force Update | {{Var / Yok}} | (varsa) AppStore + Play Store + AppGallery koordinasyonu |

**Configuration JSON tam şablon:**

```json
{
  "PilotKey": "{{PilotKey}}",
  "ReversePilot": false,
  "IosMenuItem": {
    "ClassName": "{{IOS_CLASS}}",
    "MinBuildNumber": "{{MIN_BUILD_IOS}}",
    "DeepLinkPath": "{{kebab-konu}}"
  },
  "AndroidMenuItem": {
    "ClassName": "{{ANDROID_CLASS}}",
    "MinBuildNumber": "{{MIN_BUILD_GOOGLE}}",
    "DeepLinkPath": "{{kebab-konu}}"
  },
  "HuaweiMenuItem": {
    "ClassName": "{{HUAWEI_CLASS}}",
    "MinBuildNumber": "{{MIN_BUILD_HUAWEI}}"
  }
}
```

---

## 9. Sprint Koordinasyon Sırası

| Sıra | İş | Sorumlu | Beklenen | Beklenen Çıktı |
|------|----|---------|----------|----------------|
| 1 | mwbackend endpoint sözleşmesi + mock | mwbackend dev | Sprint X gün 1-2 | Swagger / Postman koleksiyonu |
| 2 | iOS + Android service layer + DTO (paralel) | iOS dev + Android dev | Sprint X gün 3-5 | Network layer hazır |
| 3 | mwbackend iş kuralı + MCS entegrasyon | mwbackend dev + DBA | Sprint X gün 3-7 | UAT'da çalışan endpoint |
| 4 | iOS + Android UI implementasyon (paralel) | iOS dev + Android dev | Sprint X+1 | Build alınabilir |
| 5 | Huawei build varyantı kontrolü | Android dev | Sprint X+1 sonu | HMS Push testi |
| 6 | mobile-05 DB INSERT script çalıştırma | DBA | Sprint X+1 | VpStringResource / MobileMenu / VpTransaction prod |
| 7 | UAT integration test (3 platform) | Tüm taraflar | Sprint X+2 | Test caseleri yeşil |
| 8 | Pilot rollout | PM + DevOps | Sprint X+2 sonu | Pilot grubu canlıya |
| 9 | Genel rollout | PM | Sprint X+3 | Tüm kullanıcılar |

---

## 10. Bilinmeyenler ve Belirsizlikler

> Agent çıktıda `[BELIRSIZ]` etiketiyle işaretlediği maddeler burada toplanır; çözüm sahibi atanır.

| # | Konu | Yer (Doküman/Bölüm) | Çözüm Sahibi | Notlar |
|---|------|---------------------|----------------|--------|
| 1 | {{Belirsiz nokta 1}} | `architect-backend.md` 3.1.4 | {{Sahibi}} | {{Not}} |
| 2 | HPC değeri | `architect-backend.md` 3.1.4 | HPC ekibi | Teknik tasarım aşamasında atanacak |
| ... | ... | ... | ... | ... |

---

## 11. Master Definition of Done

Aşağıdaki maddelerin **hepsi** üç platformda ve cross-platform seviyesinde tamamlanmış olmalı:

**iOS DoD (kısaltma — detaylar `architect-ios.md` Bölüm 8'de):**
- Code review + unit test + KIF/XCUITest + tr/en/ar + PilotKey + MinBuild + VoiceOver + Memory leak ✓

**Android DoD (kısaltma — detaylar `architect-android.md` Bölüm 8'de):**
- Code review + unit test + Espresso + tr/en/ar + PilotKey + MinBuild (Google + Huawei) + TalkBack + LeakCanary ✓

**mwbackend DoD (kısaltma — detaylar `architect-backend.md` Bölüm 7'de):**
- Code review + unit test + integration test + TransactionNameConstants + mobile-05 script + VpDefaultLog + backward compat + Swagger ✓

**Cross-Platform DoD:**
- [ ] Endpoint sözleşmesi 3 platformda birebir aynı (Bölüm 5); her endpoint'te Input/Output + Response ResourceKey tabloları dolu ([B16.1])
- [ ] Resource key adları 3 platformda birebir aynı; ekran tasarımındaki TÜM metinler envanterde (Bölüm 6)
- [ ] SDLC Bölüm 4'teki her gereksinim izlenebilirlik matrisinde (Bölüm 4.1)
- [ ] Loglama event adları snake_case ve birebir aynı (Bölüm 7)
- [ ] PilotKey + ReversePilot 3 platformda aynı davranıyor
- [ ] UAT integration test 3 platformda da yeşil
- [ ] Test caseleri (mobile-03) yeşil
- [ ] mobile-05 DB INSERT script'i prod ortama uygulandı
- [ ] changelog.md güncel
- [ ] Q ekibi + Chatbot ekibi + Yasal Uyum bilgilendirildi
- [ ] Rollback planı belirlendi
- [ ] BDDK / KVKK / Pentest / Seala kontrolleri tamamlandı

---

## Kaynaklar

| Kaynak | Yol |
|--------|-----|
| SDLC analiz | `docs/mobile-sdlc-analiz.md` |
| iOS analizi | `docs/architect/architect-ios.md` |
| Android analizi | `docs/architect/architect-android.md` |
| Backend analizi | `docs/architect/architect-backend.md` |
| Self-review raporu | `docs/architect/.review.md` |
| Context cache | `docs/.architect-context.json` |
| Codebase cache | `docs/.architect-codebase-cache.json` |
| State | `docs/.architect-state.json` |

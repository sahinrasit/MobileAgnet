# Mobile Test Caseleri — {{PROJE_ADI}}

**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Versiyon:** {{VERSIYON}}
**Tarih:** {{TARIH}}
**Hazırlayan:** {{HAZIRLAYAN}}
**Kanal:** Mobil (ChannelID = 10)
**Test Tipi Kapsamı:** Fonksiyonel + Regresyon + Negatif + Dil + Segment + Pilot + Loglama + Güvenlik

> Girdiler: `docs/mobile-analiz.md` (mobile-02 çıktısı) ve `docs/mobile-as-is-analiz.md` (mobile-01 çıktısı).

---

## İçindekiler

1. Test Stratejisi ve Kapsam
2. Test Verisi
3. Test Caseleri (İş Birimi Perspektifi)
4. BDD Senaryoları (Yazılımcı Perspektifi — Gherkin)
5. Otomasyon Eşlemesi
6. Açık Sorular ve Belirsizlikler
7. Metodoloji ve Kaynaklar

---

## 1. Test Stratejisi ve Kapsam

### 1.1. Kapsam Matrisi (Mobil — Batch YOK)

| 4.1.Y.x | Başlık | Test Üretildi |
|---------|--------|----------------|
| 4.1.Y.1 | Ekran Tasarımı | {{E/H}} |
| 4.1.Y.2 | Batchler (mobilde yok — N/A) | N/A |
| 4.1.Y.3 | Çıktı ve Raporlar | {{E/H}} |
| 4.1.Y.4 | Menü Tanımları | {{E/H}} |
| 4.1.Y.5 | Erişim Noktaları | {{E/H}} |
| 4.1.Y.6 | SMS / PN Bildirimleri | {{E/H}} |
| 4.1.Y.7 | E-Mail Bildirimleri | {{E/H}} |
| 4.1.Y.8 | Memo / Ekstre | {{E/H}} |
| 4.1.Y.9 | Uyarı / Hata Mesajları | {{E/H}} |
| 4.1.Y.10 | Servisler (MCS) | {{E/H}} |
| 4.1.Y.11 | İşlev özelinde Etki Analizi | {{E/H}} |

### 1.2. Müşteri Tipi & Segment Kombinasyonu

| Müşteri Tipi | Segment | Test Sayısı |
|---------------|---------|---------------|
| Bireysel | Standart | {{N}} |
| Bireysel | ÜGS | {{N}} |
| Tüzel | Standart | {{N}} |
| gspara | — | {{N}} |
| fenerpara | — | {{N}} |

### 1.3. Platform Matrisi

| Platform | MinBuildNumber | MaxBuildNumber | Force Update Senaryosu |
|----------|------------------|------------------|-------------------------|
| iOS | {{MIN}} | {{MAX}} | {{F/U}} |
| Android | {{MIN}} | {{MAX}} | {{F/U}} |
| Huawei | {{MIN}} | {{MAX}} | {{F/U}} |

### 1.4. Dil Kapsamı

| Kültür | Etki |
|---------|-------|
| tr-TR | {{ETKI}} |
| en-US | {{ETKI}} |
| ar-SA | {{ETKI}} |

### 1.5. Loglama / Analitik Doğrulama Kapsamı

| Sistem | Doğrulanacak |
|---------|---------------|
| TrackMobileEvent | {{E/H}} |
| VpMobileContactHistory | {{E/H}} |
| VpDefaultLog | {{E/H}} |
| VpExceptionLog | {{E/H}} |
| EDW Extra Field | {{E/H}} |
| Dataroid | {{E/H}} |
| Adjust | {{E/H}} |
| SAS | {{E/H}} |

---

## 2. Test Verisi

| Tip | Veri | Maskeleme |
|-----|------|-----------|
| Müşteri (Bireysel) | {{TEST_KULLANICI_1}} | TC No maskeli |
| Müşteri (Tüzel) | {{TEST_KULLANICI_2}} | VKN maskeli |
| Hesap (TL Vadesiz) | {{IBAN_1}} | IBAN maskeli |
| Kart (Kredi) | {{PAN_1}} | PAN maskeli |
| Kart (Debit) | {{PAN_2}} | PAN maskeli |
| Tutar (limit altı) | {{TUTAR_1}} | — |
| Tutar (limit üstü) | {{TUTAR_2}} | — |

> Production veri kullanma YASAK. Test ortamında maskelenmiş veriler kullanılır.

---

## 3. Test Caseleri (İş Birimi Perspektifi)

### 3.1. {{ALT_BASLIK_1}} Test Caseleri (4.1.Y.x)

| TC ID | Başlık | Kategori | Öncelik | Ön Koşul | Test Adımları | Beklenen Sonuç | Test Verisi | Etkilenen Bileşen | Log Doğrulaması | Platform | Pilot |
|--------|--------|----------|----------|----------|----------------|------------------|--------------|---------------------|------------------|----------|--------|
| TC-MOB-{{KONU}}-001 | {{BASLIK}} | Fonksiyonel | P0 | Kullanıcı giriş yapmış, segment "{{SEG}}" | 1. {{ADIM_1}}<br>2. {{ADIM_2}}<br>3. {{ADIM_3}} | {{SONUC}} | {{VERI}} | MobileMenu(MenuID={{ID}}) / TransactionName({{TXN}}) | TrackMobileEvent("{{EVENT}}") / VpMobileContactHistory.TransactionResult=1 | iOS + Android | PilotKey={{KEY}}, ReversePilot=false |
| TC-MOB-{{KONU}}-002 | {{NEG_BASLIK}} | Negatif | P1 | Pilot kapalı | 1. ... | Menü gizlenir veya ActionType 0 ile yanıt | — | MobileMenu Configuration.PilotKey | — | iOS + Android | PilotKey={{KEY}} kapalı |

### 3.2. Menü Tanımları Test Caseleri (4.1.Y.4)

| TC ID | Senaryo | Beklenen |
|--------|----------|-----------|
| TC-MOB-MENU-001 | Bireysel + ÜGS olmayan + iOS Min Build üstü + PilotKey açık | Menü görünür |
| TC-MOB-MENU-002 | Aynı kullanıcı + PilotKey kapalı (Validation FilterKey=PilotKey, ActionType=0) | Menü gizlenir |
| TC-MOB-MENU-003 | Bireysel + MinBuildNumber altı iOS | Eski client uyarısı / menü görünmez |
| TC-MOB-MENU-004 | Tüzel kullanıcı | AllUser=2 ise görünmez, AllUser=1/3 ise görünür |
| TC-MOB-MENU-005 | 18 yaş altı | IsEnabledUnder18Age kontrolü |
| TC-MOB-MENU-006 | Validation Rule AND (BuildNoAndroid >= 260 AND IsPaymentPilot=1) | İki koşul da Evet ise menü gizlenir |

### 3.3. Servisler (MCS) Test Caseleri (4.1.Y.10)

| TC ID | Senaryo | Beklenen |
|--------|----------|-----------|
| TC-MOB-MCS-001 | Happy Path — {{TransactionName}} | 200 OK, response mapping doğru |
| TC-MOB-MCS-002 | Error Path — Host hata kodu | Hata mesajı resource key ile gösterilir |
| TC-MOB-MCS-003 | Timeout | Retry veya genel hata gösterilir |
| TC-MOB-MCS-004 | Retry — geçici hata | Otomatik retry başarılı |

### 3.4. Çoklu Dil Test Caseleri (4.1.Y.x + 3.4.11)

| TC ID | Kültür | Doğrulanacak Resource Key | Beklenen Metin |
|--------|---------|----------------------------|------------------|
| TC-MOB-LANG-TR-001 | tr-TR | {{KEY}} | {{TR_METIN}} |
| TC-MOB-LANG-EN-001 | en-US | {{KEY}} | {{EN_METIN}} |
| TC-MOB-LANG-AR-001 | ar-SA | {{KEY}} | {{AR_METIN}} |

### 3.5. Pilot / Versiyon Test Caseleri (4.1.Y özelinde 4.1.Y.4 Erişim)

| TC ID | Senaryo | Beklenen |
|--------|----------|-----------|
| TC-MOB-PILOT-001 | PilotKey aktif | Erişim açık |
| TC-MOB-PILOT-002 | PilotKey kapalı + ReversePilot=false | Erişim kapalı |
| TC-MOB-PILOT-003 | PilotKey aktif + ReversePilot=true | Erişim kapalı (ters pilot) |
| TC-MOB-PILOT-004 | MinBuildNumber altı | Uyarı / erişim kapalı |
| TC-MOB-PILOT-005 | MaxBuildNumber üstü | Uyarı / erişim kapalı |
| TC-MOB-PILOT-006 | Force Update zorunlu | Update ekranı zorla gösterilir |

### 3.6. Erişilebilirlik & Engelsiz Bankacılık (3.4.2)

| TC ID | Senaryo | Beklenen |
|--------|----------|-----------|
| TC-MOB-A11Y-001 | VoiceOver (iOS) / TalkBack (Android) | Tüm aksiyon butonları okunur |
| TC-MOB-A11Y-002 | Sözleşme içeren işlem + görme engelli müşteri | "Bu işlem görme engelli müşterilere hizmet veremez" uyarısı (HPC bazlı) |

### 3.7. Güvenlik (3.4.x — BDDK, Pentest, Seala, Encryption)

| TC ID | Senaryo | Beklenen |
|--------|----------|-----------|
| TC-MOB-SEC-001 | Kart numarası ekranda | PAN maskeli gösterilir |
| TC-MOB-SEC-002 | OTP süresi dolmuş | Kullanıcıya yeni OTP isteme yönlendirmesi |
| TC-MOB-SEC-003 | Pentest — input injection | Sanitize edilir, hata fırlatılmaz |
| TC-MOB-SEC-004 | Seala log | SAS / Seala log entry oluştu |

---

## 4. BDD Senaryoları (Yazılımcı Perspektifi — Gherkin)

### 4.1. {{ISLEV_1}} Feature

```gherkin
Feature: {{Türkçe İşlev Başlığı}}
  In order to {{iş hedefi}}
  As a {{kullanıcı tipi}}
  I want {{istenen davranış}}

  Background:
    Given mobil uygulama açık ve kullanıcı giriş yapmış
    And ChannelID 10 (mobil) üzerinde çalışıyor

  Scenario: Happy Path — Menü erişimi ve servis çağrısı
    Given kullanıcı segmenti "{{Segment}}"
    And PilotKey "{{PilotKey}}" aktif
    And MinBuildNumber koşulu sağlanıyor
    When kullanıcı "{{MenuTitle}}" menüsüne dokunur
    Then "{{TransactionName}}" servisi çağrılır
    And başarı ekranı "{{ResourceKey}}" değeri ile gösterilir
    And "{{TrackEventKey}}" event'i loglanır
    And "VpMobileContactHistory.TransactionResult" değeri 1 olur

  Scenario Outline: Çoklu Dil Doğrulaması
    Given uygulama dili "<dil>"
    When kullanıcı "{{Ekran}}" ekranını açar
    Then başlık "<beklenen_metin>" olarak gösterilir

    Examples:
      | dil   | beklenen_metin |
      | tr-TR | {{TR}} |
      | en-US | {{EN}} |
      | ar-SA | {{AR}} |

  Scenario: Negatif — Pilot kapalı
    Given PilotKey "{{PilotKey}}" kapalı
    When kullanıcı menüye dokunmaya çalışır
    Then menü Validation ActionType=0 ile gizlenir

  Scenario: Negatif — Eski client (MinBuildNumber altı)
    Given uygulama build numarası MinBuildNumber'dan küçük
    When kullanıcı menüye dokunur
    Then "GuncellemeMesaji" resource key'i ile uyarı gösterilir

  Scenario: MCS Hata Path — Host kodu hatası
    Given backend MCS "{{TransactionName}}" servisi hata kodu döner
    When kullanıcı işlemi başlatır
    Then "{{HataMesajResourceKey}}" gösterilir
    And "VpExceptionLog" tablosuna kayıt atılır
```

### 4.2. {{ISLEV_2}} Feature

(Aynı yapı her işlev için tekrarlanır.)

---

## 5. Otomasyon Eşlemesi

| TC ID | Framework | Dosya / Sınıf | Durum |
|--------|-----------|-----------------|--------|
| TC-MOB-{{KONU}}-001 | KIF (iOS) | `{{Sinif}}Tests.swift` | Planlandı / Hazır / Pas / Fail |
| TC-MOB-{{KONU}}-001 | Espresso (Android) | `{{Sinif}}AutoTest.kt` | Planlandı / Hazır / Pas / Fail |
| TC-MOB-{{KONU}}-001 | Appium (cross) | `{{Senaryo}}.feature` | Planlandı |

---

## 6. Açık Sorular ve Belirsizlikler

| # | Soru | Kategori (questions.md) | Cevap | Durum |
|---|------|--------------------------|---------|--------|
| 1 | {{SORU_1}} | Pilot & Versiyon | {{CEVAP_1}} | [DOGRULANDI] |
| 2 | {{SORU_2}} | Loglama & Analitik | — | [BELIRSIZ] |

---

## 7. Metodoloji ve Kaynaklar

1. **Girdiler:** `docs/mobile-analiz.md` (mobile-02), `docs/mobile-as-is-analiz.md` (mobile-01)
2. **Semantic Search (scopeProject = mobilebanking):**
   - Tur A — `query: "{ekran} validation rule"`, `[".cs"]`
   - Tur B — `query: "{TransactionName} response Error Result"`, `[".cs"]`
   - Tur C — `query: "TrackMobileEvent {konu}"`, `[".cs", ".swift", ".kt"]`
3. **mcp-mssql-db-operations (ChannelID = 10):**
   - MobileMenu Configuration / Validation kontrolü
   - VpStringResource 3 dil doğrulaması
   - VpTransaction durum sorgusu
4. **mcp-figma:** {{FIGMA_LINK_VEYA_YOK}}
5. **questions.md Kontrol Listesi:** TÜM kategoriler tarandı; eksik cevaplar AskQuestion ile alındı.

---

## Değişiklik Geçmişi

| Tarih | Versiyon | Değişiklik |
|-------|----------|------------|
| {{TARIH}} | {{VERSIYON}} | İlk versiyon |

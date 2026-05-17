# Mobile Developer Analiz Dokümanı — {{PROJE_ADI}}

**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Versiyon:** {{VERSIYON}}
**Tarih:** {{TARIH}}
**Hazırlayan:** {{HAZIRLAYAN}}
**Kanal:** Mobil (ChannelID = 10)
**Hedef Kitle:** iOS Developer, Android Developer, mwbackend Developer

> **Girdi:** `docs/mobile-analiz.md` (iş analisti dokümanı — mobile-02 birinci çıktı). Bu doküman onun teknik karşılığıdır; aynı bulgular developer perspektifinden anlatılır.

> Bu doküman common-rules [C17] MCS analiz yöntemiyle çıkarılan input / output / kullanım / çağrı zinciri verilerini kullanır.

---

## İçindekiler

1. iOS Developer Bölümü
2. Android Developer Bölümü
3. mwbackend Developer Bölümü
4. Ortak Geliştirici Notları
5. Definition of Done

---

## 0. Bağlam ve Bağımlılıklar

### Etkilenen Repolar

| Repo | Branch | Etki | Sorumlu Developer |
|------|--------|-------|---------------------|
| `mwbackend` | prod | UseCase / Handler / Service değişikliği | mwbackend dev |
| `ios` | prod | Storyboard / VC / Swift class değişikliği | iOS dev |
| `android` | prod | Activity / Fragment / Kotlin değişikliği | Android dev |
| `MCSVeribranchBI` | prod | (varsa) MCS servis tanımı / mapping | mwbackend / DBA |
| `smg` | prod | (genelde değişmez) framework çağrısı | mwbackend |

### Veritabanı Değişiklikleri

> Detaylı SQL script için `mobile-05-write-implementation-scripts` agentını çalıştır. Bu bölüm yalnızca özet.

| Tablo | Veritabanı | Değişiklik | Kanal |
|-------|------------|-------------|--------|
| VpStringResource | CommonDb | {{N}} key x 3 dil eklenecek | ChannelID = 10 |
| MobileMenu | CommonDb | {{N}} yeni menü | ChannelID = 10 |
| MobileMenuMapping | CommonDb | {{N}} mapping (Pano / NBT / Spotlight) | ChannelID = 10 |
| VpTransaction + Config + Attributes | CommonDb | {{N}} yeni MCS tanımı | ChannelID = 10 |

### Feature Flag / Pilot

| PilotKey | ReversePilot | MinBuild iOS | MinBuild Android |
|-----------|---------------|----------------|---------------------|
| `{{PilotKey}}` | true / false | {{NO}} | {{NO}} |

---

## 1. iOS Developer Bölümü

### 1.1. Yapılacak İşler (Numaralı)

1. {{IS_1}} (örn: `CardListViewController.swift` içinde yeni "Limit Detayı" butonu ekle)
2. {{IS_2}}
3. {{IS_3}}

### 1.2. Etkilenen Dosyalar

| Dosya | Tür | Değişiklik Tipi | Detay |
|-------|------|------------------|--------|
| `ios/{{Modul}}/{{Storyboard}}.storyboard` | Storyboard | Değişti | Yeni UIButton + IBOutlet eklendi |
| `ios/{{Modul}}/{{VC}}.swift` | ViewController | Değişti | `viewDidLoad` + `didTapLimitButton` action |
| `ios/{{Modul}}/{{Model}}.swift` | Model | Yeni / Değişti | Response DTO alanları eklendi |
| `ios/{{Modul}}/{{Service}}.swift` | Network / Service | Değişti | `getCreditCardList` çağrısı |
| `ios/Localization/Localizable.strings` | Resource | tr/en/ar için 3 dosya | ResourceKey'ler `VpStringResource`'tan |

### 1.3. Yeni / Değişen UI Komponentleri

| Komponent | Storyboard ID | Resource Key (Title) | Action / Outlet |
|------------|------------------|------------------------|--------------------|
| {{KOMP_1}} | `{{ID}}` | `{{KEY}}` | `didTapLimit` |
| {{KOMP_2}} | `{{ID}}` | `{{KEY}}` | `cardImageView` (IBOutlet) |

### 1.4. MCS Servis Çağrıları (iOS Network Layer)

iOS client doğrudan MCS çağırmaz; mwbackend endpoint'lerini çağırır. mwbackend developer ile aşağıdaki endpoint'leri koordine et:

| Endpoint (mwbackend) | iOS Service Metodu | Request DTO | Response DTO |
|----------------------|---------------------|--------------|----------------|
| `POST /api/cards/list` | `CardService.getList()` | `GetCardListRequest` | `GetCardListResponse` |

> Endpoint isimleri mwbackend developer tarafından doğrulanır.

### 1.5. Resource Key Kullanımı (iOS)

iOS `GetStringResource("{{KEY}}")` çağrıları için VpStringResource (ChannelID = 10) tablosundaki **tüm 3 dil** kayıtlı olmalı:

| ResourceKey | Kullanıldığı Yer | tr-TR | en-US | ar-SA |
|--------------|---------------------|--------|--------|--------|
| `{{KEY_1}}` | `{{VC}}.titleLabel.text` | ... | ... | ... |
| `{{KEY_2}}` | `{{VC}}.errorAlert.message` | ... | ... | ... |

### 1.6. Pilot Anahtarı + MinBuildNumber Kontrolü (iOS)

```swift
// MobileMenu Configuration JSON içinde:
// "IosMenuItem": { "PilotKey": "{{PilotKey}}", "MinBuildNumber": "{{NO}}" }

// VC içinde:
if !PilotManager.shared.isEnabled("{{PilotKey}}") {
    // menüye erişim engelle veya ekranı gizle
}

if AppInfo.buildNumber < {{MIN_BUILD}} {
    // eski client uyarısı
}
```

### 1.7. Deep Link / Spotlight (iOS özel)

| Tip | Yapılandırma | Test Noktası |
|------|----------------|----------------|
| Deep Link | `Info.plist` URL Scheme + `MobileMenu.Configuration.DeepLinkPath` | Üçüncü partiden gelen link açıyor mu? |
| Spotlight (MenuType 10) | `MobileMenuMapping` kaydı + CoreSpotlight item | iOS Spotlight'tan menü açılıyor mu? |
| 3D Touch (MenuType 9) | `MobileMenuMapping` kaydı + UIApplicationShortcutItem | Uzun bas + tap çalışıyor mu? |

### 1.8. iOS Doğrulama (Test Noktaları)

- [ ] Build ve simülatörde sorunsuz açılıyor
- [ ] KIF / XCUITest senaryoları yeşil (TC-MOB-{{KONU}}-* listesi `docs/mobile-test-cases.md`'de)
- [ ] Memory leak kontrolü (Instruments)
- [ ] VoiceOver okuması test edildi (4.1.Y.X — Engelsiz Bankacılık)
- [ ] tr / en / ar dil değişimi UI'da düzgün
- [ ] PilotKey kapalıyken erişim engellenmiş
- [ ] MinBuildNumber altında uyarı çıkıyor

---

## 2. Android Developer Bölümü

### 2.1. Yapılacak İşler (Numaralı)

1. {{IS_1}} (örn: `CardListActivity.kt` içinde yeni `Button` ekle)
2. {{IS_2}}
3. {{IS_3}}

### 2.2. Etkilenen Dosyalar

| Dosya | Tür | Değişiklik Tipi | Detay |
|-------|------|------------------|--------|
| `android/{{Modul}}/{{Layout}}.xml` | Layout XML | Değişti | Yeni Button + LinearLayout |
| `android/{{Modul}}/{{Activity}}.kt` | Activity | Değişti | `onCreate` + click listener |
| `android/{{Modul}}/{{Fragment}}.kt` | Fragment | Değişti | `onViewCreated` |
| `android/{{Modul}}/{{Model}}.kt` | Data class | Yeni / Değişti | Response model alanları |
| `android/{{Modul}}/{{Repository}}.kt` | Repository | Değişti | API çağrısı |
| `android/AndroidManifest.xml` | Manifest | Değişti / Değişmedi | İzin / deep link / activity tanımı |
| `android/{{Modul}}/res/values/strings.xml` | Resource | tr / en / ar için 3 dosya | ResourceKey'ler |

### 2.3. Yeni / Değişen UI Komponentleri (Android)

| Komponent | Layout View ID | Resource Key (Title) | Listener |
|------------|------------------|------------------------|------------|
| {{KOMP_1}} | `@+id/{{ID}}` | `{{KEY}}` | `onLimitButtonClick` |
| {{KOMP_2}} | `@+id/{{ID}}` | `{{KEY}}` | RecyclerView adapter |

### 2.4. Huawei Build Farkı

QNB mobil Huawei için ayrı bir build varyantı kullanır. Configuration JSON'da `HuaweiMenuItem` alanı bulunur:

| Konfigürasyon | Android (Google) | Huawei |
|-----------------|---------------------|----------|
| ClassName | `com.bank.app.{{Activity}}` | `com.bank.app.Huawei{{Activity}}` (varsa) |
| MinBuildNumber | {{NO}} | {{NO}} |
| Maps SDK | Google Maps | Huawei Maps (varsa) |
| Push | FCM | HMS Push Kit |

> Eğer Huawei özel bir aktivite gerekiyorsa `android/huawei/{{Modul}}/Huawei{{Activity}}.kt` oluşturulur.

### 2.5. MCS Servis Çağrıları (Android Network Layer)

Android client doğrudan MCS çağırmaz; mwbackend endpoint'lerini çağırır.

| Endpoint (mwbackend) | Android Service Metodu | Request DTO | Response DTO |
|----------------------|---------------------------|---------------|----------------|
| `POST /api/cards/list` | `CardRepository.getList()` | `GetCardListRequest` | `GetCardListResponse` |

### 2.6. Resource Key Kullanımı (Android)

`strings.xml` (values-tr, values-en, values-ar):

```xml
<!-- values-tr/strings.xml -->
<string name="{{KEY_1}}">{{TR_DEGER}}</string>
<!-- values-en/strings.xml -->
<string name="{{KEY_1}}">{{EN_DEGER}}</string>
<!-- values-ar/strings.xml -->
<string name="{{KEY_1}}">{{AR_DEGER}}</string>
```

Resource key listesi:

| ResourceKey | Kullanıldığı Yer (Android) | tr-TR | en-US | ar-SA |
|--------------|---------------------------------|--------|--------|--------|
| `{{KEY_1}}` | `R.string.{{KEY_1}}` → titleTextView | ... | ... | ... |

### 2.7. Pilot Anahtarı + MinBuildNumber Kontrolü (Android)

```kotlin
// Activity / Fragment içinde:
if (!PilotManager.isEnabled("{{PilotKey}}")) {
    // menüye erişim engelle
}

if (BuildConfig.VERSION_CODE < {{MIN_BUILD}}) {
    // eski client uyarısı
}
```

### 2.8. Android Doğrulama (Test Noktaları)

- [ ] Build APK + Huawei build varyantı sorunsuz
- [ ] Espresso senaryoları yeşil (TC-MOB-{{KONU}}-* listesi)
- [ ] TalkBack ile aksiyon butonları okunabiliyor
- [ ] Konfigürasyon değişikliği (rotation) sonrası state korunuyor
- [ ] Memory leak kontrolü (LeakCanary)
- [ ] tr / en / ar dil değişimi UI'da düzgün
- [ ] PilotKey kapalıyken erişim engellenmiş
- [ ] MinBuildNumber altında uyarı çıkıyor
- [ ] Huawei varyantında HMS Push doğrulaması (varsa)

---

## 3. mwbackend Developer Bölümü

### 3.1. Yapılacak İşler (Numaralı)

1. {{IS_1}} (örn: `GetCardListUseCase.cs` içinde yeni `LimitInfo` mapping ekle)
2. {{IS_2}}
3. {{IS_3}}

### 3.2. DDD Katman Yerleşimi

| Katman | Repo Yolu | Sorumluluğu | Yeni / Değişen |
|--------|------------|---------------|------------------|
| **Application — Controller** | `mwbackend/Application/{{Domain}}/Controller/{{Adi}}Controller.cs` | HTTP endpoint, MediatR send | {{Y/D}} |
| **Application — Handler** | `mwbackend/Application/{{Domain}}/Handler/{{Adi}}Handler.cs` | Command / Query handler, orkestrasyon | {{Y/D}} |
| **Application — UseCase** | `mwbackend/Application/{{Domain}}/UseCase/{{Adi}}UseCase.cs` | Süreç adımları, response mapping | {{Y/D}} |
| **Application — Helper** | `mwbackend/Application/{{Domain}}/Helper/{{Adi}}Helper.cs` | İş kuralı, alan dönüşümü | {{Y/D}} |
| **Domain — Service** | `mwbackend/Domain/{{Domain}}/Service/{{Adi}}Service.cs` | MCS çağrısı, `TransactionNameConstants.{{TXN}}` | {{Y/D}} |
| **Common — Constant** | `mwbackend/Common/Constant/TransactionNameConstants.cs` | Yeni TransactionName eklenmesi | {{Y/D}} |
| **MCSVeribranchBI** | `MCSVeribranchBI/{{Servis}}/{{Dosya}}.cs` | (varsa) MCS servis tanımı | {{Y/D}} |

### 3.3. Yeni / Değişen MCS Çağrıları (common-rules [C17] Tablo A)

| Alan | Değer |
|------|-------|
| TransactionName | `{{TXN}}` |
| ChannelID = 10 tanımlı | {{Evet — fallback kanal}} |
| RequestType | `VeriBranch.Common.MessageDefinitions.{{TXN}}Request` |
| ResponseType | `VeriBranch.Common.MessageDefinitions.{{TXN}}Response` |
| HostProcessCode | `{{KOD}}` |

### 3.4. Request / Response Model Alanları (common-rules [C17] Tablo B)

| Yön | Alan Adı | Tip | Zorunlu | mwbackend Kullanım Yeri |
|------|-----------|-----|----------|----------------------------|
| IN | `CustomerNo` | string | Evet | Handler — session'dan alınıyor |
| IN | `CardNumber` | string? | Hayır | UseCase — opsiyonel filtre |
| OUT | `Cards[]` | List<Card> | — | UseCase.Map() → clienta DTO |
| OUT | `Cards[].MaskedPan` | string | — | Response mapping (4.1.Y.10) |
| OUT | `Cards[].LimitInfo` | object | — | Helper.CalculateLimit() |

### 3.5. Çağrı Zinciri (common-rules [C17] Tablo C)

```csharp
// Pseudo kod — gerçek implementasyon DDD katmanlarına yayılır
public async Task<{{Adi}}Response> Handle({{Adi}}Query query)
{
    // Adım 1
    var customer = await _customerService.ExecuteAsync(
        TransactionNameConstants.GetCustomerInfo, customerReq);

    // Adım 2 — asıl servis
    var cards = await _cardService.ExecuteAsync(
        TransactionNameConstants.{{TXN}}, cardReq);

    // Adım 3 — koşullu
    if (cards.Result.HasMore) {
        var moreCards = await _cardService.ExecuteAsync(
            TransactionNameConstants.GetMoreCards, moreReq);
    }

    // Response mapping
    return _mapper.Map<{{Adi}}Response>(cards);
}
```

| Sıra | TransactionName | Karar Koşulu | Etki |
|------|------------------|---------------|--------|
| 1 | `GetCustomerInfo` | Her zaman | Müşteri doğrulama |
| 2 | `{{TXN}}` | Her zaman | Asıl iş |
| 3 | `GetMoreCards` | response.HasMore = true | Sayfalama |

### 3.6. Domain Service (MCS Çağrısı) Pattern

```csharp
public interface I{{Adi}}Service
{
    Task<{{Adi}}Response> Execute{{Adi}}Async({{Adi}}Request request);
}

public class {{Adi}}Service : I{{Adi}}Service
{
    private readonly IMcsClient _mcsClient;

    public async Task<{{Adi}}Response> Execute{{Adi}}Async({{Adi}}Request request)
    {
        return await _mcsClient.ExecuteAsync<{{Adi}}Request, {{Adi}}Response>(
            TransactionNameConstants.{{TXN}}, request);
    }
}
```

### 3.7. Validation / İş Kuralı (Helper)

```csharp
public class {{Adi}}Helper
{
    public bool IsValidForOperation({{Adi}}Request request)
    {
        // ClientValidationList JSON tarafı (MobileMenu.Validation) + server validation
        if (string.IsNullOrEmpty(request.CustomerNo)) return false;
        if (request.Amount <= 0) return false;
        return true;
    }
}
```

### 3.8. Loglama (mwbackend)

| Log Tipi | Yöntem | Tablo |
|----------|---------|--------|
| Otomatik request/response log | `[LoggableMethod]` attribute | VpDefaultLog (LoggingVerbosity=1111) |
| Hata log | `_logger.LogError(ex, ...)` | VpExceptionLog |
| İşlem geçmişi | Framework otomatik | VpMobileContactHistory |

### 3.9. Backend Doğrulama (Test Noktaları)

- [ ] Unit test coverage > %80 (UseCase, Handler, Helper, Service)
- [ ] Integration test — gerçek MCS endpoint çağrısı (UAT)
- [ ] xUnit / NUnit testleri yeşil
- [ ] Build sorunsuz (CI pipeline)
- [ ] TransactionNameConstants sabit eklendi
- [ ] VpTransaction + Config + Attributes script çalıştı (mobile-05 çıktısı)
- [ ] Postman / Swagger ile endpoint manuel doğrulandı
- [ ] Log alanları VpDefaultLog'da gözükür durumda
- [ ] Eski request/response sözleşmesi bozulmadı (backward compatibility — eski client'lar için)

---

## 4. Ortak Geliştirici Notları

### 4.1. API Endpoint Listesi (mwbackend ↔ Client)

| Endpoint | Method | mwbackend Handler | Client Çağıran (iOS / Android) | MCS Çağrı Zinciri |
|----------|---------|----------------------|----------------------------------|---------------------|
| `/api/{{path}}` | POST | `mwbackend/.../{{Handler}}.cs` | `CardService` / `CardRepository` | `GetCustomerInfo` → `{{TXN}}` |

### 4.2. Resource Key Haritası (3 dil — tek tabloda)

| ResourceType | ResourceKey | tr-TR | en-US | ar-SA | iOS Kullanım | Android Kullanım |
|---------------|--------------|--------|--------|--------|----------------|---------------------|
| MobileMenu | `{{KEY}}` | ... | ... | ... | `Localizable.strings` | `R.string.{{KEY}}` |
| GeneralResource | `{{KEY}}` | ... | ... | ... | ... | ... |
| {{ResourceType}} | `{{KEY}}` | ... | ... | ... | ... | ... |

### 4.3. Hata Mesaj Haritası

| Hata Kodu | Validation FilterKey | ActionType | ResourceKey (mesaj) | Davranış |
|------------|------------------------|--------------|-----------------------|------------|
| {{KOD_1}} | {{FILTER_1}} | 0 — gizle | `{{MSG_KEY_1}}` | Menü gizlenir |
| {{KOD_2}} | {{FILTER_2}} | 1 — popup + akış kes | `{{MSG_KEY_2}}` | Popup gösterilir, akış durur |
| {{KOD_3}} | {{FILTER_3}} | 2 — popup + yönlendir | `{{MSG_KEY_3}}` | Popup gösterilir, sayfa açılır |

### 4.4. Feature Flag (PilotKey) Listesi

| PilotKey | Açıklama | ReversePilot | iOS MinBuild | Android MinBuild |
|-----------|------------|----------------|------------------|---------------------|
| `{{KEY}}` | {{ACK}} | false | {{NO}} | {{NO}} |

### 4.5. Repo Koordinasyonu (Cross-Repo Bağımlılık Sırası)

| Sıra | Repo | İşlem | Beklenen Tamamlanma |
|------|------|-------|----------------------|
| 1 | mwbackend | VpTransaction tanımı + mock dönüş | Sprint 1 |
| 2 | mwbackend | MCS gerçek implementasyon | Sprint 2 |
| 3 | ios + android (paralel) | UI + endpoint integration | Sprint 2 |
| 4 | mwbackend + ios + android | UAT entegrasyon testi | Sprint 3 |
| 5 | All | Prod release | Sprint 3 sonu |

---

## 5. Definition of Done (DoD)

Aşağıdaki maddelerin **hepsi** yapılmış olmalı:

- [ ] Code review onayı alındı (en az 2 reviewer)
- [ ] Unit test coverage hedefi tutturuldu (backend %80, client kritik akış %60)
- [ ] Integration test başarılı (UAT ortamında)
- [ ] TC-MOB-* test caseleri yeşil (`docs/mobile-test-cases.md`)
- [ ] Performance test (login süresi, ekran açılma süresi) regresyon yok
- [ ] Loglama alanları kontrol edildi (TrackMobileEvent + VpDefaultLog + Dataroid/Adjust event payload)
- [ ] Resource key 3 dil tamamlandı (`VpStringResource` ChannelID=10)
- [ ] PilotKey doğru çalışıyor (on / off + ReversePilot)
- [ ] MinBuildNumber altında eski client uyarısı doğru çıkıyor
- [ ] BDDK / KVKK / Pentest / Seala kontrolleri (questions.md "Güvenlik & Hukuk") tamamlandı
- [ ] Engelsiz Bankacılık kontrolü (VoiceOver / TalkBack + sözleşmeli işlem)
- [ ] mobile-05 ile üretilen SQL script'leri DBA tarafından prod ortama uygulandı
- [ ] changelog.md güncellendi (common-rules [C12])
- [ ] Rollback planı belirlendi (3.4.8 — Geri Dönüş Planı)
- [ ] Q ekibi bilgilendirildi (yeni menü / değişen menü için)
- [ ] Chatbot ekibine analiz dokümanı paylaşıldı (3.4.4)

---

## Metodoloji ve Kaynaklar

1. **İş Analizi Girdisi:** `docs/mobile-analiz.md` (mobile-02 birinci çıktı)
2. **AS-IS Girdisi:** `docs/mobile-as-is-analiz.md` (mobile-01)
3. **MCS Input / Output Analizi:** common-rules [C17] 5 adımlı yöntem (DB fallback + mwbackend alan kullanımı + çağrı zinciri)
4. **Semantic Search (scopeProject = mobilebanking):**
   - Tur — `{{TXN}}Request kullanım Handler UseCase`, `[".cs"]`
   - Tur — `{{TXN}}Response field mapping`, `[".cs"]`
   - Tur — `{{Konu}} TransactionNameConstants Execute`, `[".cs"]` — çağrı zinciri
   - Tur — iOS Storyboard / VC araştırması, `[".swift"]`
   - Tur — Android Activity / Fragment araştırması, `[".kt", ".java"]`
5. **mcp-mssql-db-operations (ChannelID = 10):**
   - VpTransactionConfig (XML config) — RequestType / ResponseType
   - Diğer kanal fallback sorgusu (ChannelID IN (20, 30, 40, 50))
   - VpHostCallMappingDetail — parametre listesi
6. **mcp-figma:** {{LINK_VEYA_YOK}}

---

## Değişiklik Geçmişi

| Tarih | Versiyon | Değişiklik |
|-------|----------|------------|
| {{TARIH}} | {{VERSIYON}} | İlk versiyon |

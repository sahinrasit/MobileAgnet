# {{PROJE_KODU}} {{PROJE_ADI}} — iOS Teknik Analiz

> **Bu doküman `mobile-architect` agentı tarafından üretilir.** Kaynak: `docs/mobile-sdlc-analiz.md` + codebase keşfi (semantic-search) + DB (mssql).
> **Hedef Kitle:** iOS developer.
> **Tamamlayıcı dokümanlar:** `architect-index.md` (cross-platform overview), `architect-backend.md` (endpoint sözleşmesi).

---

## Değişiklik Tarihçesi

| Tarih | Sürüm | Hazırlayan | Değişiklik |
|-------|-------|------------|------------|
| {{TARIH}} | v1 | {{HAZIRLAYAN}} | İlk versiyon — SDLC çıktısından türetildi |

---

## 1. Bağlam ve Kapsam

**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Geliştirme Tipi:** {{mevcut ek iş / sıfırdan yeni}}
**SDLC Kaynak Dokümanı:** `docs/mobile-sdlc-analiz.md`
**Kapsanan İşlevler (SDLC 4.1):** {{4.1.1, 4.1.2, ... işlev listesi}}
**Hedef iOS Build:** {{XCode sürümü / Swift sürümü}}
**Min iOS:** {{iOS X.Y}}

> SDLC dokümanından alınan kısa proje özeti: {{1-2 cümle}}.

---

## 2. Etkilenen Modül / Klasör Haritası (iOS Repo)

> semantic-search ile doğrulanmış mevcut yapı. Yeni öneriler bu yapıya göre türetilmiştir.

| Klasör | Sorumluluk | Değişiklik Tipi |
|--------|------------|------------------|
| `ios/Modules/{{Modul}}/View/` | Storyboard + ViewController | {{Yeni / Değişen}} |
| `ios/Modules/{{Modul}}/Model/` | DTO + domain model | {{Yeni / Değişen}} |
| `ios/Modules/{{Modul}}/Service/` | Network layer (mwbackend endpoint client) | {{Yeni / Değişen}} |
| `ios/Modules/{{Modul}}/Coordinator/` | Navigation | {{Yeni / Değişen}} |
| `ios/Localization/Localizable.strings` (tr/en/ar) | Resource key değerleri | Değişen |
| `ios/Common/PilotManager.swift` | (mevcut) Pilot kontrolü | Değişmez (kullanılır) |
| `ios/Common/Logging/TrackMobileEvent.swift` | (mevcut) Event log | Değişmez (kullanılır) |

> Modül adı belirsizse `[BELIRSIZ — mevcut modül yapısı doğrulanacak]`.

---

## 3. Yapılacak İşler — İşlev Bazında

> Her 4.1.X işlevi için 10 alt başlık. SDLC dokümanındaki 4.1.X iskeleti (8 bölüm) bu teknik bölüme dönüştürülmüştür.

### 3.1 — 4.1.{{N}} {{İşlev Adı}}

#### 3.1.1 Mevcut Durum (Semantic-Search Bulgusu)

| Mevcut Bileşen | Konum | Not |
|----------------|-------|-----|
| {{Mevcut VC adı}} | `ios/Modules/{{Modul}}/View/{{VC}}.swift` | Hangi tab/scenede çalışıyor |
| {{Mevcut Storyboard}} | `ios/Modules/{{Modul}}/View/{{Storyboard}}.storyboard` | |
| {{Mevcut servis client}} | `ios/Modules/{{Modul}}/Service/{{Service}}.swift` | |

> semantic-search ile bulunmayan referanslar için `[BELIRSIZ — codebase'de doğrulanamadı]`.

#### 3.1.2 Eklenecek / Değişecek Dosyalar

| Dosya | Tür | Değişiklik | Detay |
|-------|------|------------|-------|
| `ios/Modules/{{Modul}}/View/{{Storyboard}}.storyboard` | Storyboard | {{Değişen / Yeni}} | {{Eklenen UI component'ler}} |
| `ios/Modules/{{Modul}}/View/{{VC}}.swift` | ViewController | {{Değişen / Yeni}} | {{Eklenen IBOutlet, IBAction, lifecycle method}} |
| `ios/Modules/{{Modul}}/View/{{Cell}}.swift` | TableViewCell / CollectionViewCell | {{Değişen / Yeni}} | (varsa) liste/tablo cell'i |
| `ios/Modules/{{Modul}}/Model/{{Model}}.swift` | Codable struct | {{Değişen / Yeni}} | Request / Response DTO |
| `ios/Modules/{{Modul}}/Service/{{Service}}.swift` | Network client | {{Değişen / Yeni}} | mwbackend endpoint çağrısı |
| `ios/Modules/{{Modul}}/Coordinator/{{Coordinator}}.swift` | Coordinator | {{Değişen / Yeni}} | Yönlendirme akışı |

#### 3.1.3 Yeni / Değişen Sınıf, Metod, IBOutlet

```swift
// Sınıf imzası — örnek
final class CurrencyAlarmCreateViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var {{outlet1}}: UILabel!         // {{Açıklama}}
    @IBOutlet weak var {{outlet2}}: UIButton!        // {{Açıklama}}

    // MARK: - Properties
    private var viewModel: {{ViewModel}}

    // MARK: - Lifecycle
    override func viewDidLoad() { super.viewDidLoad(); /* setup */ }

    // MARK: - Actions
    @IBAction func {{action1}}(_ sender: UIButton) { /* aksiyon */ }
}
```

| Sınıf | Metod / Outlet / Action | İmza | Sorumluluk |
|-------|-------------------------|------|------------|
| {{VC}} | `viewDidLoad()` | — | İlk yükleme + servis çağrısı |
| {{VC}} | `{{action1}}(_:)` | `IBAction` | Buton tıklama → akış başlat |
| {{VC}} | `{{outlet1}}` | `UILabel` | {{Hangi metin gösteriliyor}} |
| {{ViewModel}} | `load{{Data}}()` | `async throws` | mwbackend servisini çağırır |

#### 3.1.4 Resource Key Kullanımı (SDLC 3.4.5 ile Senkron)

> Resource key adları **SDLC 3.4.5 CMS tablosundan birebir** alınır.

| ResourceKey | Kullanım Yeri | Çağrı |
|-------------|----------------|-------|
| `{{KEY_1}}` | `{{VC}}.{{label}}.text` | `"{{KEY_1}}".localized()` |
| `{{KEY_2}}` | Popup mesajı | `Alert.show(title:, message: "{{KEY_2}}".localized())` |
| `{{KEY_3}}` | Toast mesajı | `Toast.show("{{KEY_3}}".localized())` |

**Localizable.strings güncellemesi:**

```swift
// ios/Localization/tr.lproj/Localizable.strings
"{{KEY_1}}" = "{{TR değer — SDLC 3.4.5'ten}}";

// en.lproj — [ÇEVİRİ GEREKLİ] olanlar VpStringResource senkronundan sonra çekilir
// ar.lproj — aynı
```

> Yeni key'ler `mobile-05-write-implementation-scripts` tarafından `VpStringResource` INSERT'i ile DB'ye atılır.

#### 3.1.5 Servis / Endpoint Çağrıları (mwbackend Koordinasyonu)

> iOS doğrudan MCS çağırmaz; mwbackend endpoint'ini çağırır. Endpoint sözleşmesi `architect-backend.md` Bölüm 3.x'te tanımlıdır.

| Endpoint (mwbackend) | iOS Service Metodu | Request DTO | Response DTO |
|----------------------|---------------------|-------------|---------------|
| `POST /api/{{kebab-konu}}` | `{{Service}}.create(req:)` | `{{Konu}}CreateRequest` | `{{Konu}}CreateResponse` |
| `GET /api/{{kebab-konu}}` | `{{Service}}.list()` | — | `{{Konu}}ListResponse` |
| `PUT /api/{{kebab-konu}}/{id}` | `{{Service}}.update(id:req:)` | `{{Konu}}UpdateRequest` | `{{Konu}}UpdateResponse` |
| `DELETE /api/{{kebab-konu}}/{id}` | `{{Service}}.delete(id:)` | — | `{{Konu}}DeleteResponse` |

```swift
// Service örneği
protocol CurrencyAlarmServicing {
    func list() async throws -> CurrencyAlarmListResponse
    func create(req: CurrencyAlarmCreateRequest) async throws -> CurrencyAlarmCreateResponse
}

final class CurrencyAlarmService: CurrencyAlarmServicing {
    private let api: APIClient
    // implementation
}
```

#### 3.1.6 UI Komponent Yerleşimi (SDLC 4.1.X step 2 + 3'ten)

> SDLC dokümanındaki "Ekran konumu ve giriş noktası" ile "Yeni davranışlar" iOS karşılığı:

| SDLC Bulgusu | iOS Karşılığı |
|--------------|----------------|
| Yerleşim: "{{X}}'nin altında, {{Y}}'nin üstünde" | Storyboard'da Auto Layout constraint: `topAnchor = {{X}}.bottomAnchor`, `bottomAnchor = {{Y}}.topAnchor` |
| Yeni sekme | UITabBarController içinde yeni `UITabBarItem` (Configuration JSON'da MenuType + index pozisyonu) |
| Picker | `UIPickerView` veya `BottomSheet` (action sheet pattern) |
| Ters çevirme butonu (örnek) | `UIButton` IBOutlet + `IBAction` ile swap mantığı; pasif/aktif `isEnabled` |
| Bottom sheet | `UIViewController.modalPresentationStyle = .pageSheet` veya custom presentation |

> Görünürlük koşulu (SDLC'den): "Aktif kayıt varsa görünür" → `tabBar.items` veya menü konfigürasyonu pilot/data state'e göre dinamik.

#### 3.1.7 Form Validasyon İmplementasyonu (SDLC 4.1.X step 5 → kod)

> SDLC Form Validasyon Tablosu'ndaki her satır için iOS karşılığı:

```swift
// Validation sınıfı — örnek
struct CurrencyAlarmValidator {
    static func validate(req: CurrencyAlarmCreateRequest) -> ValidationResult {
        guard !req.fromCurrency.isEmpty else { return .invalid("{{KEY_VALIDATION_FROM_REQUIRED}}".localized()) }
        guard req.fromCurrency != req.toCurrency else { return .invalid("{{KEY_VALIDATION_SAME_CURRENCY}}".localized()) }
        guard req.targetRate > 0 else { return .invalid("{{KEY_VALIDATION_INVALID_RATE}}".localized()) }
        // ...
        return .valid
    }
}
```

| Alan | Validasyon Tetiği | Gösterim Tipi (iOS) |
|------|-------------------|----------------------|
| {{Alan}} | on-blur | `errorLabel.isHidden = false; errorLabel.text = ...` (inline) |
| Çapraz alan | submit-time | `UIAlertController` popup |

#### 3.1.8 Loglama (TrackMobileEvent / Dataroid / Adjust)

> SDLC 4.3.1'deki **somut event listesi**'nden:

| Event | Tetiklendiği Yer | Payload Alanları |
|-------|------------------|-------------------|
| `currency_alarm_screen_view` | `viewWillAppear` | screen_name |
| `currency_alarm_created` | Servis başarılı dönüş | currency_pair, target_rate, end_date |
| `currency_alarm_delete_confirm` | "Evet" butonu | alarm_id |
| `pn_open` | Deep link handler | source, deep_link_path |

```swift
TrackMobileEvent.send("currency_alarm_created", payload: [
    "currency_pair": req.currencyPair,
    "target_rate": req.targetRate
])
Adjust.trackEvent(eventToken: "{{ADJUST_TOKEN}}")
Dataroid.customEvent("currency_alarm_created")
```

#### 3.1.9 Pilot / MinBuildNumber Kontrolü

```swift
guard PilotManager.shared.isEnabled("{{PilotKey}}") else {
    // Menü/buton gizle veya ekran kapat
    return
}

guard AppInfo.buildNumber >= {{MIN_BUILD_IOS}} else {
    // Eski client — yeni özellik gösterilmez; mevcut akış devam eder
    return
}
```

| Anahtar | Değer | Kaynak |
|---------|-------|--------|
| PilotKey | `{{PilotKey}}` | SDLC `[A18]` |
| MinBuildNumber iOS | `{{MIN_BUILD_IOS}}` | SDLC `[A18]` |
| Configuration JSON şablonu | `architect-backend.md` Bölüm 5'te | — |

#### 3.1.10 Test Noktaları

- [ ] Build + simülatörde sorunsuz
- [ ] tr / en / ar UI doğru gösteriliyor
- [ ] PilotKey kapalıyken erişim engelleniyor
- [ ] MinBuildNumber altında akış gösterilmiyor
- [ ] KIF / XCUITest senaryoları yeşil (TC-MOB-{{KONU}}-IOS-*; `docs/mobile-test-cases.md`)
- [ ] Memory leak (Instruments) ile doğrulandı
- [ ] VoiceOver (Engelsiz Bankacılık) okuması test edildi
- [ ] Endpoint hata senaryoları (4xx/5xx/timeout) doğru ele alınıyor

---

### 3.2 — 4.1.{{M}} {{İşlev Adı}}

> Yukarıdaki 10 alt başlık şablonu her 4.1.X için tekrarlanır.

---

## 4. Ortak Değişiklikler (Project-Wide)

| Konu | Dosya | Değişiklik |
|------|-------|------------|
| Localizable.strings (tr/en/ar) | `ios/Localization/*.lproj/Localizable.strings` | {{N}} yeni key |
| Network layer base | `ios/Common/Network/APIClient.swift` | (varsa) endpoint base url / interceptor değişikliği |
| ResourceManager | `ios/Common/Resources/ResourceManager.swift` | (varsa) yeni key cache |
| AppDelegate / SceneDelegate | `ios/App/SceneDelegate.swift` | (varsa) deep link handler |
| Info.plist | `ios/App/Info.plist` | (varsa) URL Scheme / capability |

---

## 5. Pilot ve Versiyon Konfigürasyonu

| Konfigürasyon | Değer | Yer |
|----------------|-------|-----|
| PilotKey | `{{PilotKey}}` | `MobileMenu.Configuration` JSON (backend) |
| ReversePilot | `false` | aynı |
| MinBuildNumber iOS | `{{MIN_BUILD_IOS}}` | aynı |
| Force Update | {{Var/Yok}} | (varsa) AppStore süreciyle koordinasyon |

> JSON şablonu `architect-backend.md` Bölüm 5'te tam haliyle var.

---

## 6. Bağımlılık Sırası

| Sıra | İş | Sorumlu | Beklenen |
|------|----|---------|----------|
| 1 | mwbackend endpoint mock + sözleşme dondurma | mwbackend dev | Sprint X |
| 2 | iOS service layer + DTO | iOS dev | Sprint X |
| 3 | iOS UI (Storyboard + VC) | iOS dev | Sprint X+1 |
| 4 | mwbackend gerçek MCS entegrasyon | mwbackend dev | Sprint X+1 |
| 5 | UAT integration | Tüm taraflar | Sprint X+2 |

---

## 7. Test ve Doğrulama Notları

- Test senaryoları: `docs/mobile-test-cases.md` (mobile-03 çıktısı)
- Manual test rehberi (resimli): {{TBD}}
- UAT ortam URL: {{TBD}}

---

## 8. Definition of Done — iOS

- [ ] Code review onayı (en az 1 iOS reviewer + 1 cross-platform reviewer)
- [ ] Unit test coverage > %60 (kritik akış)
- [ ] KIF / XCUITest senaryoları yeşil
- [ ] tr / en / ar resource key tamamlandı (`VpStringResource` ChannelID=10 doğrulandı)
- [ ] PilotKey doğru çalışıyor (on/off + ReversePilot)
- [ ] MinBuildNumber altında eski client davranışı doğru
- [ ] Loglama event payload'ları VpDefaultLog / Dataroid / Adjust'ta görünür
- [ ] VoiceOver okuması test edildi (Engelsiz Bankacılık)
- [ ] Memory leak yok (Instruments)
- [ ] Endpoint hata senaryoları (4xx/5xx/timeout) UI'da düzgün ele alınıyor

---

## Kaynaklar

| Kaynak | Yol |
|--------|-----|
| SDLC analiz | `docs/mobile-sdlc-analiz.md` |
| Cross-platform overview | `docs/architect/architect-index.md` |
| Backend sözleşmesi | `docs/architect/architect-backend.md` |
| Codebase keşfi cache | `docs/.architect-codebase-cache.json` |
| Test senaryoları (üretilince) | `docs/mobile-test-cases.md` |
| DB INSERT script'leri (üretilince) | `docs/mobile-implementation-script.sql` |

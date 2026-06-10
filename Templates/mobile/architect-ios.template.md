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
| `ios/Common/Resources/ResourceManager.swift` | Resource key okuma (backend endpoint output — [B8]) | Değişmez (kullanılır) |
| `ios/Common/PilotManager.swift` | (mevcut) Pilot kontrolü | Değişmez (kullanılır) |
| `ios/Common/Logging/TrackMobileEvent.swift` | (mevcut) Event log | Değişmez (kullanılır) |

> Modül adı belirsizse `[BELIRSIZ — mevcut modül yapısı doğrulanacak]`.

---

## 3. Yapılacak İşler — İşlev Bazında

> Her 4.1.X işlevi için 11 alt başlık (3.1.0 – 3.1.10). SDLC dokümanındaki 4.1.X iskeleti (8 bölüm) bu teknik bölüme dönüştürülmüştür.
> **[B18] ZORUNLU:** Her alt başlık tablodan/koddan önce 2-5 cümlelik açıklayıcı paragrafla başlar. UI bölümleri ekran davranışını kullanıcı gözünden akış sırasıyla anlatır (açılışta ne olur → kullanıcı ne görür → etkileşimde ne tetiklenir → başarı/hata/boş durumda ne gösterilir). Doğrudan tabloyla başlayan bölüm sığ kabul edilir.
> **[B19] ZORUNLU:** Tablolardaki her metot, property, outlet ve alan için "ne iş yapar" açıklaması en az 1-2 tam cümledir; mevcut öğelerin yanına **(MEVCUT)** + konumu yazılır. Doküman tek başına bir developer'ın veya AI agent'ın soru sormadan kodlamasına yetecek kadar eksiksiz olmalıdır.

### 3.1 — 4.1.{{N}} {{İşlev Adı}}

#### 3.1.0 Bağlam

> 1-2 paragraf — SDLC 4.1.{{N}} girişinden: bu işlev kullanıcıya ne sağlar, mevcut akışa nasıl eklenir, iOS tarafında hangi ekran/komponentler yapılır ve hangi backend endpoint'i kullanılır.

**Ekran Tasarımları (Figma):**

| Ekran | Figma Linki |
|-------|--------------|
| {{Ekran adı}} | [{{Ekran adı}}](https://figma.com/...?node-id={{...}}) veya `[BELIRSIZ — Figma linki eklenecek]` |
| {{Popup / bottom sheet}} | {{link}} |

#### 3.1.1 Mevcut Durum (Semantic-Search Bulgusu)

| Mevcut Bileşen | Konum | Not |
|----------------|-------|-----|
| {{Mevcut VC adı}} | `ios/Modules/{{Modul}}/View/{{VC}}.swift` | Hangi tab/scenede çalışıyor |
| {{Mevcut Storyboard}} | `ios/Modules/{{Modul}}/View/{{Storyboard}}.storyboard` | |
| {{Mevcut servis client}} | `ios/Modules/{{Modul}}/Service/{{Service}}.swift` | |

> semantic-search ile bulunmayan referanslar için `[BELIRSIZ — codebase'de doğrulanamadı]`.

#### 3.1.2 Eklenecek / Değişecek Dosyalar

> Statü üç değerli ([B17.1]): **YENİ** / **MEVCUT — genişletiliyor** (delta yazılır) / **MEVCUT — değişmiyor** (kullanılır). Mevcut ekrana komponent ekleniyorsa VC/Storyboard "MEVCUT — genişletiliyor" olur, yeni ekran açılmaz.

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

> **[B19] ZORUNLU:** Her satırın "Ne İş Yapar" hücresi en az 1-2 tam cümle: öğe ne zaman çağrılır/set edilir, hangi akışın parçasıdır, hangi öğelerle ilişkilidir. Tek kelimelik açıklama yetersizdir. Mevcut öğelerin yanına **(MEVCUT)** + tanımlı olduğu yer yazılır.

| Sınıf | Metod / Outlet / Property | Statü | İmza | Ne İş Yapar (detaylı) |
|-------|----------------------------|-------|------|------------------------|
| {{VC}} | `viewDidLoad()` | {{YENİ/MEVCUT}} | — | {{Örn: "Ekran ilk yüklendiğinde çalışır; başlık ve buton metinlerini 3.1.4'teki key'lerden set eder, ardından `viewModel.load{{Data}}()` çağırarak listeyi çeker."}} |
| {{VC}} | `{{action1}}(_:)` | {{...}} | `IBAction` | {{Örn: "Kullanıcı {{buton}}'a bastığında tetiklenir; önce `{{Validator}}.validate` çalıştırır, geçerse `{{Service}}.create` çağırır, dönen `resultMessageKey` ile toast gösterir."}} |
| {{VC}} | `{{outlet1}}` | {{...}} | `UILabel` | {{Örn: "{{Ekran}} başlığını gösterir; metni `{{KEY_1}}` key'inin response değerinden gelir."}} |
| {{ViewModel}} | `alarms` | {{...}} | `[{{Item}}]` | {{Örn: "list() yanıtındaki alarm listesini tutar; tableView datasource buradan beslenir, silme sonrası güncellenir."}} |
| {{ViewModel}} | `load{{Data}}()` | {{...}} | `async throws` | {{Örn: "Ekran açılışında ve pull-to-refresh'te çağrılır; `GET {{endpoint}}`'i çağırıp sonucu `alarms`'a yazar, hata durumunda `errorState`'i set eder."}} |

#### 3.1.4 Resource Key Kullanımı ([B8] Envanteri — Bu Ekranın TÜM Key'leri)

> Kaynak: [B3.1] tam key envanteri (Figma / ekran tasarımı + SDLC). Bu ekranda görünen **her metin** (mevcut + yeni key) bu tabloda yer alır.
> **Dağıtım modeli:** Resource key değerleri client'a **backend endpoint output'unda döner**; metin lokal dosyadan değil response'tan / ResourceManager'dan okunur.

| ResourceKey | Durum | Dönen Endpoint / Response Alanı | iOS Kullanım Yeri |
|-------------|-------|----------------------------------|--------------------|
| `{{KEY_1}}` | yeni | `GET /api/{{kebab}}` → `resourceKeys` | `{{VC}}.titleLabel.text` |
| `{{KEY_2}}` | yeni | `POST /api/{{kebab}}` → `BusinessException.MessageKey` | Hata popup mesajı |
| `{{KEY_3}}` | mevcut | `{{endpoint}}` → `resultMessageKey` | Başarı toast'ı |

```swift
// Response'tan key okuma — örnek
let title = response.resourceKeys["{{KEY_1}}"]
toastView.show(message: response.resultMessage)   // backend resultMessageKey değerini döner
```

> Yeni key'ler `mobile-05-write-implementation-scripts` tarafından `VpStringResource` (ChannelID=10) INSERT'i ile DB'ye atılır; backend bunları endpoint output'una koyar. Codebase keşfi lokal bundle (Localizable.strings) kullanımını **kanıtlarsa** ilgili key satırına ayrı not düşülür.

#### 3.1.5 Servis / Endpoint Çağrıları (mwbackend Koordinasyonu)

> iOS doğrudan MCS çağırmaz; mwbackend endpoint'ini çağırır. Endpoint sözleşmesi `architect-backend.md` Bölüm 3.x'te tanımlıdır.

> **[B17.1]:** Endpoint statüsü (YENİ / MEVCUT — genişletiliyor / MEVCUT) backend dokümanıyla birebir aynı yazılır. Mevcut endpoint genişletiliyorsa iOS tarafında yalnızca **eklenen alanların** kullanımı yazılır (örn. "mevcut `GetX` response'una eklenen `buttonNameKey` → yeni butonun title'ı").

| Endpoint (mwbackend) | Statü | iOS Service Metodu | Request DTO | Response DTO | Tetiklendiği Yer |
|----------------------|-------|---------------------|-------------|---------------|-------------------|
| `POST /api/{{kebab-konu}}` | {{YENİ / MEVCUT...}} | `{{Service}}.create(req:)` | `{{Konu}}CreateRequest` | `{{Konu}}CreateResponse` | {{Buton / lifecycle}} |
| `GET /api/{{kebab-konu}}` | {{...}} | `{{Service}}.list()` | — | `{{Konu}}ListResponse` | `viewWillAppear` |
| `PUT /api/{{kebab-konu}}/{id}` | `{{Service}}.update(id:req:)` | `{{Konu}}UpdateRequest` | `{{Konu}}UpdateResponse` | {{...}} |
| `DELETE /api/{{kebab-konu}}/{id}` | `{{Service}}.delete(id:)` | — | `{{Konu}}DeleteResponse` | {{...}} |

**Parametre Eşleme — Request ([B16.2] ZORUNLU, her çağrı için):**

> Backend `architect-backend.md` 3.x.3 Input tablosuyla birebir senkron.

| Endpoint Input Alanı | Tip | iOS Kaynağı (UI alanı / state) | Not |
|----------------------|-----|--------------------------------|-----|
| `{{alan1}}` | string | `{{picker}}` seçimi → `viewModel.{{prop}}` | {{validasyon}} |
| `{{alan2}}` | decimal | `{{textField}}.text` → parse | > 0 kontrolü client'ta da |

**Output Kullanımı — Response ([B16.2] ZORUNLU):**

| Endpoint Output Alanı | Tip | iOS Kullanım Yeri | Hata/Boş Durum |
|------------------------|-----|--------------------|------------------|
| `{{liste[]}}` | `[{{Item}}]` | `tableView` datasource | Boş → empty state komponenti |
| `resourceKeys` / `resultMessageKey` | dict / string | 3.1.4 tablosu | — |

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

**Ekran davranışı ([B18.2]):**

> {{Akış sırasıyla anlatım — örnek: "Kullanıcı {{giriş noktası}}'ndan ekrana geldiğinde açılışta `{{endpoint}}` çağrılır ve {{ne gösterilir}}. {{Alan}}'a dokunduğunda {{picker/sheet}} açılır; seçim sonrası {{ne olur}}. {{Buton}}'a basıldığında {{validasyon → servis → başarı/hata akışı}}. Liste boşsa {{empty state}}, servis hatasında `MessageKey` ile {{popup/inline}} gösterilir."}}

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

> Yukarıdaki alt başlık şablonu (3.1.0 – 3.1.10) her 4.1.X için **TAM olarak** tekrarlanır — kısaltma YASAK ([B16.3]). Ortak nokta varsa "3.1.X ile aynı, fark: ..." şeklinde somut referans verilir; parametre eşleme ve resource key tabloları her işlev için yine ayrı yazılır.

---

## 4. Ortak Değişiklikler (Project-Wide)

| Konu | Dosya | Değişiklik |
|------|-------|------------|
| Resource key'ler (tr/en/ar) | `VpStringResource` ChannelID=10 (mobile-05 script) — backend endpoint output'unda döner | {{N}} yeni key |
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
| Figma ekran tasarımları | Her işlevin 3.x.0 Bağlam bölümündeki link tabloları |
| Cross-platform overview | `docs/architect/architect-index.md` |
| Backend sözleşmesi | `docs/architect/architect-backend.md` |
| Codebase keşfi cache | `docs/.architect-codebase-cache.json` |
| Test senaryoları (üretilince) | `docs/mobile-test-cases.md` |
| DB INSERT script'leri (üretilince) | `docs/mobile-implementation-script.sql` |

# {{PROJE_KODU}} {{PROJE_ADI}} — Android Teknik Analiz

> **Bu doküman `mobile-architect` agentı tarafından üretilir.** Kaynak: `docs/mobile-sdlc-analiz.md` + codebase keşfi (semantic-search) + DB (mssql).
> **Hedef Kitle:** Android developer (Google Play + Huawei AppGallery build).
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
**Hedef Android Build:** {{Min SDK / Target SDK / Kotlin sürümü / Gradle}}
**Build Varyantları:** Google (FCM) + Huawei (HMS Push Kit + Huawei Maps)

---

## 2. Etkilenen Modül / Klasör Haritası (Android Repo)

> semantic-search ile doğrulanmış mevcut paket yapısı.

| Klasör / Modül | Sorumluluk | Değişiklik Tipi |
|----------------|------------|------------------|
| `android/app/src/main/java/.../feature/{{modul}}/` | Feature module (Activity/Fragment/ViewModel) | {{Yeni / Değişen}} |
| `android/app/src/main/res/layout/` | Layout XML | {{Yeni / Değişen}} |
| `android/app/src/main/res/values/strings.xml` (+ values-en, values-ar) | Resource key değerleri | Değişen |
| `android/app/src/google/...` | Google build varyantı (FCM) | {{Yeni / Değişen}} |
| `android/app/src/huawei/...` | Huawei build varyantı (HMS) | {{Yeni / Değişen}} |
| `android/app/src/main/AndroidManifest.xml` | İzinler / deep link / activity | {{Değişen / Değişmez}} |
| `android/core/network/` | Retrofit / OkHttp client | {{Değişen}} |
| `android/core/pilot/PilotManager.kt` | (mevcut) Pilot kontrolü | Değişmez (kullanılır) |
| `android/core/logging/TrackMobileEvent.kt` | (mevcut) Event log | Değişmez (kullanılır) |

> Paket adı belirsizse `[BELIRSIZ — mevcut paket yapısı doğrulanacak]`.

---

## 3. Yapılacak İşler — İşlev Bazında

### 3.1 — 4.1.{{N}} {{İşlev Adı}}

#### 3.1.1 Mevcut Durum (Semantic-Search Bulgusu)

| Mevcut Bileşen | Konum | Not |
|----------------|-------|-----|
| {{Mevcut Activity}} | `android/app/src/main/java/.../{{Activity}}.kt` | |
| {{Mevcut Fragment}} | `android/app/src/main/java/.../{{Fragment}}.kt` | |
| {{Mevcut Layout}} | `android/app/src/main/res/layout/{{layout}}.xml` | |
| {{Mevcut Repository}} | `android/app/src/main/java/.../{{Repo}}.kt` | |

#### 3.1.2 Eklenecek / Değişecek Dosyalar

| Dosya | Tür | Değişiklik | Detay |
|-------|------|------------|-------|
| `android/.../feature/{{modul}}/{{Layout}}.xml` | Layout XML | {{Yeni / Değişen}} | UI component eklemeleri |
| `android/.../feature/{{modul}}/{{Activity}}.kt` | Activity | {{Yeni / Değişen}} | onCreate, click listener |
| `android/.../feature/{{modul}}/{{Fragment}}.kt` | Fragment | {{Yeni / Değişen}} | onViewCreated |
| `android/.../feature/{{modul}}/{{ViewModel}}.kt` | ViewModel | {{Yeni / Değişen}} | UI state + business logic |
| `android/.../feature/{{modul}}/{{Repository}}.kt` | Repository | {{Yeni / Değişen}} | API çağrısı |
| `android/.../feature/{{modul}}/model/{{Model}}.kt` | Data class | {{Yeni / Değişen}} | Request / Response DTO |
| `android/app/src/main/res/values/strings.xml` (+ -en, -ar) | Resource | Değişen | Yeni string key |
| `android/app/src/main/AndroidManifest.xml` | Manifest | {{Değişen / Değişmez}} | (varsa) izin / deep link |

#### 3.1.3 Yeni / Değişen Sınıf, Metod, View ID

```kotlin
// Activity / Fragment imzası — örnek
class CurrencyAlarmCreateFragment : Fragment() {

    private var _binding: FragmentCurrencyAlarmCreateBinding? = null
    private val binding get() = _binding!!
    private val viewModel: CurrencyAlarmCreateViewModel by viewModels()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupListeners()
        observeViewModel()
    }

    private fun setupListeners() {
        binding.{{viewId1}}.setOnClickListener { /* aksiyon */ }
    }
}
```

| Sınıf | Metod / View ID / Listener | İmza | Sorumluluk |
|-------|----------------------------|------|------------|
| {{Fragment}} | `onViewCreated(view:savedInstanceState:)` | override | Yaşam döngüsü |
| {{Fragment}} | `setupListeners()` | private | Tıklama dinleyicileri |
| {{ViewModel}} | `load{{Data}}()` | `suspend fun` | Repository çağrısı |
| {{Layout}} | `@+id/{{view1}}` | `Button` | {{Hangi aksiyon}} |
| {{Layout}} | `@+id/{{view2}}` | `TextView` | {{Hangi metin}} |

#### 3.1.4 Huawei Build Farkı

QNB mobil Huawei için ayrı build varyantı kullanır. Aşağıdaki dosyalar varyant bazlı olabilir:

| Konfigürasyon | Google | Huawei |
|---------------|--------|--------|
| Push servisi | FCM (`FirebaseMessaging`) | HMS Push Kit (`HmsMessageService`) |
| Maps SDK | Google Maps | Huawei Maps (varsa) |
| Build varyantı paketi | `android/app/src/google/.../` | `android/app/src/huawei/.../` |
| MinBuildNumber | `{{MIN_BUILD_GOOGLE}}` | `{{MIN_BUILD_HUAWEI}}` |
| MobileMenu Configuration | `AndroidMenuItem` | `HuaweiMenuItem` (varsa) |

> Bu özellikte Huawei'e özel davranış gerekli ise dosyalar ayrı listelenir. Aksi halde "Bu işlevde Google ve Huawei build aynı davranır."

#### 3.1.5 Resource Key Kullanımı (SDLC 3.4.5 ile Senkron)

> Android resource key adlandırması SDLC'deki key'lerin **snake_case karşılığı** olabilir; ancak SDLC ile birebir aynı **mantıksal key adıyla** çalışılır.

| ResourceKey (SDLC) | Android `R.string` Adı | Kullanım Yeri |
|---------------------|------------------------|----------------|
| `CurrencyAlarmCreatedToast` | `R.string.currency_alarm_created_toast` | Toast |
| `CurrencyAlarmDeleteConfirm` | `R.string.currency_alarm_delete_confirm` | AlertDialog message |

```xml
<!-- values/strings.xml -->
<string name="currency_alarm_created_toast">Alarmınızı kurduk.</string>

<!-- values-en/strings.xml -->
<string name="currency_alarm_created_toast">{{[ÇEVİRİ GEREKLİ]}}</string>

<!-- values-ar/strings.xml -->
<string name="currency_alarm_created_toast">{{[ÇEVİRİ GEREKLİ]}}</string>
```

> Yeni key'ler `mobile-05-write-implementation-scripts` ile `VpStringResource`'ta tutulur; iOS / Android / Web aynı key'i kullanır.

#### 3.1.6 Servis / Endpoint Çağrıları (mwbackend Koordinasyonu)

> Android doğrudan MCS çağırmaz. Endpoint sözleşmesi `architect-backend.md` Bölüm 3.x'te.

| Endpoint (mwbackend) | Android Repository Metodu | Request DTO | Response DTO |
|----------------------|---------------------------|-------------|---------------|
| `POST /api/{{kebab-konu}}` | `{{Repo}}.create(req)` | `{{Konu}}CreateRequest` | `{{Konu}}CreateResponse` |
| `GET /api/{{kebab-konu}}` | `{{Repo}}.list()` | — | `{{Konu}}ListResponse` |
| `PUT /api/{{kebab-konu}}/{id}` | `{{Repo}}.update(id, req)` | `{{Konu}}UpdateRequest` | `{{Konu}}UpdateResponse` |
| `DELETE /api/{{kebab-konu}}/{id}` | `{{Repo}}.delete(id)` | — | `{{Konu}}DeleteResponse` |

```kotlin
interface CurrencyAlarmApi {
    @POST("api/currency-alarms")
    suspend fun create(@Body req: CurrencyAlarmCreateRequest): Result<CurrencyAlarmCreateResponse>

    @GET("api/currency-alarms")
    suspend fun list(): Result<CurrencyAlarmListResponse>
}

class CurrencyAlarmRepository @Inject constructor(
    private val api: CurrencyAlarmApi
) {
    suspend fun create(req: CurrencyAlarmCreateRequest) = api.create(req)
}
```

#### 3.1.7 UI Komponent Yerleşimi (SDLC 4.1.X step 2 + 3'ten)

| SDLC Bulgusu | Android Karşılığı |
|--------------|-------------------|
| Yerleşim: "{{X}}'nin altında, {{Y}}'nin üstünde" | ConstraintLayout: `app:layout_constraintTop_toBottomOf="@id/{{X}}"`, `app:layout_constraintBottom_toTopOf="@id/{{Y}}"` |
| Yeni sekme | `BottomNavigationView` veya `TabLayout` + yeni `MenuItem` (Configuration JSON'da MenuType + index) |
| Picker | `BottomSheetDialogFragment` (Material) |
| Ters çevirme butonu (örnek) | `ImageButton` + click listener ile swap; `isEnabled` kontrolü |
| Bottom sheet | `BottomSheetDialogFragment` veya `BottomSheetBehavior` |

#### 3.1.8 Form Validasyon İmplementasyonu

```kotlin
data class ValidationResult(val valid: Boolean, val errorRes: Int? = null)

object CurrencyAlarmValidator {
    fun validate(req: CurrencyAlarmCreateRequest): ValidationResult {
        if (req.fromCurrency.isEmpty()) return ValidationResult(false, R.string.validation_from_required)
        if (req.fromCurrency == req.toCurrency) return ValidationResult(false, R.string.validation_same_currency)
        if (req.targetRate <= 0.0) return ValidationResult(false, R.string.validation_invalid_rate)
        return ValidationResult(true)
    }
}
```

| Alan | Validasyon Tetiği | Gösterim Tipi (Android) |
|------|-------------------|--------------------------|
| {{Alan}} | on-focus-change | `TextInputLayout.error = ...` (inline, Material) |
| Çapraz alan | submit-time | `MaterialAlertDialogBuilder` popup |

#### 3.1.9 Loglama (TrackMobileEvent / Dataroid / Adjust)

| Event | Tetiklendiği Yer | Payload Alanları |
|-------|------------------|-------------------|
| `currency_alarm_screen_view` | `onResume` | screen_name |
| `currency_alarm_created` | Repository başarılı dönüş | currency_pair, target_rate, end_date |
| `currency_alarm_delete_confirm` | "Evet" butonu | alarm_id |
| `pn_open` | Deep link intent handler | source, deep_link_path |

```kotlin
TrackMobileEvent.send("currency_alarm_created", mapOf(
    "currency_pair" to req.currencyPair,
    "target_rate" to req.targetRate
))
Adjust.trackEvent(AdjustEvent("{{ADJUST_TOKEN}}"))
Dataroid.customEvent("currency_alarm_created")
```

> Event isimleri iOS ile **birebir aynı** snake_case.

#### 3.1.10 Pilot / MinBuildNumber Kontrolü

```kotlin
if (!PilotManager.isEnabled("{{PilotKey}}")) {
    // Menü/buton gizle veya ekran kapat
    return
}

if (BuildConfig.VERSION_CODE < {{MIN_BUILD_ANDROID}}) {
    // Eski client — yeni özellik gösterilmez
    return
}
```

| Anahtar | Değer | Kaynak |
|---------|-------|--------|
| PilotKey | `{{PilotKey}}` | SDLC `[A18]` |
| MinBuildNumber Google | `{{MIN_BUILD_GOOGLE}}` | SDLC `[A18]` |
| MinBuildNumber Huawei | `{{MIN_BUILD_HUAWEI}}` | SDLC `[A18]` |
| Configuration JSON şablonu | `architect-backend.md` Bölüm 5 | — |

#### 3.1.11 Test Noktaları

- [ ] Build APK (Google + Huawei varyantı) sorunsuz
- [ ] tr / en / ar UI doğru gösteriliyor
- [ ] PilotKey kapalıyken erişim engelleniyor
- [ ] MinBuildNumber altında akış gösterilmiyor (Google + Huawei ayrı)
- [ ] Espresso senaryoları yeşil (TC-MOB-{{KONU}}-AND-*)
- [ ] TalkBack ile UI okunabilir (Engelsiz Bankacılık)
- [ ] LeakCanary memory leak uyarısı yok
- [ ] Konfigürasyon değişikliği (rotation / dark mode) sonrası state korunuyor
- [ ] Huawei HMS Push entegrasyonu (varsa) doğrulandı
- [ ] Endpoint hata senaryoları (4xx/5xx/timeout) doğru ele alınıyor

---

### 3.2 — 4.1.{{M}} {{İşlev Adı}}

> Yukarıdaki 11 alt başlık şablonu her 4.1.X için tekrarlanır.

---

## 4. Ortak Değişiklikler (Project-Wide)

| Konu | Dosya | Değişiklik |
|------|-------|------------|
| `strings.xml` (tr / en / ar) | `res/values*/strings.xml` | {{N}} yeni key |
| Retrofit interface base | `android/core/network/{{ApiBase}}.kt` | (varsa) endpoint base url / interceptor |
| Hilt module | `android/app/.../di/{{Module}}.kt` | Yeni Repository / Service binding |
| Manifest | `android/app/src/main/AndroidManifest.xml` | (varsa) deep link / izin |
| Huawei Manifest (varsa) | `android/app/src/huawei/AndroidManifest.xml` | Aynı |
| ProGuard | `android/app/proguard-rules.pro` | (varsa) yeni DTO için keep kuralı |

---

## 5. Pilot ve Versiyon Konfigürasyonu

| Konfigürasyon | Değer | Yer |
|----------------|-------|-----|
| PilotKey | `{{PilotKey}}` | `MobileMenu.Configuration` JSON (backend) |
| MinBuildNumber Google | `{{MIN_BUILD_GOOGLE}}` | aynı (`AndroidMenuItem`) |
| MinBuildNumber Huawei | `{{MIN_BUILD_HUAWEI}}` | aynı (`HuaweiMenuItem`) |
| Force Update | {{Var/Yok}} | (varsa) Play Store + AppGallery koordinasyonu |

---

## 6. Bağımlılık Sırası

| Sıra | İş | Sorumlu | Beklenen |
|------|----|---------|----------|
| 1 | mwbackend endpoint mock + sözleşme dondurma | mwbackend dev | Sprint X |
| 2 | Android Repository + DTO | Android dev | Sprint X |
| 3 | Android UI (Layout + Fragment/Activity) | Android dev | Sprint X+1 |
| 4 | Huawei build varyantı testi | Android dev | Sprint X+1 |
| 5 | mwbackend gerçek MCS entegrasyon | mwbackend dev | Sprint X+1 |
| 6 | UAT integration | Tüm taraflar | Sprint X+2 |

---

## 7. Test ve Doğrulama Notları

- Test senaryoları: `docs/mobile-test-cases.md` (mobile-03 çıktısı)
- Huawei testi için ayrı cihaz havuzu gerekir.

---

## 8. Definition of Done — Android

- [ ] Code review onayı (en az 1 Android reviewer + 1 cross-platform reviewer)
- [ ] Unit test coverage > %60 (kritik akış)
- [ ] Espresso senaryoları yeşil
- [ ] tr / en / ar resource key tamamlandı (`VpStringResource` doğrulandı)
- [ ] PilotKey doğru çalışıyor
- [ ] MinBuildNumber Google + Huawei ayrı doğrulandı
- [ ] Loglama event payload'ları (TrackMobileEvent / Dataroid / Adjust) doğru
- [ ] TalkBack okuması test edildi
- [ ] LeakCanary uyarısı yok
- [ ] Huawei varyantında HMS Push (varsa) doğrulandı
- [ ] Endpoint hata senaryoları UI'da düzgün ele alınıyor

---

## Kaynaklar

| Kaynak | Yol |
|--------|-----|
| SDLC analiz | `docs/mobile-sdlc-analiz.md` |
| Cross-platform overview | `docs/architect/architect-index.md` |
| Backend sözleşmesi | `docs/architect/architect-backend.md` |
| Codebase keşfi cache | `docs/.architect-codebase-cache.json` |
| Test senaryoları | `docs/mobile-test-cases.md` |
| DB INSERT script'leri | `docs/mobile-implementation-script.sql` |

# {{PROJE_KODU}} {{PROJE_ADI}} — mwbackend Teknik Analiz

> **Bu doküman `mobile-architect` agentı tarafından üretilir.** Kaynak: `docs/mobile-sdlc-analiz.md` + codebase keşfi (semantic-search) + DB (mssql) + MCS analizi (common-rules [C17]).
> **Hedef Kitle:** mwbackend developer (.NET / DDD).
> **Tamamlayıcı dokümanlar:** `architect-index.md` (cross-platform overview), `architect-ios.md` / `architect-android.md` (client tarafı).

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
**Hedef Framework:** .NET {{X}}, mwbackend DDD pattern
**MCS Kanal:** ChannelID = 10 (Mobile); fallback 20/30/40/50 sırasıyla denenir

---

## 2. Etkilenen Modül / Klasör Haritası (mwbackend Repo)

> semantic-search ile doğrulanmış DDD katman yerleşimi.

| Katman | Klasör | Sorumluluk | Değişiklik Tipi |
|--------|--------|------------|------------------|
| **Application — Controller** | `mwbackend/Application/{{Domain}}/Controller/` | HTTP endpoint, MediatR send | {{Yeni / Değişen}} |
| **Application — Handler** | `mwbackend/Application/{{Domain}}/Handler/` | Command / Query handler, orkestrasyon | {{Yeni / Değişen}} |
| **Application — UseCase** | `mwbackend/Application/{{Domain}}/UseCase/` | Süreç adımları, response mapping | {{Yeni / Değişen}} |
| **Application — Helper** | `mwbackend/Application/{{Domain}}/Helper/` | İş kuralı, alan dönüşümü | {{Yeni / Değişen}} |
| **Domain — Service** | `mwbackend/Domain/{{Domain}}/Service/` | MCS çağrısı (`TransactionNameConstants`) | {{Yeni / Değişen}} |
| **Common — Constant** | `mwbackend/Common/Constant/TransactionNameConstants.cs` | Yeni TransactionName eklemeleri | Değişen |
| **Common — DTO** | `mwbackend/Common/Dto/{{Domain}}/` | Request / Response model | {{Yeni / Değişen}} |
| **MCSVeribranchBI** | `MCSVeribranchBI/{{Servis}}/` | (varsa) MCS servis tanımı / mapping | {{Yeni / Değişen}} |

> Domain adı belirsizse `[BELIRSIZ — mevcut domain klasör yapısı doğrulanacak]`.

---

## 3. Yapılacak İşler — İşlev Bazında

### 3.1 — 4.1.{{N}} {{İşlev Adı}}

#### 3.1.1 Mevcut Durum (Semantic-Search Bulgusu)

| Mevcut Bileşen | Konum | Not |
|----------------|-------|-----|
| {{Mevcut Controller}} | `mwbackend/Application/{{Domain}}/Controller/{{C}}Controller.cs` | Hangi endpoint sunuyor |
| {{Mevcut Handler}} | `mwbackend/Application/{{Domain}}/Handler/{{H}}Handler.cs` | |
| {{Mevcut Service}} | `mwbackend/Domain/{{Domain}}/Service/{{S}}Service.cs` | Hangi MCS'i çağırıyor |
| {{Mevcut Transaction kullanımı}} | `TransactionNameConstants.{{TXN}}` | |

#### 3.1.2 DDD Katman Yerleşimi — Yeni / Değişen

| Katman | Repo Yolu | Yeni / Değişen | Açıklama |
|--------|-----------|------------------|----------|
| Controller | `mwbackend/Application/{{Domain}}/Controller/{{Adi}}Controller.cs` | {{Y/D}} | Endpoint: `POST /api/{{kebab}}` |
| Handler | `mwbackend/Application/{{Domain}}/Handler/{{Adi}}Handler.cs` | {{Y/D}} | MediatR `IRequestHandler<{{Adi}}Command, {{Adi}}Response>` |
| UseCase | `mwbackend/Application/{{Domain}}/UseCase/{{Adi}}UseCase.cs` | {{Y/D}} | Süreç orkestrasyon |
| Helper | `mwbackend/Application/{{Domain}}/Helper/{{Adi}}Helper.cs` | {{Y/D}} | İş kuralı + validasyon |
| Service | `mwbackend/Domain/{{Domain}}/Service/{{Adi}}Service.cs` | {{Y/D}} | MCS çağrısı |
| DTO | `mwbackend/Common/Dto/{{Domain}}/{{Adi}}Request.cs`, `{{Adi}}Response.cs` | {{Y/D}} | Request / Response model |
| TransactionNameConstants | `mwbackend/Common/Constant/TransactionNameConstants.cs` | Değişen | Yeni sabit eklenir |

#### 3.1.3 REST Endpoint Tanımı (Client Sözleşmesi)

> iOS / Android client'ların çağıracağı endpoint sözleşmesi. `architect-ios.md` ve `architect-android.md` ile **birebir** senkron olmalıdır.

| Endpoint | Method | Handler | Request | Response | Auth |
|----------|--------|---------|---------|----------|------|
| `/api/{{kebab-konu}}` | POST | `{{Adi}}Controller.Create` | `{{Adi}}CreateRequest` | `{{Adi}}CreateResponse` | Mobile Auth |
| `/api/{{kebab-konu}}` | GET | `{{Adi}}Controller.List` | (query params) | `{{Adi}}ListResponse` | Mobile Auth |
| `/api/{{kebab-konu}}/{id}` | PUT | `{{Adi}}Controller.Update` | `{{Adi}}UpdateRequest` | `{{Adi}}UpdateResponse` | Mobile Auth |
| `/api/{{kebab-konu}}/{id}` | DELETE | `{{Adi}}Controller.Delete` | — | `{{Adi}}DeleteResponse` | Mobile Auth |

```csharp
[ApiController]
[Route("api/{{kebab-konu}}")]
public class {{Adi}}Controller : ControllerBase
{
    private readonly IMediator _mediator;
    public {{Adi}}Controller(IMediator mediator) => _mediator = mediator;

    [HttpPost]
    public async Task<ActionResult<{{Adi}}CreateResponse>> Create([FromBody] {{Adi}}CreateRequest req)
        => Ok(await _mediator.Send(new {{Adi}}CreateCommand(req)));

    [HttpGet]
    public async Task<ActionResult<{{Adi}}ListResponse>> List()
        => Ok(await _mediator.Send(new {{Adi}}ListQuery()));

    [HttpDelete("{id}")]
    public async Task<ActionResult<{{Adi}}DeleteResponse>> Delete(long id)
        => Ok(await _mediator.Send(new {{Adi}}DeleteCommand(id)));
}
```

#### 3.1.4 Yeni / Değişen MCS Çağrıları ([C17] Tablo A)

> SDLC `[A17.1]` Servis Sözleşmesi Bloğu'ndan alınır; her yeni TransactionName için ayrı tablo.

| Alan | Değer |
|------|-------|
| TransactionName | `{{TXN}}` |
| ChannelID = 10 tanımlı mı | {{Evet / Hayır — fallback gerekli mi}} |
| RequestType | `VeriBranch.Common.MessageDefinitions.{{TXN}}Request` |
| ResponseType | `VeriBranch.Common.MessageDefinitions.{{TXN}}Response` |
| HostProcessCode (HPC) | `{{HPC}}` veya `[BELIRSIZ — HPC ekibi atayacak]` |
| Domain Service dosyası | `mwbackend/Domain/{{Domain}}/Service/{{S}}Service.cs` |
| Handler dosyası | `mwbackend/Application/{{Domain}}/Handler/{{H}}Handler.cs` |

#### 3.1.5 Request / Response Model Alanları ([C17] Tablo B)

| Yön | Alan Adı | Tip | Zorunlu | mwbackend Kullanım Yeri |
|------|----------|-----|---------|-------------------------|
| IN | `CustomerNo` | string | Evet | Handler — session'dan alınır |
| IN | `{{Alan2}}` | {{Tip}} | {{E/H}} | {{kullanım}} |
| OUT | `{{Alan3}}` | {{Tip}} | — | {{kullanım}} |
| OUT | `{{Alan4[]}}` | `List<{{Item}}>` | — | UseCase.Map → client DTO |

#### 3.1.6 Çağrı Zinciri ([C17] Tablo C)

```csharp
// Handler implementasyonu — pseudocode
public async Task<{{Adi}}Response> Handle({{Adi}}Command cmd, CancellationToken ct)
{
    // Adım 1 — müşteri doğrulama
    var customer = await _customerService.GetCustomerInfoAsync(
        new GetCustomerInfoRequest { CustomerNo = cmd.CustomerNo });

    // Validasyon
    if (!_helper.IsValid(cmd.Request, customer))
        throw new BusinessException("{{ValidationKey}}");

    // Adım 2 — asıl iş
    var mcsResp = await _service.Execute{{TXN}}Async(
        new {{TXN}}Request { /* alanlar */ });

    // Adım 3 — koşullu yan iş (örn. log / cache)
    if (mcsResp.HasMore) {
        var more = await _service.ExecuteAsync(/* ... */);
    }

    // Response mapping
    return _mapper.Map<{{Adi}}Response>(mcsResp);
}
```

| Sıra | TransactionName | Karar Koşulu | Etki |
|------|------------------|---------------|------|
| 1 | `GetCustomerInfo` | Her zaman | Müşteri doğrulama |
| 2 | `{{TXN}}` | Validasyon başarılı | Asıl iş |
| 3 | `{{TXN_alternative}}` | response.HasMore = true | Sayfalama / yan iş |

#### 3.1.7 Domain Service (MCS Çağrı) Pattern

```csharp
public interface I{{Adi}}Service
{
    Task<{{Adi}}McsResponse> Execute{{Adi}}Async({{Adi}}McsRequest request);
}

public class {{Adi}}Service : I{{Adi}}Service
{
    private readonly IMcsClient _mcsClient;

    public {{Adi}}Service(IMcsClient mcsClient) => _mcsClient = mcsClient;

    public async Task<{{Adi}}McsResponse> Execute{{Adi}}Async({{Adi}}McsRequest request)
    {
        return await _mcsClient.ExecuteAsync<{{Adi}}McsRequest, {{Adi}}McsResponse>(
            TransactionNameConstants.{{TXN}}, request);
    }
}
```

#### 3.1.8 Validasyon / İş Kuralı (Helper)

> SDLC `[A16]` Form Validasyon Tablosu + `[A13.2]` hata senaryolarından türetilir.

```csharp
public class {{Adi}}Helper
{
    public bool IsValid({{Adi}}Request req, CustomerInfo customer)
    {
        if (string.IsNullOrEmpty(req.{{Alan}})) return false;
        if (req.{{Alan1}} == req.{{Alan2}}) return false;          // çapraz alan
        if (req.{{TargetValue}} <= 0) return false;
        if (customer.AlarmCount >= MAX_ALARM_LIMIT) return false;  // [A13.3] sınır
        return true;
    }
}
```

| Kural | Hata Anahtarı (ResourceKey) | ActionType ([DB2]) |
|-------|------------------------------|----------------------|
| Aynı döviz seçilemez | `CurrencyAlarmSameCurrencyError` | 1 — popup + akış kes |
| Maks alarm aşıldı | `CurrencyAlarmMaxLimitError` | 1 — popup |
| Hedef kur sıfırdan büyük | `CurrencyAlarmInvalidRateError` | 1 — popup |

#### 3.1.9 MobileMenu / MobileMenuMapping / VpStringResource Değişiklikleri

> Detaylı INSERT script'leri `mobile-05-write-implementation-scripts` agentı tarafından üretilir. Bu bölüm özet.

| Tablo | Değişiklik | ChannelID |
|-------|------------|-----------|
| `MobileMenu` | Yeni MenuID `{{ID}}` — `Title: {{KEY}}`, `TransactionName: {{TXN}}`, `MenuType: -`, Configuration JSON eklendi | 10 |
| `MobileMenuMapping` | (varsa) Pano/NBT/3D Touch/Spotlight kayıt | 10 |
| `VpStringResource` | {{N}} yeni resource key × 3 dil | 10 |
| `VpTransaction` + `VpTransactionConfig` + `VpTransactionAttributes` | {{N}} yeni MCS tanımı | 10 |

**MobileMenu Configuration JSON şablonu:**

```json
{
  "PilotKey": "{{PilotKey}}",
  "ReversePilot": false,
  "IosMenuItem": {
    "ClassName": "ios/Modules/{{Modul}}/{{Class}}",
    "MinBuildNumber": "{{MIN_BUILD_IOS}}",
    "DeepLinkPath": "{{kebab-konu}}"
  },
  "AndroidMenuItem": {
    "ClassName": "{{paket}}.{{Activity}}",
    "MinBuildNumber": "{{MIN_BUILD_GOOGLE}}",
    "DeepLinkPath": "{{kebab-konu}}"
  },
  "HuaweiMenuItem": {
    "ClassName": "{{paket}}.Huawei{{Activity}}",
    "MinBuildNumber": "{{MIN_BUILD_HUAWEI}}"
  }
}
```

#### 3.1.10 Loglama (mwbackend)

| Log Tipi | Yöntem | Tablo | Alan |
|----------|---------|-------|------|
| Request/response otomatik | `[LoggableMethod]` attribute | `VpDefaultLog` | LoggingVerbosity=1111 |
| Hata | `_logger.LogError(ex, ...)` | `VpExceptionLog` | Exception detayı |
| İşlem geçmişi | Framework otomatik | `VpMobileContactHistory` | Maks 8 EDW Extra Field |
| SAS log (varsa) | SAS framework çağrısı | (SAS sistemi) | İş kuralı bazlı |

**EDW Extra Field önerisi (max 8):**

| # | Alan | Açıklama |
|---|------|----------|
| 1 | {{Alan1}} | {{açıklama}} |
| 2 | {{Alan2}} | {{açıklama}} |
| ... | ... | ... |

#### 3.1.11 Test Noktaları

- [ ] Unit test coverage > %80 (UseCase, Handler, Helper, Service)
- [ ] xUnit / NUnit testler yeşil
- [ ] Integration test (gerçek MCS — UAT)
- [ ] Postman / Swagger ile endpoint manual doğrulandı
- [ ] TransactionNameConstants sabit eklendi
- [ ] VpTransaction + Config + Attributes INSERT script (mobile-05) çalıştı
- [ ] VpDefaultLog'da request/response payload doğru gözüküyor
- [ ] Eski request/response sözleşmesi bozulmadı (backward compat — eski client'lar)
- [ ] BusinessException + ResourceKey eşlemeleri client'ta doğru popup gösteriyor

---

### 3.2 — 4.1.{{M}} {{İşlev Adı}}

> Yukarıdaki 11 alt başlık şablonu her 4.1.X için tekrarlanır.

---

## 4. Ortak Değişiklikler (Project-Wide)

| Konu | Dosya | Değişiklik |
|------|-------|------------|
| TransactionNameConstants | `mwbackend/Common/Constant/TransactionNameConstants.cs` | {{N}} yeni sabit |
| DI Container | `mwbackend/{{StartupModule}}.cs` | Yeni Service/Repository binding |
| Exception sözlüğü | `mwbackend/Common/Exception/BusinessExceptionKeys.cs` | Yeni hata anahtarları |
| API versioning | `mwbackend/.../api-versioning.json` | (varsa) yeni endpoint versiyonu |

---

## 5. Pilot ve Versiyon Konfigürasyonu (MobileMenu)

| Parametre | Değer | Yer |
|-----------|-------|-----|
| PilotKey | `{{PilotKey}}` | `MobileMenu.Configuration.PilotKey` |
| ReversePilot | `false` | `MobileMenu.Configuration.ReversePilot` |
| MinBuildNumber iOS | `{{MIN_BUILD_IOS}}` | `MobileMenu.Configuration.IosMenuItem.MinBuildNumber` |
| MinBuildNumber Android | `{{MIN_BUILD_GOOGLE}}` | `MobileMenu.Configuration.AndroidMenuItem.MinBuildNumber` |
| MinBuildNumber Huawei | `{{MIN_BUILD_HUAWEI}}` | `MobileMenu.Configuration.HuaweiMenuItem.MinBuildNumber` |
| Deep link path | `{{kebab-konu}}` | aynı |

---

## 6. Bağımlılık Sırası

| Sıra | İş | Sorumlu | Beklenen |
|------|----|---------|----------|
| 1 | TransactionNameConstants + DTO sabit + endpoint sözleşmesi | mwbackend dev | Sprint X (gün 1-2) |
| 2 | Domain Service iskelet + mock response (client unblock) | mwbackend dev | Sprint X (gün 3) |
| 3 | UseCase + Handler + Helper iş kuralı | mwbackend dev | Sprint X (gün 4-7) |
| 4 | MCS gerçek entegrasyon (VpTransaction config) | mwbackend dev + DBA | Sprint X+1 |
| 5 | Unit + integration test | mwbackend dev | Sprint X+1 |
| 6 | UAT entegrasyon + client'larla test | Tüm taraflar | Sprint X+2 |

---

## 7. Definition of Done — mwbackend

- [ ] Code review onayı (en az 2 reviewer)
- [ ] Unit test coverage > %80
- [ ] xUnit / NUnit testler yeşil
- [ ] Integration test UAT'da başarılı
- [ ] TransactionNameConstants güncellendi
- [ ] VpTransaction + Config + Attributes script çalıştırıldı (mobile-05 çıktısı)
- [ ] MobileMenu + MobileMenuMapping kayıtları eklendi
- [ ] VpStringResource 3 dil tamamlandı
- [ ] VpDefaultLog'da request/response payload doğru
- [ ] Eski client backward compatibility doğrulandı
- [ ] BusinessException + ResourceKey eşlemeleri test edildi
- [ ] Swagger dokümanı güncel
- [ ] Postman koleksiyonu paylaşıldı
- [ ] BDDK / KVKK / Pentest kontrolleri tamamlandı
- [ ] Performance test (latency, throughput) regresyon yok

---

## Kaynaklar

| Kaynak | Yol |
|--------|-----|
| SDLC analiz | `docs/mobile-sdlc-analiz.md` |
| Cross-platform overview | `docs/architect/architect-index.md` |
| iOS analizi | `docs/architect/architect-ios.md` |
| Android analizi | `docs/architect/architect-android.md` |
| MCS analiz yöntemi | common-rules [C17] (modül 10) |
| DB tablo şemaları | `_common-rules/15-db-reference.md` |
| Codebase keşfi cache | `docs/.architect-codebase-cache.json` |
| DB INSERT script'leri (üretilince) | `docs/mobile-implementation-script.sql` |
| Test senaryoları (üretilince) | `docs/mobile-test-cases.md` |

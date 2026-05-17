# Mobile Etki Analizi — {{PROJE_ADI}}

**Proje:** {{PROJE_KODU}} — {{PROJE_ADI}}
**Versiyon:** {{VERSIYON}}
**Tarih:** {{TARIH}}
**Hazırlayan:** {{HAZIRLAYAN}}
**Kanal:** Mobil (ChannelID = 10)

> Girdiler: `docs/mobile-analiz.md` (mobile-02), `docs/mobile-as-is-analiz.md` (mobile-01).
> Bu doküman QNB standart "Etki Analizi" şablonunun mobil odaklı daraltılmış halidir. Core Finans, Kartlı Ödeme Sistemleri ve WEB & PORTAL kategorileri "Mobil kanalda etkisiz — kapsam dışı" notu ile geçilmiştir.

---

## Etki Durumu (Tek Seçim Zorunlu)

| Seçim | İşaret |
|-------|---------|
| Etki analizi yapılmıştır. Aşağıdaki maddelerden herhangi birine etkisi yoktur. | [ ] |
| Etki analizi yapılmıştır. Aşağıdaki maddelerden herhangi birine etkisi vardır. | [ ] |

> Etki varsa en az 1 madde "Evet" işaretlenir.

---

## İçindekiler

1. Genel
2. Kanallar (Mobil Odaklı)
3. Güvenlik
4. EDW (Veri Ambarı)
5. Test (Mobil)
6. Kapsam Dışı Kategoriler
7. Açık Sorular
8. Metodoloji ve Kaynaklar

---

## 1. Genel

| Gereksinim Tipi | Gereksinim ve Etki Analizi | Evet | Açıklama | Kaynak |
|------------------|------------------------------|--------|------------|---------|
| Arşivleme | Tutulan verinin arşivlenmesine yönelik ihtiyaç var mı? | [ ] | {{ACK}} | {{REF}} |
| Dijital Onay | Dijital Onay yapılabilecek adımlar bulunuyor mu? | [ ] | {{ACK}} | {{REF}} |
| Engelsiz Bankacılık | Erişilebilirlik geliştirme ihtiyacı? | [ ] | {{ACK}} | {{REF}} |
| Eğitim ve Duyuru | Kullanıcılara eğitim ihtiyacı? | [ ] | {{ACK}} | — |
| Eğitim ve Duyuru | THM / IT Op eğitimi? | [ ] | {{ACK}} | — |
| Eğitim ve Duyuru | Kullanıcı Bilgilendirme Dokümanı? | [ ] | {{ACK}} | — |
| Eğitim ve Duyuru | E-Learning eğitim dökümanı? | [ ] | {{ACK}} | — |
| Eğitim ve Duyuru | Duyuru yapılacak mı? | [ ] | {{ACK}} | — |
| Geri Dönüş Planı | Geri dönüş (rollback) planı gerekli mi? | [ ] | {{ACK}} | {{REF}} |
| Gizlilik | KVKK kapsamı / aydınlatma metni? | [ ] | {{ACK}} | {{REF}} |
| Gizlilik | Müşteri sırrı veri paylaşımı? | [ ] | {{ACK}} | {{REF}} |
| Loglama | Ürün İşlem Log'a ekleme / değişiklik? | [ ] | {{ACK}} | VpDefaultLog şeması |
| Loglama | ADK Log değişikliği? | [ ] | {{ACK}} | — |
| Loglama | Corefinans callservicelog ekleme? | [ ] | {{ACK}} | — |
| Loglama | Masraf komisyon loglama? | [ ] | {{ACK}} | — |
| Loglama | POT ön loglaması (BDDK)? | [ ] | {{ACK}} | — |
| Monitoring | İzleme / alert ekleme (BSM, HP OpenView, FINATM vb.)? | [ ] | {{ACK}} | {{REF}} |
| Müşteri Bilgilendirme — SMS / Email / PN | Yeni / değişen Form Code? Mevcut bilgilendirme etkisi? | [ ] | {{ACK}} | NOTIFICATION_*_TEMPLATE refresh |
| HASO | HASO bildirimlerine etki? | [ ] | {{ACK}} | — |
| Fraud | Arcsight fraud loglama? | [ ] | {{ACK}} | — |
| Kullanıcı Yönetimi | Kullanıcı ve Yetki Yönetimi? | [ ] | {{ACK}} | — |
| Kurum Entegrasyonu | Yeni web servis / API kurum entegrasyonu? | [ ] | {{ACK}} | — |
| Kurum Mutabakatı | Yeni kurum entegrasyonu mutabakat kontrolü? | [ ] | {{ACK}} | — |
| Login | FUAD / Login / AD entegrasyonu? | [ ] | {{ACK}} | — |
| MASAK | Yeni hesap hareketi MASAK'a bildirilecek mi? | [ ] | {{ACK}} | — |
| KKB / Memzuç / GİB / MASAK | Rapor etkisi? | [ ] | {{ACK}} | — |
| İş Sürekliliği ve DRC | DRC yedekleme etkisi? | [ ] | {{ACK}} | — |
| İç Sistemler Görüş | Teftiş / Yasal Uyum / Risk görüş? | [ ] | {{ACK}} | — |
| Kanuni Takip / YTS | YTS etkisi? | [ ] | {{ACK}} | — |
| Conversion | Veri yapısı dönüşümü? | [ ] | {{ACK}} | — |
| Collection | Collection etkisi? | [ ] | {{ACK}} | — |
| Eğitim Ortamı | Edu ortam güncel tutma? | [ ] | {{ACK}} | — |

---

## 2. Kanallar (Mobil Odaklı)

| Gereksinim Tipi | Gereksinim ve Etki Analizi | Evet | Açıklama | Kaynak |
|------------------|------------------------------|--------|------------|---------|
| **Mobil** | QNB Bireysel / Tüzel / Kart İşlemleri Mobil Şubesinde geliştirme/değişiklik/test ihtiyacı? | [X] | {{ACK}} | mobile-02 4.1.Y |
| Internet Şube | Mobilden bağımsız etki var mı? | [ ] | Genelde yok; sadece backend/MCS değişikliği IB'i de etkiliyorsa "Evet" | — |
| CMS | İçerik / drop-down ekleme/değişiklik? | [ ] | {{ACK}} | VpStringResource (ChannelID=10) |
| CORE | Mobil → Core modül etkisi? (Collection / CRM / Deposits / CashMgmt / Treasury / RetailLoans / CorpLoans / Accounting / DYS) | [ ] | {{ACK}} | MCS mapping |
| ATM | Mobil → ATM etkisi? | [ ] | Genelde yok | — |
| Call Center (CC) | Mobil → CC etkisi? | [ ] | Genelde yok | — |
| Enpara | Enpara kullanıcısı / ürünü etkilenecek mi? | [ ] | {{ACK}} | — |

---

## 3. Güvenlik

| Gereksinim Tipi | Gereksinim ve Etki Analizi | Evet | Açıklama | Kaynak |
|------------------|------------------------------|--------|------------|---------|
| Güvenlik | Kritik bilgi (CVV2 / PIN / Şifre / AKS) işlemi? | [ ] | {{ACK}} | — |
| Güvenlik | Müşteri / finansal bilgi içeren yeni DB / uygulama? | [ ] | {{ACK}} | — |
| Güvenlik | Kimlik doğrulama / şifre / OTP değişikliği? | [ ] | {{ACK}} | — |
| Güvenlik | Hizmet alımı (donanım ve lisans hariç)? | [ ] | {{ACK}} | — |
| Güvenlik | Personel / 3. parti banka dışından erişim? | [ ] | {{ACK}} | — |
| Güvenlik | Müşteri kullanımına yeni interaktif uygulama? | [ ] | {{ACK}} | — |
| Güvenlik | Banka dışı veri paylaşımı / entegrasyon (webservice / email / ftp)? | [ ] | {{ACK}} | — |
| Güvenlik | SAR ekiplerinden katılım gerektiren konu? | [ ] | {{ACK}} | — |
| Güvenlik | Müşteri Veri Paylaşım İzni? | [ ] | {{ACK}} | — |
| Güvenlik Testi | Güvenlik testleri (Pentest dahil)? | [ ] | {{ACK}} | — |
| Güvenlik | Seala etkisi? | [ ] | {{ACK}} | — |
| Güvenlik | Encryption / kart maskeleme? | [ ] | {{ACK}} | — |
| Güvenlik | BDDK güvenlik tebliği entegrasyonu? | [ ] | {{ACK}} | — |

---

## 4. EDW (Veri Ambarı)

| Gereksinim Tipi | Gereksinim ve Etki Analizi | Evet | Açıklama | Kaynak |
|------------------|------------------------------|--------|------------|---------|
| ADK Raporlama | Enpara / YNI / YNCC loglarına değişiklik? | [ ] | {{ACK}} | — |
| Aktiflik Sahiplik | Tanım eklemesi / değişiklik? | [ ] | {{ACK}} | — |
| Basel | Tanım eklemesi / değişiklik? | [ ] | {{ACK}} | — |
| HPS | Hedef Performans Sistemi etkisi? | [ ] | {{ACK}} | — |
| Karlılık Yapısı | Yeni ürün / işlem kodu / komisyon / GL? | [ ] | {{ACK}} | — |
| Microstrategy | Raporlama ihtiyacı? | [ ] | {{ACK}} | — |
| Prim Sistemi | Ürün işlem log değişikliği? | [ ] | {{ACK}} | — |
| Prim Sistemi | Yeni kanal / başvuru kanalı? | [ ] | {{ACK}} | — |
| Veri Ambarı | Operasyonel veri değişimi → EDW yansıması? | [ ] | {{ACK}} | — |
| Veri Yapısı | Müşteri / segmentasyon veri yapısı? | [ ] | {{ACK}} | — |
| Yasal Raporlama | LGR şemasına etki? | [ ] | {{ACK}} | — |
| Yasal Raporlama | Yasal raporlama ihtiyacı? | [ ] | {{ACK}} | — |
| Ürün Ağacı | Corefinans / EDW / DW ürün ağacında değişiklik? | [ ] | {{ACK}} | — |

---

## 5. Test (Mobil)

| Gereksinim Tipi | Gereksinim ve Etki Analizi | Evet | Açıklama | Kaynak |
|------------------|------------------------------|--------|------------|---------|
| Mobil Otomasyon | Test otomasyon caseleri (KIF / Espresso / Appium)? | [ ] | {{ACK}} | docs/mobile-test-cases.md |
| Mobile Browser | Mobil browser testi? (Web içinde mobil) | [ ] | Genelde mobil app için N/A | — |
| Erişilebilirlik | Erişilebilirlik testi? | [ ] | {{ACK}} | — |
| Browser | Belirlenen browser dışında istenen browser? | [ ] | Mobil app için N/A | — |
| Usability | Kullanılabilirlik testleri (user test)? | [ ] | {{ACK}} | — |

---

## 6. Kapsam Dışı Kategoriler

Aşağıdaki kategoriler bu mobil etki analizi kapsamında **detaylı işlenmemiştir** çünkü mobil ürünle doğrudan ilişkili değildir. Kullanıcı ek bir mobil → core / kartlı ödeme etkisi belirttiğinde ilgili satır "Evet" işaretlenip Kanallar veya Genel altında açıklanmıştır.

| Kategori | Durum | Not |
|----------|--------|-----|
| Core Finans (Chordiant, CRM, Doküman Basımı, Gişe Oturumu, Gün/Ay/Dönem/Yıl Sonu, Kıyı Bankacılığı, MDYS, Muhasebe, RTO, Saklama Bankası, Scanner, Sistem Mizan, Ürün Devri) | Etkisiz | Mobil tarafta batch / kasa / muhasebe akışı tetiklenmiyor |
| Kartlı Ödeme Sistemleri (Anında Kart, BDS, BKM, Debit, DSMB, Ekstre, KOS Fraud, Kampanya, Kart Basım, Kurye, Limit, Maker/Checker, POS, UBDS, ÇDA, Ödeme Planı, Üye İşyeri) | Etkisiz | Mobil yalnızca client; kart basım / kampanya / ekstre core sorumluluğunda |
| WEB ve PORTAL (PORTAL, WEB Siteleri, SEO, Sosyal Medya, W3C, Web sitesi etkileşim — QNB.com.tr, Enpara.com vb.) | Etkisiz | Mobil app dışı kanal |

> İstisna: Kullanıcı mobil özelliğinin core / kartlı ödeme tarafına etki ettiğini söylerse (örn. yeni MCS başvuru servisi → BDS), o satır Kanallar veya Genel'de "Evet" işaretlenir ve açıklanır.

---

## 7. Açık Sorular

| # | Soru | questions.md Kategorisi | Cevap | Durum |
|---|------|--------------------------|---------|--------|
| 1 | {{SORU_1}} | {{KAT}} | {{CEVAP}} | [DOGRULANDI] / [BELIRSIZ] |

---

## 8. Metodoloji ve Kaynaklar

1. **Girdiler:** `docs/mobile-analiz.md` (mobile-02 çıktısı), `docs/mobile-as-is-analiz.md` (mobile-01 çıktısı)
2. **Semantic Search (scopeProject = mobilebanking):**
   - Generic component etki taraması: `query: "{ComponentAdi} usage Activity ViewController"`, `[".swift", ".kt", ".java"]`
   - MCS / handler etki taraması: `query: "{TransactionName} handler usage"`, `[".cs"]`
3. **mcp-mssql-db-operations (ChannelID = 10):**
   - VpVeriBranchHostCallMappingView — MCS mapping etki yüzeyi
   - MobileMenu + MobileMenuMapping — menü/pano/3D Touch/Spotlight değişiklikleri
   - VpStringResource — 3 dil resource key etki listesi
   - VpDefaultLog / VpExceptionLog şeması — log alanı eklenme ihtiyacı
4. **mcp-figma:** {{LINK_VEYA_YOK}}
5. **questions.md Kategorileri:** TÜM bölümler tarandı; eksik cevaplar AskQuestion ile alındı.
6. **Daraltılmış Kapsam Onayı:** Etki Analizi Kapsam Onay adımında kullanıcı daraltılmış kapsamı kabul etti.

---

## Değişiklik Geçmişi

| Tarih | Versiyon | Değişiklik |
|-------|----------|------------|
| {{TARIH}} | {{VERSIYON}} | İlk versiyon |

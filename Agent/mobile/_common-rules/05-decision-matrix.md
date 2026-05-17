# Common-Rules — 05: Karar Matrisi (11 Alt Başlık) ve Parça Stratejisi

> İçerik [C5] (11 alt başlık + MenuType) + [C9] (çoklu işlev parça stratejisi).

## [C5] Ortak Karar Matrisi (11 Alt Başlık — Mobil)

mobile-01 (AS-IS), mobile-02 (Analiz), mobile-03 (Test) **aynı 11 alt başlığı** kullanır:

| # | Alt Başlık | Index | Mobil Notu |
|---|-------------|-------|--------------|
| 1 | Ekran Tasarımı | 4.1.Y.1 | Figma + iOS Storyboard/VC + Android Activity/Class |
| 2 | Batchler | 4.1.Y.2 | **"Mobil kapsamda batch tanımı bulunmamaktadır"** (default — başlık silinmez) |
| 3 | Çıktı ve Raporlar | 4.1.Y.3 | Mobil PDF / dekont — yoksa standart cümle |
| 4 | Menü Tanımları | 4.1.Y.4 | MobileMenu / MobileMenuMapping (modül 03 ChannelID) |
| 5 | Erişim Noktaları | 4.1.Y.5 | Ana Menü, Pano, NBT, 3D Touch, Spotlight, Deep Link |
| 6 | SMS / PN Bilgilendirmeleri | 4.1.Y.6 | Form Code + ResourceKey + Tetiklenme |
| 7 | E-Mail Bilgilendirmeleri | 4.1.Y.7 | NOTIFICATION_EMAIL_TEMPLATE (yoksa standart cümle) |
| 8 | Memo / Ekstre Mesajları | 4.1.Y.8 | Mobil ekstre / işlem memo (yoksa standart cümle) |
| 9 | Uyarı / Hata Mesajları | 4.1.Y.9 | Validation Rule + ActionType (0/1/2) + ResourceKey |
| 10 | Servisler | 4.1.Y.10 | MCS TransactionName + mwbackend handler (modül 10 [C17]) |
| 11 | Etki Analizi (işlev özelinde) | 4.1.Y.11 | 3.4 etki kontrol listesinden bu işlevde tetiklenenler |

> AS-IS dokümanında 4.1.Y.11 "mevcut etki noktaları" — yeni etki değil, bugünkü durumun analizi.

## MenuType Listesi (1-15) ve Boşluklar

| Tip | Açıklama |
|-----|----------|
| 1 | Board |
| 2 | Mandatory |
| 3 | Default Analytics |
| 4 | Analytic Suggestion |
| 5 | Pega Suggestion |
| 6 | Default Pega |
| 7 | Tüm İşlemler Butonu |
| 8 | Tüm İşlemler Sheet |
| 9 | Kısayollar (3D Touch) |
| 10 | Spotlight Search (iOS Only) |
| 11 | **Rezerve / kullanım dışı** |
| 12 | NBT Sık Kullanılanlar |
| 13 | Pega Sık Kullanılanlar |
| 14 | Hızlı Erişim Panosu |
| 15 | Başvuru Merkezi |

> MenuType 11 yer tutucudur; dokümanlarda 11 için kayıt yazılmaz. Tablolarda 11 satırı geçtiğinde "(rezerve)" notuyla işaretlenir.

## [C9] Çoklu İşlev Parça Stratejisi

mobile-02'de birden fazla yazılım işlevi (4.1.1, 4.1.2, ...) olabilir.

| İşlev Sayısı | Strateji |
|----------------|----------|
| 1-2 işlev | Her işlev için ayrı parça (1 işlev = 11 alt başlık tek mesaj) |
| 3-5 işlev | Her işlev için tek parça, 11 alt başlık 2 mesaja bölünebilir (1-6 ilk, 7-11 ikinci) |
| **6+ işlev** | AskUserQuestion ile "tek dosya / işlev başına ayrı dosya" sor. Önerilen: işlev başına ayrı dosya (`docs/mobile-analiz/4.1.X-{slug}.md` + `index.md` master). |

**Tek parça içinde "Hayır" başlıklar standart cümleyle ardışık geçilir** — her birine ayrı mesaj harcanmaz.

## Çıktı Boyutu Üst Sınırı

Tek bir doküman dosyası **2500 satırı geçmemeli**. Geçecekse otomatik olarak işlev başına alt dosyaya bölünür ve index.md ile yönetilir.

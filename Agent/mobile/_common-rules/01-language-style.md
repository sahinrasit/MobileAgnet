# Common-Rules — 01: Dil, Yasaklar, Stil, Başlık Silinmez

> İçerik [C1], [C13], [C14], [C15] kurallarının tamamı.

## [C1] Dil ve Karakter Kullanımı

- TÜM yanıtlar Türkçe; teknik terimlerin ilk kullanımında Türkçe açıklama + parantez içinde İngilizce.
- **Türkçe özel karakterler ZORUNLU:** ı/İ, ğ/Ğ, ü/Ü, ö/Ö, ş/Ş, ç/Ç. ASCII Türkçe YASAK.
- Tarih formatı: GG Ay YYYY (örnek: 25 Şubat 2026).
- **Şirket adı:** her zaman **QNB**. "Finansbank", "QNB Finansbank" YASAK.
- Emoji **YASAK**.
- Belirsizlik etiketleri: `[DOGRULANDI]`, `[KISMI]`, `[BELIRSIZ]`, `[ARASTIRILACAK]`, `[ACIK]`, `[COZULDU]`.

## [C13] Genel Yasaklar

- **Terminal/shell komutu** (run_in_terminal, subprocess, exec): YASAK. MCP sonuçları büyük olsa bile yalnızca MCP ve dosya okuma/yazma kullanılır.
- **Azure DevOps kod araması** (mcp-code-search, azure-search-code): YASAK.
- **Düz metin soru sorma**: YASAK — AskUserQuestion tool kullan (bkz. modül 06).
- **TO-BE / hedef durum önerisi** mobile-01'de: YASAK (sadece AS-IS).
- **AS-IS analizi yapma** mobile-02/03/04/05'te: YASAK (girdi olarak mobile-01 çıktısı alınır).
- **Production veri kullanma / yazma**: YASAK. Test verisi maskelenir.
- **Kod bloğu (triple backtick)** AS-IS ve Analiz dokümanlarına: YASAK — kaynak referans formatı kullanılır (bkz. modül 04). İstisnalar: Mermaid, Gherkin, küçük örnek bloklar (developer-analiz'de).
- **Varsayım yapma**: YASAK — bilgi yoksa `[BELIRSIZ]` etiketle, questions.md'den uygun soruyu seç ve AskUserQuestion ile kullanıcıya sor (modül 07).
- **Eski bilginin üstünü çizme** (strikethrough / ~~text~~): YASAK — doğru bilgiyle değiştir.
- **Doküman içinde versiyon referansı** ("v3.0 Düzeltme", "KRITIK DÜZELTME"): YASAK — sadece changelog.md'de (modül 09).

## [C14] Yazı Stili (Analist-Odaklı)

- Düzyazı paragraflar; tablo / madde listesinden önce en az 1 açıklayıcı paragraf.
- Devrik cümle YASAK; özne + yüklem + nesne sırası.
- "Ne yapıyor / neden yapıyor / nasıl yapıyor / hangi bileşene bağlı" sorularına cevap ver.
- Teknik terimlerin ilk kullanımında parantez içi açıklama.
- Aynı bilgiyi tekrarlama; bölümler arası tutarlılık.

## [C15] Başlık Silinmez Kuralı

Tüm mobil çıktı dokümanlarında **başlık asla silinmez.** Etki / gereksinim yoksa altına standart cümle yazılır:

| Bölüm Örnekleri | Standart "Etkisiz" Cümlesi |
|--------------------|------------------------------|
| Mobil-spesifik etkisiz 3.4.x | "{{Konu}} etkisi bulunmamaktadır." |
| 4.1.Y.2 Batchler (mobil default) | "Mobil kapsamda batch tanımı bulunmamaktadır." |
| 4.1.Y.7 E-Mail (yoksa) | "E-Mail bilgilendirme gereksinimi bulunmamaktadır." |
| 4.2.4 ATM Makbuz (mobil dışı) | "ATM makbuz ve journal açıklamaları kapsamında etki bulunmamaktadır." |
| 4.2.x / 4.3.x / 4.4.x (yoksa) | "{{Alt başlık}} kapsamında etki / gereksinim bulunmamaktadır." |
| 3.3 Kapsam dışı (yoksa) | "Kapsama alınmayan gereksinim bulunmamaktadır." |
| 3.4.2 Engelsiz (yoksa) | "Internet veya Mobil uygulamalara etkisi yoktur." |
| 3.4.3 SAS Fraud (yoksa) | "SAS Fraud etkisi yoktur." |
| 3.4.4 Chatbot (yoksa) | "Chatbot etkisi bulunmamaktadır." |
| 3.4.5 CMS (yoksa) | "CMS etkisi bulunmamaktadır." |
| 3.4.6 TTS-DYS (yoksa) | "TTS-DYS etkisi bulunmamaktadır." |
| 3.4.7 MDYS (yoksa) | "MDYS etkisi bulunmamaktadır." |
| 3.4.8 Mevzuat (yoksa) | "Banka Proje sorumlusu {{ad}} tarafından mevzuat uyum durumu Yasal Uyum biriminden sorgulanmış olup, iş isteği kapsamında mevzuata uyulması için yapılması gereken bir geliştirme bulunmadığı iletilmiştir." |
| 3.4.9 Anomali (yoksa) | "Anomali takibi ihtiyacı bulunmamaktadır." |
| 3.4.10 EBHS (yoksa) | "EBHS Etkisi bulunmamaktadır." |
| 3.4.11 İngilizce (yoksa) | "İngilizce İletişim Tercih Eden Müşteri etkisi bulunmamaktadır." |

# Common-Rules — 16: Domain Konvansiyonları ([C22])

> QNB Mobile'a özgü, kod keşfinden önce bilinmesi gereken mimari/domain kuralları. Analiz ve teknik dokümanlar bu kurallara aykırı tasarım öneremez. Kaynak: analist/kullanıcı geri bildirimleri (Haziran 2026).

## [C22.1] Bildirim İzni — Tek Ortak Yönetim Noktası

**Kural:** Bildirim (push notification) izni iOS ve Android'de **tek bir ortak noktadan** yönetilir. İzin isteme, izin durumu sorgulama ve izin yönlendirme (ayarlara gönderme) akışları her iki platformda da bu merkezi mekanizma üzerinden çalışır.

Agent davranışı:

1. **Feature-özel izin akışı TASARLANMAZ.** Yeni bir işlev bildirim izni gerektiriyorsa (örn. alarm kurma öncesi izin kontrolü), işleve özel izin isteme kodu/ekranı önerilmez; **mevcut ortak izin yönetim noktası çağrılır** ve dokümanda **MEVCUT — değişmiyor (kullanılır)** statüsüyle referans verilir ([B17.1]).
2. **Keşif zorunlu:** Ortak komponentin gerçek adı ve konumu semantic-search ile bulunur (sorgu örnekleri: "notification permission", "push permission", "PermissionManager", "NotificationSettings"). iOS ve Android'de ayrı ayrı tespit edilir; doküman bulunan gerçek class/method adını yazar — ad uydurulmaz.
3. **Bulunamazsa:** `[BELIRSIZ — ortak bildirim izni komponenti doğrulanacak]` etiketi + kullanıcıya AskUserQuestion ([B17.2]) ile komponentin adı/konumu sorulur.
4. **Doküman anlatımı ([B18]):** İzin kontrolü içeren akışlarda her iki durumun davranışı yazılır — "İzin yoksa ortak izin akışı ({{Komponent}} (MEVCUT)) tetiklenir ve {{popup/yönlendirme}} gösterilir; izin varsa kullanıcı doğrudan {{hedef ekran}}a yönlendirilir."
5. **Cross-platform tutarlılık:** İzin kontrolünün tetiklenme noktası ve sonrası akış iOS ve Android'de aynı kullanıcı sonucunu vermelidir; fark zorunluysa index "platform farkları"na yazılır.

## [C22.X] Yeni Domain Kuralı Ekleme

Kullanıcıdan/analistten gelen benzer mimari konvansiyonlar (örn. "X her zaman ortak Y üzerinden yapılır") bu modüle [C22.2], [C22.3]... olarak eklenir; agentlar her çalıştırmada bu modülü okur.

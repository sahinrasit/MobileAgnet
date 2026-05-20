8503 Kanallardan Kullanılan Taksitli Kredilere Masrafların Eklenmesi Mobil
İŞ ANALİZİ DOKÜMANI (ÜRÜN DOKÜMANTASYONU)
 
      
DEĞİŞİKLİK TARİHÇESİ
Tarih	Sürüm	
Değişikliği Yapan

Değişiklik

29.09.2025

v1	
Esin Yunus Bahçivanlar

Doküman oluşturuldu.













1. Proje Genel Tanımı ve Amacı 4

2. Terimler ve Kısaltmalar 4

3. Müşteri Gereksinimleri 4

3.1 Gereksinimler 4

3.2 Genel Süreç Akışı 4

3.3 Kapsama Alınmayan Müşteri Gereksinimleri 4

3.4 Etki ve Risk Analizi 4

3.4.1 Kanal (ADK) Etkisi 4

3.4.2 Engelsiz Bankacılık Etkisi 4

3.4.3 SAS Fraud Etkisi 5

3.4.4 Chatbot Etkisi 5

3.4.5 CMS (Content Management System) Etkisi 5

3.4.6 TTS (OSDEM - SDY ) ve DYS (FOMER ) Etkisi 5

3.4.7 MDYS (Müşteri Doküman Yönetim Sistemi)Tanımları 5

3.4.8 Mevzuata Uyum 5

3.4.9 Anomali takibi 5

3.4.10 Projenin Sungur Projesine Etkisi 6

4. Yazılımın Fonksiyonel Gereksinimleri 6

4.1 Yazılım İşlevleri 6

4.1.1  Fiyatlama Ekranı Yazılım İşlevi

4.1.2 Onay Ekranı Yazılım İşlevi

4.1.3 Kullandırım Ekranı Yazılım İşlevi

4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan. 7

4.3 Log ve EDW Rapor gereksinimleri 7

4.3.1 Ürün İşlem log, Müşteri log, ADK log, Kullanıcı log, Arcsight ve Teftiş log gereksinimleri 7

4.3.2 EDW raporları 7

4.4 Ürün  ve  Ürün İşlem Tanım  Gereksinimleri 7

5. Yazılımın Fonksiyonel Olmayan Gereksinimleri 7

5.1 Performans, Kapasite ve Erişilebilirlik. 7

5.2 Güvenlik ve Veri Gizliliği 7

5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları) 7

5.4 Erişim ve Kimlik Yönetimi 7

5.5 İç Sistemler (Teftiş Kurulu, Hukuk, Yasal Uyum ve İç Kontrol, Risk Yönetimi, IBT PQRM)  Görüşü 8


 
1. Proje Genel Tanımı ve Amacı
Bu proje bireysel mobil smart kredi başvuru ekranlarına masrafların eklenmesini kapsamaktadır. Kredi başvuru akışına yapılan entegrasyon aşağıda detaylandırılmıştır.

2. Terimler ve Kısaltmalar
Kısaltma bulunmamaktadır.

3. Müşteri Gereksinimleri
3.1 Gereksinimler
Müşteri Gereksinimi

İlişkili Yazılım Gereksinimi

Smart fiyatlama ekranına masraflar dahil edilmesi için switch eklenmeli ve ekranda bilgilendirme yapılmalıdır.

4.1.1

Masraflar dahil ilerlendiğinde onay ekranında belirtilmelidir.

4.1.2

Limitsiz kullandırımın ilk ekranında masraflar dahil başvuru yapıldığına dair bilgilendirme yapılmalıdır.

4.1.3



3.2 Genel Süreç Akışı
İhtiyaç kredisi başvurusu ekranına eklenen bir özellik olduğu için genel başvuru sürecine bir etkisi bulunmamaktadır.



**as-is workflow. mevcut ekrana bi düzenleme ise.   yeni bir özellik ise kapsamdan workflow.

3.3 Kapsama Alınmayan Müşteri Gereksinimleri
Mikro kredi kapsam dışı bırakılmıştır. (soru sorulacak know how req). dökümanda varsa bunu al. yine de sorsun

3.4 Etki ve Risk Analizi
Etki analizi 303350-3 Impact Analysis sayfasında bulunmaktadır.

3.4.1 Kanal (ADK) Etkisi
QNB Bireysel mobil bankacılık etkisi bulunmaktadır. (sadece tüzel sorulacak)

3.4.2 Engelsiz Bankacılık Etkisi
Internet veya Mobil uygulamalara etkisi yoktur. Engelsiz bankacılık etkisi bulunmamaktadır. (var / yok)

3.4.3 SAS Fraud Etkisi
SAS Fraud etkisi yoktur. (var / yok -  varsa mapping eklenicek Esin Yunus Bahcivanlar (Ibtech-Mobile Banking-3 Ba) )

Esin: En son etkisi vardır deyip developer dokümanında detay olsun dedik. 8277 - 7. SAS Akışı

3.4.4 Chatbot Etkisi
Chatbot etkisi bulunmamaktadır. (var / yok )

3.4.5 CMS (Content Management System) Etkisi
CMS etkisi bulunmaktadır. Metinler CMS üzerinden gösterilmektedir. (figma ve kapsam)



Key	Değer
LoanUsageDetailsIncludeExpensesLoanAmount	 Masraflar Dahil Kredi Tutarı
LoanExpensesExpensesPopupTitle	Kredi masrafları nelerdir?
LoanExpensesExpensesPopupDescription	Kredi masrafları, kredi tahsis ücreti ve varsa sigorta prim tutarının toplamıdır.
LoanExpensesDescription	Talep ettiğiniz tutar hesabınıza kesintiye uğramadan yatar, kredi masrafları bu tutarın üzerine eklenir. 
3.4.6 TTS (OSDEM - SDY ) ve DYS (FOMER ) Etkisi
TTS-DYS etkisi bulunmamaktadır.   default

3.4.7 MDYS (Müşteri Doküman Yönetim Sistemi)Tanımları
MDYS etkisi bulunmamaktadır. default

3.4.8 Mevzuata Uyum
Banka Proje sorumlusu tarafından  mevzuat uyum durumu Yasal Uyum biriminden sorgulanmış olup, iş isteği kapsamında mezuata uyulması için yapılması gereken bir geliştirme bulunmadığı iletilmiştir. default

3.4.9 Anomali takibi
Anomali takibi ihtiyacı bulunmamaktadır. default

3.4.10  Projenin Sungur Projesine Etkisi
 Sungur programına etkisi bulunmamaktadır. default

4. Yazılımın Fonksiyonel Gereksinimleri
4.1 Yazılım İşlevleri
4.1.1 Fiyatlama Ekranı Yazılım İşlevi
(ekstra sorualr sorulamalı validasyonlar- başka bir şey vs.)





Masraf projesi müşterinin talep ettiği tutarın direkt hesabına geçebilmesi için kredi tahsis ücreti ve sigorta prim tutarı ile birlikte kredi kullanılmasıını amaçlamaktadır. Örneğin müşteri 40.000 TL kredi tutarı talep ettiği bir durumda masrafların 1.000 TL tuttuğunu varsayalım. Masraflar dahil kredi kullanımında müşteri 41.000 TL tutarında kredi kullanır ve hesabına 40.000 TL geçer.
Smart kredi başvuru akışında mikro kredi limiti kapsama dahil değildir. İlk kredi, limitli ve limitsiz akışlar kapsama dahildir.
Kredi tutar componentinde "Kredi Tutarı" olarak yazan metnin "Talep Edilen Tutar" olarak değiştirilmesi gerekmektedir.

Soldaki ekran görüntüsündeki gibi fiyatlama ekranı açılırken masraf switchinin gösterimi kontrol edilecektir.
Eğer masraf switchi uygun değilse ekranda masraf ile ilgili bir alan gösterilmeyecektir.
Eğer masraf switchi uygunsa taksit sayısı componentinin altına 'Tutar Hesabıma Net Geçsin' başlığı ile switch eklenir.
Ekran açılışında masraf switchi switch açık getirilmelidir.
Switchin altında 'Talep ettiğiniz tutar hesabınıza kesintiye uğramadan yatar, kredi masrafları bu tutarın üzerine eklenir.' metni bulunur.  Metin içerisinde bulunan 'kredi masrafları' yazısı ruby olup link button olmalı, tıklandığında action sheet açılmalıdır.
Action sheet detayları aşağıdaki gibidir:
Başlık: Kredi Masrafları Nelerdir?

Alt Metin: Kredi masrafları Kredi Tahsis Ücreti ve varsa Sigorta Primi tutarıdır.

Button: Tamam

Masraflar switchinde değişiklik yapıldığı durumlardaki ekran yapısının kuralları:

1-Müşteriye switch gösterilebilir mi kontrolü yapılmalıdır. Eğer kontrollere takılmıyorsa ve ekran ilk kez açılıyorsa veya switch açıkken ekranda bir değişiklik yapıldıysa masraf switchi ekranda açık şekilde gösterilecektir, gösterim kurallarına takıldığı durumda switch ekranda gösterilmeyecektir.  Bu kontroller core servisinden dönen responsea bakılarak yapılacaktır.

2-Müşteri switchi kapattıktan sonra ekranda yapacağı bir değişiklikle ekran baştan çizildiğinde switch kapalı olarak kalacaktır. (Switch gösterilebildiği durumlarda geçerlidir.)

3-Müşteri switch açıkken ekranda yapacağı değişiklik sonrası ekran baştan çizildiğinde switch açık olarak gelmeye devam edecektir. (Switch gösterilebildiği durumlarda geçerlidir.)

***Core'dan switch gelmediği her durumda sessiondaki switch durumu sıfırlanmalıdır.

4-Masraflar switchinde değişiklik yapıldığında (kapatıp-açıldığı durumlarda) Ödeme Planı Tercihi, İlk Taksit Tarihi, Sigorta Seçimi, tercihlerinin korunması gerekmektedir.



Yasal vade uyarı kontrolleri:

Müşteri masraf switchini değiştirdiğinde ekrandaki yeni değerlerin gösterilmesi için önerilen vadelerin tekrar sorgulanması gerekmektedir. Bu durumda müşterinin ekranda seçmiş olduğu ilk taksit tarihi ve ödeme planı tercihini koruyarak önerilen vadeler sorgulanmalıdır. Masraf switchi değişikliği öncesi ekrandaki seçimli olan vade yeni öneriler arasında varsa ilgili vade seçimli getirilmelidir, seçimli vade yeni öneriler arasında yoksa yine en düşük faizli vadeyi seçimli gelir. Masraf switchi açılıdğında eğer seçimli vade öneriler arasında yoksa ve seçimli vade değişirse vadenin değiştiğine dair uyarı gösterilmelidir. Örnekler için aşağıdaki tabloyu paylaşıyorum.
Bu kontrol sadece masraf switchi açıldığında yapılacaktır. Talep edilen kredi tutarına masraflar dahil edildiği zaman müşterinin vade sayısında değişiklik olmadığı durumlarda uyarı verilmeyecektir.

Ekrandaki Seçim

Ekran Değişikliği Sonrası Yeni Önerilen Vadeler

Uyarı Verme Durumu

18-24-36*

12-18-24

36 yeni öneriler arasında olmadığından uyarı verilir, yeni önerilen vadelerde en düşük faizli seçimli gösterilir.

18*-24-36

12-18*-24

18 yeni öneriler arasında olduğundan uyarı verilmez. Değişiklik sonrası 18 seçimli gösterilir.

18*-24-36-5

12-18*-24

18 yeni öneriler arasında olduğundan uyarı verilmez. Değişiklik sonrası 18 seçimli gösterilir.

18-24-36-5*

12-18-24

5 yeni öneriler arasında olmadığından uyarı verilir, yeni önerilen vadelerde en düşük faizli seçimli gösterilir.

 * Ekrandaki seçimli vadeyi ifade etmektedir.

 Uyarı verildiğinde ekranda gösterilecek action sheet bilgileri aşağıdaki gibidir:

Başlık: Taksit Sayısı Değişti!

Metin: “Tutar Hesabıma Net Geçsin” tercihinde bulunduğunuz için Kredi Tahsis Ücreti ve varsa Sigorta Primi kredinize eklenmiştir. Yasal vade sınırlarından dolayı kredinizin taksit sayısı değişmiştir.

Button: Tamam

Fiyatlama Ekranındaki Kredi Bilgileri Alan Değişiklikleri:

Masraflar dahil olduğu durumlarda gri alanda en üstte 'Masraflar Dahil Kredi Tutarı' gösterilmelidir. Masraf switchi olmadığında veya kapalı olduğu durumda bu alan gösterilmeyecektir.
Masraflar dahil kredi tutarı alanı ön başvuru ve info servisindeki KREDITUTARI alanından beslenecektir. Ekranın en üstünde bulunan talep edilen tutar componentindeki değer ise ön başvuru ve info servislerindeki MAINLOANAMOUNT alanından alınacaktır.
'Masraflar Dahil Kredi Tutarı' alanının yanına info butonu eklenmelidir. Info butonuna tıklandığında pop up ile aşağıdaki bilgiler gösterilmelidir.
Başlık: Masraflar Dahil Kredi Tutarı Nedir?

Metin: Talep ettiğiniz tutarın üzerine Kredi Tahsis Ücreti ve varsa Sigorta Primi eklendikten sonra kullanacağınız toplam kredi tutarıdır.

Button: Tamam

Geri Ödeme Tutarı'nın altında , Sigorta Prim Tutarı'nın üstünde 'Kredi Tahsis Ücreti' eklenecektir.  Masrafın dahil olmasından bağımsız olarak  "0" olmadığı her durumda bu alanda gösterilecektir. "0" ise gösterilmeyecektir.
4.1.1 Ekran Tasarımı

image-2025-5-11_23-6-22.png



Analiz edilecek başlıklar

Evet/ Hayır 

İndex kodu 

Başlık adı

Yeni ekran tasarımı  veya mevcut ekranda değişiklik var mı?

Evet	
4.11

4.1.1 Fiyatlama Ekranı Yazılım İşlevi
Yeni batch veya mevcut batchlerde değişiklik var mı?

Hayır	



Yeni bir çıktı/rapor veya mevcut çıktı /raporlarda değişiklik var mı

Hayır	



Yeni menü tanımlanacak mı? 

Hayır	



Yeni bir servis tanımı olacak mı?

Hayır	



Erişim noktaları analiz edilecek mi?

Hayır	



SMS/PN Bilgilendirme tanımı olacak mı?

Hayır	



E-mail bilgilendirme tanımı olacak mı? 

Hayır	



Memo ve ekstre tanımı olacak mı?

Hayır	



Uyarı ve hata mesajı tanımı olacak mı?

Evet	
4.11

4.1.1 Fiyatlama Ekranı Yazılım İşlevi
Yapılacak değişikliğin Etki analizi var mı? (POTA Etki analizi/3.4 Etki ve Risk analizi başlıkları dikkate alınır)

Evet

4.11

4.1.1 Fiyatlama Ekranı Yazılım İşlevi


4.1.2 Onay Ekranı Yazılım İşlevi
Limitli akış asıl başvuru & kullandırım, limitsiz akış asıl başvuru ve limitsiz akış kullandırım onay ekranlarında masraf switchi dahilse 'Masraflar Dahil Kredi Tutarı'  onay ekranın en üst alanında gösterilecek, 'Hesabıma Aktarılacak Tutar' Kredi tahsis ücretinin altında Aktarılacak hesabın üstünde gösterilecektir. 
Masraf switchi dahil değilse as-is devam edecek ek bilgi gösterilmeyecektir.
Masraflar dahil sigortalı başvuru yapılmış bir kredide onay ekranına geçerken sigorta doküman hatası alınırsa, onay ekranındaki hesaba aktarılacak tutar önbaşvuru veya info servisindeki CREDITAMOUNTACCOUNT alanından beslenecektir.
4.1.2 Ekran Tasarımı

image-2025-5-11_23-26-59.png



Analiz edilecek başlıklar

Evet/ Hayır 

İndex kodu 

Başlık adı

Yeni ekran tasarımı  veya mevcut ekranda değişiklik var mı?

Evet	
4.1.2

4.1.2 Onay Ekranı Yazılım İşlevi
Yeni batch veya mevcut batchlerde değişiklik var mı?

Hayır	



Yeni bir çıktı/rapor veya mevcut çıktı /raporlarda değişiklik var mı

Hayır	



Yeni menü tanımlanacak mı? 

Hayır	



Yeni bir servis tanımı olacak mı?

Hayır	



Erişim noktaları analiz edilecek mi?

Hayır	



SMS/PN Bilgilendirme tanımı olacak mı?

Hayır	



E-mail bilgilendirme tanımı olacak mı? 

Hayır	



Memo ve ekstre tanımı olacak mı?

Hayır	



Uyarı ve hata mesajı tanımı olacak mı?

Hayır	



Yapılacak değişikliğin Etki analizi var mı? (POTA Etki analizi/3.4 Etki ve Risk analizi başlıkları dikkate alınır)

Hayır




4.1.3 Kullandırım Ekranı Yazılım İşlevi
Eğer asıl başvuru masraflar switchi dahil yapıldıysa kullandırım ilk ekranda Masraflar Dahil Kredi Tutarı  ve Hesabıma Aktarılacak Tutar Gösterilecektir.

*Masraflar dahil kredi tutarı en üst alanda verilecektir. Hesabıma aktarılacak tutar en altta verilecektir.

Hesaba aktarılacak tutar ServiceBankingPrepareForIssuance servisindeki CREDITAMOUNTACCOUNT alanından beslenecektir. Masraflar dahil kredi tutarı alanı mevcutta kredi tutarının gösterildiği KREDITUTARI alanından gösterilmeye devam edecektir.

*Masraflar dahil değilse eğer AS-IS devam edecektir.

«Kredi Tahsis Ücreti» masraftan bağımsız olarak "0" olmadığı her durumda bu alanda gösterilecektir. ("0" ise gösterilmeyecektir.)

Başvuru aşamasında sigortalı ve masraf switchi açık bir başvuru yapıldığında kullandırım ekranında ilk taksit tarihi değiştirilir ve müşteriye yeni ilk taksit tarihinde sigorta verilebiliyorsa component altında mavi ile 'Kredinizin ilk taksit tarihini değiştirdiğiniz için sigorta priminiz ve hesabınıza aktarılacak tutar değişti.' mesajı gösterilmelidir.

Başvuru aşamasında sigortalı ve masraf switchi açık bir başvuru yapıldığında kullandırım ekranında müşteriye sigorta verilemiyorsa ekranın altında gri bilgilendirme alanı çıkmalı ve  'Sigorta poliçenizi düzenleyemediğimiz için krediniz hayat sigortası olmadan düzenlenecek. Faiz oranınız değişmeyecek ancak hesabınıza aktarılacak tutar artacaktır.' metni gösterilmelidir.

Masraflar dahil sigortalı başvuru yapılmış bir kredide kullandırım ekranından onay ekranına geçerken sigorta doküman hatası alınırsa, onay ekranındaki hesaba aktarılacak tutar ServiceBankingPrepareForIssuance servisindeki LOANAMOUNTWITHINSURANCE alanından beslenecektir.



4.1.3 Ekran Tasarımı

image-2025-9-25_15-29-31.png



Analiz edilecek başlıklar

Evet/ Hayır 

İndex kodu 

Başlık adı

Yeni ekran tasarımı  veya mevcut ekranda değişiklik var mı?

Evet	
4.1.3

4.1.3 Kullandırım Ekranı Yazılım İşlevi
Yeni batch veya mevcut batchlerde değişiklik var mı?

Hayır	



Yeni bir çıktı/rapor veya mevcut çıktı /raporlarda değişiklik var mı

Hayır	



Yeni menü tanımlanacak mı? 

Hayır	



Yeni bir servis tanımı olacak mı?

Hayır	



Erişim noktaları analiz edilecek mi?

Hayır	



SMS/PN Bilgilendirme tanımı olacak mı?

Hayır	



E-mail bilgilendirme tanımı olacak mı? 

Hayır	



Memo ve ekstre tanımı olacak mı?

Hayır	



Uyarı ve hata mesajı tanımı olacak mı?

Hayır	



Yapılacak değişikliğin Etki analizi var mı? (POTA Etki analizi/3.4 Etki ve Risk analizi başlıkları dikkate alınır)

Hayır




4.2 Muhasebe, Dekont, Alındılar ve Sistem Mizan


Etkisi yoktur.

4.3 Log ve EDW Rapor gereksinimleri
4.3.1 Ürün İşlem log, Müşteri log, ADK log, Kullanıcı log, Arcsight ve Teftiş log gereksinimleri
Mobil loglama ihtiyacı yoktur. Esin Yunus Bahcivanlar (Ibtech-Mobile Banking-3 Ba) 

Esin: 

EDW Extra Field Loglamaları: 8277 - 8. EDW Extra Field Loglamaları

Contact History Loglamaları: 8668 - Mobil Loglama 

Contact history loglamaları aşağıdaki gibi excelle iletiliyor. Sheet 1de formatı var. Maks 8 alan eklenebiliyor. EDW bu alanlara bakıp rapor oluşturuyor.



4.3.2 EDW raporları
EDW raporlama ihtiyacı yoktur. Esin Yunus Bahcivanlar (Ibtech-Mobile Banking-3 Ba) 

Esin:

Yapılan loglamalarla EDW ekibi rapor oluşturabiliyor. O durumda EDW raporlama ihtiyacı bulunmaktadır. denilebilir. Analiste sorulmalı.

4.4 Ürün  ve  Ürün İşlem Tanım  Gereksinimleri
Ürün ve ürün işlem etkisi bulunmamaktadır. (default)



5. Yazılımın Fonksiyonel Olmayan Gereksinimleri
5.1 Performans, Kapasite ve Erişilebilirlik
Performans, kapasite ve erişilebilirlik etkisi bulunmamaktadır. (default)

5.2 Güvenlik ve Veri Gizliliği
Güvenlik ihtiyacı Ibtech-Information Security Management Ekibi tarafından yazılım projeleri için Jira, altyapı projeleri için KYS'de kayıt altına alınır. (default)

5.3 Güvenilirlik ve Yedeklilik (Kötü Durum Senaryoları)
Güvenilirlik ve yedeklilik etkisi bulunmamaktadır. (default)

5.4 Erişim ve Kimlik Yönetimi
Erişim ve kimlik yönetimi için mevcut kurallar geçerli olacaktır. (default)

5.5 İç Sistemler (Teftiş Kurulu, Hukuk, Yasal Uyum ve İç Kontrol, Risk Yönetimi, IBT PQRM)  Görüşü
İç sistem görüşü aşağıda paylaşılmıştır.. (default)



Görüş Alınan Tarih

Görüş Alınan Kişi

Görüş Detayı

08.04.2025

Ilgın Oder Sel
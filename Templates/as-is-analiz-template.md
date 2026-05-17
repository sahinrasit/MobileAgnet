# AS-IS Analiz Dokümanı -- {{PROJE_ADI}}



## Doküman Bilgileri



**Kapsam:** {{KAPSAM_TANIMI}}

**Versiyon:** {{VERSIYON}}

**Tarih:** {{TARIH}}

**Proje:** {{PROJE_KODU}} -- {{PROJE_ADI}}

**Hazırlayan:** {{HAZIRLAYAN}}

**Amaç:** {{ANALIZ_AMACI}}



>
**Önceki Versiyon:** {{ONCEKI_VERSIYON_YOLU}} (varsa)



---



## İçindekiler



[Metodoloji ve Araştırma Kaynakları](#metodoloji-ve-araştırma-kaynakları)



[1. Proje Genel Tanımı ve Amacı](#1-proje-genel-tanımı-ve-amacı)



[2. Terimler ve Kısaltmalar](#2-terimler-ve-kısaltmalar)



[3. Mevcut Süreç Analizi](#3-mevcut-süreç-analizi)



[4. Mevcut Yazılım İşlevlerinin Analizi](#4-mevcut-yazılım-işlevlerinin-analizi)



[5. Kısıtlamalar ve Belirsizlikler](#5-kısıtlamalar-ve-belirsizlikler)



---



## 1. Proje Genel Tanımı ve Amacı



### 1.1. Projenin Mevcut Durumu



{{MEVCUT_DURUM_TANIMI}}



### 1.2. Analiz Kapsamı



{{ANALIZ_KAPSAMI}}



---



## 2. Terimler ve Kısaltmalar



### 2.1. Teknik Terimler Sözlüğü



| Terim | Açıklama |

|-------|----------|

| {{TERIM_1}} | {{ACIKLAMA_1}} |

| {{TERIM_2}} | {{ACIKLAMA_2}} |



---



## 3. Mevcut Süreç Analizi



### 3.1. Genel Süreç Akışı



**Mevcut Süreç Özeti:**



{{SUREC_OZETI}}



**Süreç Adımları Özet Tablosu:**



| Adım | İşlem | Araçlar/Servisler | Sonuç |

|------|-------|-------------------|-------|

| 1 | {{ISLEM_1}} | {{ARAC_1}} | {{SONUC_1}} |

| 2 | {{ISLEM_2}} | {{ARAC_2}} | {{SONUC_2}} |



**Akış Diyagramı:**



```mermaid

flowchart
TB

{{DIYAGRAM_ICERIGI}}

```



### 3.2. Kapsama Alınmayan Konular



Bu dokümanda aşağıdaki konular 
**bilinçli olarak kapsam dışı** bırakılmıştır:



| Konu | Gerekçe |

|------|---------|

| {{KONU_1}} | {{GEREKCE_1}} |

| {{KONU_2}} | {{GEREKCE_2}} |



---



## 4. Mevcut Yazılım İşlevlerinin Analizi



### 4.1. Yazılım İşlev Detayları



#### 4.1.Y {{ISLEV_BASLIGI}} -- Mevcut Durum



**Karar Matrisi (Mevcut Durumda Hangi Başlıklar Aktif):**



| Analiz Edilecek Başlıklar | Evet / Hayır | Index | Başlık |

|---------------------------|--------------|-------|--------|

| Ekran tasarımı | {{EVET_HAYIR}} | 4.1.Y.1 | Ekran Tasarımı |

| Batch | {{EVET_HAYIR}} | 4.1.Y.2 | Batchler |

| Çıktı ve Raporlar | {{EVET_HAYIR}} | 4.1.Y.3 | Çıktı ve Raporlar |

| Menü Tanımları | {{EVET_HAYIR}} | 4.1.Y.4 | Menü Tanımları |

| Servisler | {{EVET_HAYIR}} | 4.1.Y.5 | Servisler |

| Erişim Noktaları | {{EVET_HAYIR}} | 4.1.Y.6 | Erişim Noktaları |

| SMS / PN Bilgilendirmeleri | {{EVET_HAYIR}} | 4.1.Y.7 | SMS/PN Bilgilendirmeleri |

| E-Mail Bilgilendirmeleri | {{EVET_HAYIR}} | 4.1.Y.8 | E-Mail Bilgilendirmeleri |

| Memo / Ekstre Tanımları | {{EVET_HAYIR}} | 4.1.Y.9 | Memo/Ekstre Tanımları |

| Uyarı / Hata Mesajları | {{EVET_HAYIR}} | 4.1.Y.10 | Uyarı/Hata Mesajları |



>
**Not:** Sadece "Evet" işaretlenen başlıklar aşağıda detaylandırılacaktır.



---



##### 4.1.Y.1. Ekran Tasarımı



**Mevcut Ekranlar:**



| Ekran Kodu | Ekran Adı | Repository | Dosya Yolu |

|------------|-----------|------------|------------|

| {{EKRAN_KODU_1}} | {{EKRAN_ADI_1}} | {{REPO_1}} | {{YOLU_1}} |



**Ekran İşlevselliği:**



{{EKRAN_ISLEVSELLIK_ACIKLAMASI}}



**Kod Referansı:**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}



---



##### 4.1.Y.2. Batchler



**Mevcut Batch İşlemleri:**



| Batch Adı | Ana Class | Strateji | Amaç |

|-----------|-----------|----------|------|

| {{BATCH_ADI_1}} | {{CLASS_1}} | {{STRATEJI_1}} | {{AMAC_1}} |



**Batch İşleyiş Akışı:**



{{BATCH_AKIS_ACIKLAMASI}}



**Kod Referansı:**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}



---



##### 4.1.Y.3. Servisler



**Mevcut Servisler:**



| Servis Adı | Tip | Repository | Amaç |

|------------|-----|------------|------|

| {{SERVIS_ADI_1}} | {{TIP_1}} | {{REPO_1}} | {{AMAC_1}} |



**Servis İş Mantığı:**



{{SERVIS_IS_MANTIGI}}



**Kod Referansı:**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}



---



##### 4.1.Y.4. SMS/PN Bilgilendirmeleri



>
**Müşteri Bilgilendirme Sistemi:** SMG Wiki (Confluence pageId: 8815310)



**Mevcut Bildirimler:**



| Form Code | Tip | Tetiklenme Koşulu | Mesaj İçeriği |

|-----------|-----|-------------------|---------------|

| {{FORM_CODE}} | SMS / PN | {{KOSUL}} | {{MESAJ}} |



**Bildirim İşleyişi:**



{{BILDIRIM_IS_MANTIGI}}



**Kod Referansı:**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}



---



##### 4.1.Y.5. Uyarı/Hata Mesajları



**Mevcut Hata Yönetimi:**



| Hata Kodu | Tip | Mesaj | Yönetim Mekanizması |

|-----------|-----|-------|---------------------|

| {{HATA_KODU_1}} | {{TIP_1}} | {{MESAJ_1}} | {{MEKANIZMA_1}} |



**Hata Yönetim İş Mantığı:**



{{HATA_YONETIM_MANTIGI}}



**Kod Referansı:**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}



---



### 4.2. Loglama ve Raporlama (Mevcut Durum)



>
**MADDE 13 Referansı:** BDDK Tebliği (Confluence pageId: 52235469)



**Mevcut Log Yapısı:**



| Log Tablosu | Amaç | Saklama Süresi |

|-------------|------|----------------|

| {{LOG_TABLO_1}} | {{AMAC_1}} | 5 yıl |



**Loglama İş Mantığı:**



{{LOGLAMA_MANTIGI}}



---



### 4.3. Ürün ve İşlem Tanımları (Mevcut Durum)



**POT/TOT Sorguları:**



| POT Adı | İşlem Adı | Kriterler | Dönen Değerler |

|---------|-----------|-----------|----------------|

| {{POT_ADI_1}} | {{ISLEM_1}} | {{KRITERLER_1}} | {{DEGERLER_1}} |



**POT Sorgu İş Mantığı:**



{{POT_MANTIGI}}



**Kod Referansı:**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_CLASS_ADI}}



---



## 5. Kısıtlamalar ve Belirsizlikler



### 5.1. Belirsizlik Seviyesi Göstergeleri



Dokümanda kullanılan işaretler:



- 
**[DOGRULANDI]:** Kod tabanından doğrudan alınmış ve onaylanmış bilgiler

- 
**[KISMI]:** Kodda kısmen görülen veya Confluence'ten alınmış ancak tam olarak doğrulanamayan bilgiler

- 
**[BELIRSIZ]:** Kod tabanında bulunamayan, varsayıma dayalı veya daha fazla araştırma gerektiren bilgiler



### 5.2. Kısıtlamalar ve Bilinmeyen Alanlar



1. 
**[BELIRSIZ]** {{KISITLAMA_1}}

2. 
**[KISMI]** {{KISITLAMA_2}}

3. 
**[BELIRSIZ]** {{KISITLAMA_3}}



---



## Metodoloji ve Araştırma Kaynakları



### Araştırma Kaynakları



Bu AS-IS analiz dokümanı aşağıdaki kaynaklardan derlenerek oluşturulmuştur:



1. 
**Kod Tabanı Analizi:**

- {{REPO_ADI_1}} projesi semantic search sonuçları

- {{REPO_ADI_2}} projesi semantic search sonuçları

- {{ANALIZ_EDILEN_DOSYALAR}}



2. 
**Confluence Dokümantasyonu:**

- İlgili Confluence sayfaları (sayfa ID'lerle referans gösterilmiştir)

- {{CONFLUENCE_SAYFA_REFERANSLARI}}



3. 
**MCP Code Search (Azure DevOps):**

- Collection: {{COLLECTION}}, Project: {{PROJECT}}, Branch: {{BRANCH}}

- {{BULUNAN_DOSYALAR}}



### Kod Referans Formati



AS-IS dokümanlarına kod bloğu (triple backtick) 
**EKLENMEZ**. Bunun yerine aşağıdaki referans formatı kullanılır:



**Tekil Referans (metin içinde):**



> {{IS_MANTIGI_OZETI}}

>

>
**Kaynak:**
`{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_VEYA_SORGU_ADI}}



**Çoklu Referans (birden fazla dosya ilgiliyse):**



| # | Dosya | Metod/Sorgu | Açıklama |

|---|-------|-------------|----------|

| 1 | `{{REPO_ADI}}/{{DOSYA_YOLU}}` | {{METOD_ADI}} | {{KISA_ACIKLAMA}} |

| 2 | `{{REPO_ADI}}/{{DOSYA_YOLU_2}}` | {{METOD_ADI_2}} | {{KISA_ACIKLAMA_2}} |



**Kurallar:**



- Kod bloğu (triple backtick ile sarılı kod) YASAKTIR

- Kısa sabitler ve enum değerleri backtick ile satır içinde yazılabilir (örn:
`CHANNELCODE = "148"`)

- Mermaid diyagramları bu kurala dahil DEĞİLDİR, akış diyagramları olarak kullanılabilir

- Her referansta repository adı ve dosya yolu ZORUNLUDUR

- Metod veya sorgu adı ZORUNLUDUR



---



## Değişiklik Geçmişi



| Tarih | Versiyon | Değişiklik |

|-------|----------|------------|

| {{TARIH}} | {{VERSIYON}} | {{DEGISIKLIK}} | 
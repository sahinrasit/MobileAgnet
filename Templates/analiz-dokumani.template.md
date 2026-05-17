# Proje Analiz Dokümanı -- {{PROJE_ADI}}



**Doküman Kodu:** BT_REQM00004

**Proje:** {{PROJE_KODU}} -- {{PROJE_ADI}}

**Versiyon:** {{VERSIYON}}

**Tarih:** {{TARIH}}

**Hazırlayan:** {{HAZIRLAYAN}}

**Durum:** Taslak / İncelemede / Onaylandı



> Bu doküman, QNB standart "Proje Analizi Dokümanı Şablonu" formatına (BT_REQM00004) uygun olarak hazırlanmıştır.

> AS-IS Referans:
`docs/as-is-analiz.md` (Versiyon: {{AS_IS_VERSIYON}})



---



## Değişiklik Tarihçesi



| Versiyon | Tarih | Değişiklik | Hazırlayan |

|----------|-------|------------|------------|

| {{VERSIYON}} | {{TARIH}} | {{DEGISIKLIK}} | {{HAZIRLAYAN}} |



---



## İçindekiler



[1. Proje Genel Tanımı ve Amacı](#1-proje-genel-tanımı-ve-amacı)



[2. Terimler ve Kısaltmalar](#2-terimler-ve-kısaltmalar)



[3. Müşteri Gereksinimleri](#3-müşteri-gereksinimleri)



[4. Yazılımın Fonksiyonel Gereksinimleri](#4-yazılımın-fonksiyonel-gereksinimleri)



---



## 1. Proje Genel Tanımı ve Amacı



### 1.1. Proje Tanımı



{{PROJE_TANIMI}}



### 1.2. Proje Amacı



{{PROJE_AMACI}}



### 1.3. Proje Kapsamı



{{PROJE_KAPSAMI}}



---



## 2. Terimler ve Kısaltmalar



### 2.1. Teknik Terimler



| Terim | Açıklama |

|-------|----------|

| {{TERIM_1}} | {{ACIKLAMA_1}} |

| {{TERIM_2}} | {{ACIKLAMA_2}} |

| {{TERIM_N}} | {{ACIKLAMA_N}} |



### 2.2. Kısaltmalar



| Kısaltma | Açıklama |

|----------|----------|

| {{KISALTMA_1}} | {{ACIKLAMA_1}} |

| {{KISALTMA_2}} | {{ACIKLAMA_2}} |

| {{KISALTMA_N}} | {{ACIKLAMA_N}} |



---



## 3. Müşteri Gereksinimleri



### 3.1. Gereksinimler



**Müşteri Gereksinimi (MG) - Yazılım Gereksinimi (YG) Eşleştirme Tablosu:**



| MG No | Müşteri Gereksinimi | YG No | Yazılım Gereksinimi | Durum |

|-------|---------------------|-------|---------------------|-------|

| MG1 | {{MUSTERI_GEREKSINIMI_1}} | 4.1.1 | {{YAZILIM_GEREKSINIMI_1}} | Aktif |

| MG2 | {{MUSTERI_GEREKSINIMI_2}} | 4.1.2 | {{YAZILIM_GEREKSINIMI_2}} | Aktif |

| MG3 | {{MUSTERI_GEREKSINIMI_3}} | 4.2.1 | {{YAZILIM_GEREKSINIMI_3}} | Aktif |



### 3.2. Genel Süreç Akışı



**Süreç Akış Diyagramı:**



```mermaid

flowchart
TD

{{SUREC_AKIS_DIYAGRAMI}}

```



**Süreç Adımları:**



| Adım | İşlem | Açıklama | Sorumlu |

|------|-------|----------|---------|

| 1 | {{ISLEM_1}} | {{ACIKLAMA_1}} | {{SORUMLU_1}} |

| 2 | {{ISLEM_2}} | {{ACIKLAMA_2}} | {{SORUMLU_2}} |



### 3.3. Kapsama Alınmayan Müşteri Gereksinimleri



| Müşteri Gereksinimi | Gerekçe |

|---------------------|---------|

| {{KAPSAM_DISI_1}} | {{GEREKCE_1}} |

| {{KAPSAM_DISI_2}} | {{GEREKCE_2}} |



### 3.4. Etki ve Risk Analizi



>
**Not:** Bu bölüm sonraki aşamada değerlendirilecektir.



#### 3.4.1. ADK Kanal Etkisi

{{ETK_ADK}}



#### 3.4.2. Engelsiz Bankacılık Etkisi

{{ETKI_ENGELSIZ}}



#### 3.4.3. SAS Fraud Etkisi

{{ETKI_FRAUD}}



#### 3.4.4. Chatbot Etkisi

{{ETKI_CHATBOT}}



#### 3.4.5. CMS Etkisi

{{ETKI_CMS}}



#### 3.4.6. TTS/DYS Etkisi

{{ETKI_TTS_DYS}}



#### 3.4.7. MDYS Etkisi

{{ETKI_MDYS}}



#### 3.4.8. Mevzuata Uyum Etkisi

{{ETKI_MEVZUAT}}



#### 3.4.9. Anomali Takibi Etkisi

{{ETKI_ANOMALI}}



#### 3.4.10. EBHS Etkisi

{{ETKI_EBHS}}



#### 3.4.11. İngilizce İletişim Etkisi

{{ETKI_INGILIZCE}}



---



## 4. Yazılımın Fonksiyonel Gereksinimleri



### 4.1. Yazılım İşlevleri



#### 4.1.Y {{ISLEV_BASLIGI}} Yazılım İşlevi



**Karar Matrisi:**



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

| Etki Analizi | {{EVET_HAYIR}} | 4.1.Y.11 | Etki Analizi |



>
**Not:** "Evet" işaretlenen her başlık için aşağıda detaylı açıklama yapılacaktır.



---



##### 4.1.Y.1. Ekran Tasarımı



**Etkilenen Ekranlar:**



| Ekran Kodu | Ekran Adı | Değişiklik Tipi | Açıklama |

|------------|-----------|-----------------|----------|

| {{EKRAN_KODU_1}} | {{EKRAN_ADI_1}} | Yeni / Güncelleme | {{ACIKLAMA_1}} |



**Alan Bilgileri:**



| Bileşen | Bilgi Adı | Tip | Değer Kümesi | Varsayılan | Zorunluluk | Açıklama |

|---------|-----------|-----|--------------|------------|------------|----------|

| {{BILESEN_1}} | {{ALAN_ADI_1}} | {{TIP_1}} | {{DEGER_1}} | {{VARSAYILAN_1}} | Zorunlu / Opsiyonel | {{ACIKLAMA_1}} |



---



##### 4.1.Y.2. Batchler



**Batch Detayları:**



| Batch Adı | Çalışma Zamanı | Amaç | Bağımlılıklar |

|-----------|----------------|------|---------------|

| {{BATCH_ADI_1}} | {{ZAMAN_1}} | {{AMAC_1}} | {{BAGIMLILIKLAR_1}} |



**İşlem Adımları:**



| Adım | İşlem | Tablo/Servis | Açıklama |

|------|-------|--------------|----------|

| 1 | {{ISLEM_1}} | {{TABLO_1}} | {{ACIKLAMA_1}} |



---



##### 4.1.Y.3. Çıktı ve Raporlar



| Mevcut/Yeni | Rapor/Çıktı Adı | Doküman Kodu | Türü | Sıklığı | Nerede/Hangi Aşamada | Açıklama |

|-------------|-----------------|--------------|------|---------|----------------------|----------|

| {{MEVCUT_YENI}} | {{RAPOR_ADI_1}} | {{DOKUMAN_KODU_1}} | {{TURU_1}} | {{SIKLIGI_1}} | {{ASAMA_1}} | {{ACIKLAMA_1}} |



---



##### 4.1.Y.4. Menü Tanımları



| Mevcut/Yeni | Ortam | Menü Adı | Menü Kırılımı | Ekran/İşlem Kodu | Detay |

|-------------|-------|----------|---------------|------------------|-------|

| {{MEVCUT_YENI}} | {{ORTAM_1}} | {{MENU_ADI_1}} | {{KIRILIM_1}} | {{EKRAN_KODU_1}} | {{DETAY_1}} |



---



##### 4.1.Y.5. Servisler



**Servis Detayları:**



| Mevcut/Yeni | Servis Adı | Tip | Input Parametreler | Output Parametreler | Açıklama |

|-------------|------------|-----|-------------------|---------------------|----------|

| {{MEVCUT_YENI}} | {{SERVIS_ADI_1}} | {{TIP_1}} | {{INPUT_1}} | {{OUTPUT_1}} | {{ACIKLAMA_1}} |



---



##### 4.1.Y.6. Erişim Noktaları



| Erişen Ekran/Batch/Menü | Erişilen Ekran/Batch/Menü | Transfer Edilecek Parametreler | Açıklama |

|--------------------------|---------------------------|-------------------------------|----------|

| {{ERISEN_1}} | {{ERISILEN_1}} | {{PARAMETRELER_1}} | {{ACIKLAMA_1}} |



---



##### 4.1.Y.7. SMS/PN Bilgilendirmeleri



>
**Müşteri Bilgilendirme Sistemi Referansı:** SMG Wiki (Confluence pageId: 8815310)



**Bildirim Detayları:**



| Form Code | Tip | Mesaj Metni | Hangi Durumda | Gönderen | Gönderim Zamanı | Gönderilecek Adres | CC |

|-----------|-----|-------------|---------------|----------|-----------------|-------------------|-----|

| {{FORM_CODE}} | SMS / PN | {{MESAJ}} | {{DURUM}} | {{GONDEREN}} | {{ZAMAN}} | {{ADRES}} | {{CC}} |



**Refresh Gereksinimleri:**



Müşteri bilgilendirme sistemi için aşağıdaki refresh işlemleri yapılacaktır:



- 
`NOTIFICATION_EMAIL_TEMPLATE` refresh

- 
`NOTIFICATION_SMS_TEMPLATE` refresh

- 
`NOTIFICATION_DEFINITION` refresh

- 
`SMS_FORM_RELATION` refresh

- 
`NOTIFICATION_PN_TEMPLATE` refresh



**SMS Form Aktifleştirme:**



Form Code + SMS Şablonu ilişkilendirmesi için MUS72368 ekranı kullanılacaktır.



**Queue Yapısı:**



- SMS Queue OID: 
`9600010000000116`

- Email Queue OID: 
`9600010000000070`

- Servis: 
`SMG_SUPPORT_SEND_NOTIFICATION`



---



##### 4.1.Y.8. E-Mail Bilgilendirmeleri



| Form Code | Tip | Mesaj Metni ve Formatı | Hangi Durumda | Gönderen Adres | Gönderilecek Adres | CC |

|-----------|-----|------------------------|---------------|----------------|--------------------|----|

| {{FORM_CODE}} | Email | {{MESAJ}} | {{DURUM}} | {{GONDEREN}} | {{ADRES}} | {{CC}} |



---



##### 4.1.Y.9. Memo/Ekstre Tanımları



| Kod | Tip | Mesaj Metni ve Formatı | Hangi Durumda |

|-----|-----|------------------------|---------------|

| {{KOD_1}} | Memo / Ekstre | {{MESAJ_1}} | {{KOSUL_1}} |



---



##### 4.1.Y.10. Uyarı/Hata Mesajları



**Hata Mesajları:**



| Kod | Tip | Mesaj Metni | Hangi Durumda |

|-----|-----|-------------|---------------|

| {{HATA_KODU_1}} | Uyarı / Hata | {{MESAJ_1}} | {{KOSUL_1}} |



---



##### 4.1.Y.11. Etki Analizi



{{ETKI_ANALIZI_DETAY}}



---



### 4.2. Muhasebe, Dekont, Alındılar ve Sistem Mizan



**Muhasebe Karar Matrisi:**



| Analiz Edilecek Başlıklar | Evet / Hayır | Index | Başlık |

|---------------------------|--------------|-------|--------|

| Fiş Satırı | {{EVET_HAYIR}} | 4.2.1 | Fiş Satırı |

| Vergi | {{EVET_HAYIR}} | 4.2.2 | Vergi |

| Hesap Hareketleri | {{EVET_HAYIR}} | 4.2.3 | Hesap Hareketleri |

| ATM | {{EVET_HAYIR}} | 4.2.4 | ATM |

| Masraf/Komisyon | {{EVET_HAYIR}} | 4.2.5 | Masraf/Komisyon |

| MASAK | {{EVET_HAYIR}} | 4.2.6 | MASAK |

| GIB Raporları | {{EVET_HAYIR}} | 4.2.7 | GIB Raporları |

| TCMB İstatistik | {{EVET_HAYIR}} | 4.2.8 | TCMB İstatistik |

| Sistem Mizan | {{EVET_HAYIR}} | 4.2.9 | Sistem Mizan |



**Muhasebe İşlem Detayları:**



| İşlem Tipi | Hesap Kodu | Borç/Alacak | Tutar | Açıklama |

|------------|------------|-------------|-------|----------|

| {{ISLEM_1}} | {{HESAP_1}} | {{BA_1}} | {{TUTAR_1}} | {{ACIKLAMA_1}} |



---



### 4.3. Loglama ve EDW Rapor Gereksinimi



#### 4.3.1. Loglama



>
**MADDE 13 Referansı:** BDDK Tebliği "İz kayıtlarının oluşturulması ve takibi" (Confluence pageId: 52235469)



**Log Gereksinimleri:**



BDDK MADDE 13/3 uyarınca iz kayıtları asgari 5 yıl süreyle saklanacaktır. Aşağıdaki bilgiler barındırılmalıdır:



- Kaydı oluşturan sistem

- Tarih/saat/zaman dilimi

- Değişiklik açıklaması

- Tekil kullanıcı/sistem kimliği



**Log Tabloları:**



| Tablo Adı | Amaç | Saklama Süresi |

|-----------|------|----------------|

| {{LOG_TABLO_1}} | {{AMAC_1}} | 5 yıl |



#### 4.3.2. EDW Rapor Gereksinimi



{{EDW_GEREKSINIMLERI}}



#### 4.3.3. Resmi Kurum / Yasal Raporlama



**Zamanaşımı Etkisi:**



{{ZAMANASIMI_ETKISI}}



**Yasal Raporlama Etkisi:**



{{YASAL_RAPORLAMA_ETKISI}}



**FATCA ve CRS Etkisi:**



{{FATCA_CRS_ETKISI}}



---



### 4.4. Ürün ve Ürün İşlem Tanım Gereksinimleri



#### 4.4.1. POT/TOT Tanımları



**POT (Product Offering Table) Gereksinimleri:**



| POT Adı | İşlem Adı | Kriterler | Dönen Değerler |

|---------|-----------|-----------|----------------|

| {{POT_ADI_1}} | {{ISLEM_1}} | {{KRITERLER_1}} | {{DEGERLER_1}} |



**Kriter Detayları:**



| Kriter | Açıklama | Değer |

|--------|----------|-------|

| {{KRITER_1}} | {{KRITER_ACIKLAMA_1}} | {{DEGER_1}} |

| {{KRITER_2}} | {{KRITER_ACIKLAMA_2}} | {{DEGER_2}} |

| {{KRITER_N}} | {{KRITER_ACIKLAMA_N}} | {{DEGER_N}} |



#### 4.4.2. Onay Kuralları Şablonu



{{ONAY_KURALLARI}}



---



## Ekler



### Ek A: Referans Dokümanlar



| Doküman | Konum | Versiyon |

|---------|-------|----------|

| AS-IS Analiz Dokümanı | `docs/as-is-analiz.md` | {{VERSIYON}} |

| Confluence - Proje Analizi Dokümanı Şablonu | pageId: 341516098 | — |

| Confluence - Proje Analiz Dokümanı Şablon Bilgileri | pageId: 41064380 | — |

| Confluence - MADDE 13 | pageId: 52235469 | — |

| Confluence - Müşteri Bilgilendirme (SMG Wiki) | pageId: 8815310 | — |



### Ek B: Değişiklik Onay Formu



| Onaylayan | Rol | Tarih | İmza |

|-----------|-----|-------|------|

| {{ONAYLAYAN_1}} | {{ROL_1}} | {{TARIH_1}} | |

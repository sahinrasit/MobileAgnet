# Common-Rules — 09: changelog.md Formatı

> İçerik [C12] (SemVer + Keep a Changelog).

`changelog.md` proje kökünde tutulur.

**Format ([Keep a Changelog](https://keepachangelog.com/en/1.1.0/) standardı):**

```markdown
# Changelog

## [Unreleased]

### Eklendi
- {{Yeni dosya / bölüm}}

### Değiştirildi
- {{Mevcut dosya güncellemesi}}

### Kaldırıldı
- {{Silinen bölüm}}

## [0.2.0] — 2026-05-17

### Eklendi
- Agent/mobile/mobile-01-analyze-as-is.md (yeni mobil AS-IS agent)
```

**Versiyonlama (SemVer):**

| Değişiklik Tipi | Artış |
|------------------|--------|
| Yeni dosya / yeni bölüm | Minor (0.**X**.0) |
| Mevcut dosyada içerik güncelleme | Patch (0.0.**X**) |
| Büyük yapısal değişiklik | Major (**X**.0.0) |

Birden fazla dosya aynı anda değişiyorsa **en yüksek seviye** baz alınır.

Dosya yoksa agent ilk değişiklikte oluşturur (`# Changelog\n\n## [Unreleased]\n\n### Eklendi\n- ...`).

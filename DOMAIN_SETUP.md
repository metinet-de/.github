# Domain-Konfiguration für metinet.de

Diese Anleitung erklärt, wie Sie Ihre Domain `metinet.de` für GitHub Pages konfigurieren.

## 🎯 Überblick

- **Domain**: `metinet.de`
- **GitHub Pages Repository**: `metinet-de/.github`
- **Blog-Pfad**: `metinet.de/blog/`
- **Hauptseite**: `metinet.de`

## ⚙️ GitHub Pages Einrichtung

### 1. Repository Settings
1. Gehen Sie zu Ihrem Repository: `https://github.com/metinet-de/.github`
2. Klicken Sie auf **Settings** (Repository-Einstellungen)
3. Scrollen Sie zu **Pages** (im linken Menü)

### 2. Source Konfiguration
- **Source**: Deploy from a branch
- **Branch**: `main` 
- **Folder**: `/ (root)`

### 3. Custom Domain
- **Custom domain**: `metinet.de`
- ✅ **Enforce HTTPS**: Aktiviert (empfohlen)

## 🌐 DNS-Konfiguration

### Option A: Apex Domain (metinet.de)
Fügen Sie diese DNS-Records bei Ihrem Domain-Provider hinzu:

```dns
Type: A
Name: @
Value: 185.199.108.153

Type: A  
Name: @
Value: 185.199.109.153

Type: A
Name: @
Value: 185.199.110.153

Type: A
Name: @
Value: 185.199.111.153
```

### Option B: CNAME (falls Apex nicht verfügbar)
```dns
Type: CNAME
Name: www
Value: metinet-de.github.io
```

## 📁 Datei-Struktur

```
├── CNAME                     # Domain-Konfiguration
├── _config.yml              # Jekyll-Konfiguration
├── Gemfile                  # Ruby Dependencies
├── index.html               # Hauptseite
├── blog/
│   └── index.md            # Blog-Startseite
├── _posts/                 # Blog-Posts
│   ├── 2025-10-06-welcome-to-metinet-blog.md
│   └── 2025-10-05-formageddon-behind-scenes.md
├── _layouts/               # Jekyll Templates
│   ├── default.html
│   ├── post.html
│   └── page.html
├── _includes/              # Partials
│   ├── header.html
│   ├── footer.html
│   └── social.html
└── assets/
    └── css/
        └── style.scss      # Custom Styles
```

## 🚀 URL-Struktur

Nach der Konfiguration sind folgende URLs verfügbar:

- **Hauptseite**: `https://metinet.de/`
- **Blog-Übersicht**: `https://metinet.de/blog/`
- **Blog-Posts**: `https://metinet.de/blog/YYYY/MM/DD/title/`
- **RSS Feed**: `https://metinet.de/feed.xml`

## ✅ Verifikation

### 1. Domain-Verifikation prüfen
```bash
dig metinet.de
```

### 2. GitHub Pages Status
- Besuchen Sie die Repository Settings > Pages
- Status sollte "✅ Your site is published at https://metinet.de" zeigen

### 3. SSL-Status
- HTTPS sollte automatisch aktiviert werden
- Kann 24-48 Stunden dauern

## 🔧 Troubleshooting

### Problem: "Domain's DNS record could not be retrieved"
**Lösung**: 
- DNS-Propagation kann bis zu 48 Stunden dauern
- Prüfen Sie DNS-Records mit `dig` oder `nslookup`

### Problem: "HTTPS certificate hasn't been provisioned yet"
**Lösung**:
- Warten Sie 24-48 Stunden
- Deaktivieren und reaktivieren Sie "Enforce HTTPS"

### Problem: 404 bei /blog/
**Lösung**:
- Stellen Sie sicher, dass `blog/index.md` existiert
- Prüfen Sie `_config.yml` Permalink-Konfiguration

## 📞 Support

Bei Problemen:
- **Email**: [info@metinet.de](mailto:info@metinet.de)
- **GitHub Issues**: Repository Issues verwenden
- **Documentation**: [GitHub Pages Docs](https://docs.github.com/en/pages)

---

**Hinweis**: Nach DNS-Änderungen kann es bis zu 48 Stunden dauern, bis die Änderungen global propagiert sind.
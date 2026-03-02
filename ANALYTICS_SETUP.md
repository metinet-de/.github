# Google Analytics & Search Console – Setup-Checkliste

## Status-Übersicht

| Task | Status |
|---|---|
| GA4 Measurement ID in `_config.yml` eintragen | ✅ Erledigt (`G-L38P4V2SD4`) |
| `google-analytics.html` mit Consent Mode v2 | ✅ Erledigt |
| DSGVO Cookie-Consent-Banner | ✅ Erledigt |
| Datenschutzerklärung aktualisiert | ✅ Erledigt |
| Footer-Link zur Datenschutzerklärung | ✅ Erledigt |
| Google Search Console verifizieren | ⏳ Ausstehend |
| GA4 in Search Console verknüpfen | ⏳ Ausstehend |

---

## 1. Google Analytics – Fertig ✅

Der GA4-Tag `G-L38P4V2SD4` ist eingebunden. Das Setup nutzt **Consent Mode v2** –
Analytics wird erst nach Nutzer-Zustimmung aktiviert (DSGVO-konform).

**Testen:** Nach dem Deploy auf metinet.de im Browser DevTools > Network auf
Requests an `googletagmanager.com` prüfen (sollten erst nach Klick auf "Akzeptieren" erscheinen).

---

## 2. Google Search Console einrichten ⏳

### Schritt 1: Property anlegen
1. Gehe zu [search.google.com/search-console](https://search.google.com/search-console)
2. Klicke auf **„Property hinzufügen"**
3. Wähle **„URL-Präfix"** → `https://metinet.de`

### Schritt 2: Verifizierung per Meta-Tag
1. Google zeigt dir einen Meta-Tag, z. B.:
   ```html
   <meta name="google-site-verification" content="DEIN_CODE_HIER" />
   ```
2. Kopiere nur den **Content-Wert** (z.B. `abc123def456`)
3. Trage ihn in `_config.yml` ein:
   ```yaml
   google_site_verification: "abc123def456"
   ```
4. Deploye die Seite (GitHub Pages Build abwarten)
5. Klicke in der Search Console auf **„Bestätigen"**

### Schritt 3: Sitemap einreichen
1. In der Search Console: **Sitemaps** → `sitemap.xml` eintragen
2. Die Sitemap wird automatisch von `jekyll-sitemap` generiert:
   `https://metinet.de/sitemap.xml`

---

## 3. GA4 mit Search Console verknüpfen ⏳

1. In **Google Analytics**: Verwaltung → Property-Einstellungen → **„Search Console-Links"**
2. Klicke **„Verknüpfen"** → metinet.de auswählen
3. Die Verknüpfung ermöglicht Search-Daten (Queries, Impressionen) direkt in GA4

---

## 4. Empfohlene GA4-Konfiguration

Überprüfe in GA4 unter **Verwaltung → Datenstreams → metinet.de**:

- ✅ „Verbesserte Messung" aktivieren (scrolls, outbound clicks, etc.)
- ✅ Datenaufbewahrung auf **14 Monate** stellen (Standard: 2 Monate)
- ✅ IP-Anonymisierung ist bereits im Code aktiviert

---

## 5. Geänderte Dateien (Zusammenfassung)

```
_config.yml                    ← GA-ID + GSC-Verification-Platzhalter
_layouts/default.html          ← GA-Include + Consent-Banner eingebunden
_includes/google-analytics.html  ← NEU: GA4 mit Consent Mode v2
_includes/consent-banner.html    ← NEU: DSGVO Cookie-Banner
_includes/footer.html          ← Datenschutz-Link im Footer
datenschutz.md                 ← NEU: Datenschutzerklärung
```

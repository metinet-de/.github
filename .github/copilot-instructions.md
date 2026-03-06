# Copilot Instructions — metinet.de

## Project Overview

Jekyll static site and GitHub organization hub hosted on GitHub Pages at `metinet.de`.

## Tech Stack

- **SSG:** Jekyll (Ruby 3.3, Minima theme, kramdown, rouge)
- **CSS:** Tailwind CSS 3.4 + custom SCSS (`assets/css/style.scss`)
- **Syntax highlighting:** Rouge (build-time) + Prism.js (CDN, client-side)
- **Build:** `npm run css:build` → Tailwind, `bundle exec jekyll build` → site
- **Deploy:** GitHub Actions → GitHub Pages (push to `main`)
- **Domain:** metinet.de (CNAME, HTTPS enforced)

## Key Conventions

1. **Blog posts** go in `_posts/` with format `YYYY-MM-DD-title.md`.
2. **Layouts** in `_layouts/`, partials in `_includes/`.
3. **Dark mode** is default; toggle persisted via `localStorage`. Both `:root` and `:root.dark` tokens must stay in sync.
4. **Tailwind content paths** are defined in `tailwind.config.js` — update when adding new content directories.
5. **Jekyll excludes** build tooling files (`package.json`, `node_modules/`, etc.) in `_config.yml`.
6. **Permalinks** follow `/blog/:year/:month/:day/:title/` — do not change without migration.
7. **No secrets** in source. No API keys, tokens, or credentials committed.
8. **Internationalization (i18n):** Site supports German and English. The current routing is mixed: the root homepage `/` is German, the explicit English homepage is `/en/`, English section pages like `/blog/` and `/contact/` stay at the root, and German equivalents live under `/de/`. See `I18N.md` for architecture details.

## Internationalization

- **UI translations** live in `_data/i18n/en.yml` and `_data/i18n/de.yml`. Access via `{% assign t = site.data.i18n[current_lang] %}`.
- **Every translated page and post** should have `lang:` and `ref:` front matter. `ref` is the shared key that links translations together. The current root homepage `/` is the explicit exception and only uses `lang: de`.
- **German** is the configured default language in `_config.yml`, and the root homepage `/` currently renders German. **English** has an explicit homepage at `en/` and root-level section pages such as `/blog/` and `/contact/`.
- **German posts** go in `_posts/` with `lang: de` and a matching `ref` to their English counterpart. Set `permalink: /de/blog/:year/:month/:day/:title/` in front matter.
- **Language picker** is in `_includes/lang-switcher.html`, included in the header.
- **Translation banner** (`_includes/translation-banner.html`) shows on posts that have a translation.

## Path-Specific Instructions

See `.github/instructions/` for domain-specific guidance:

- `frontend.instructions.md` — Jekyll templates, SCSS, Tailwind, accessibility
- `security.instructions.md` — Content security, dependency management
- `blog-writing-style.instructions.md` — Blog post voice, tone, structure, and formatting rules

## Docker Ignore Policy

This project enforces a **deny-all Docker build context policy**. See `AGENTS.md § Docker Ignore Policy` for the canonical definition. Any Dockerfile introduction or change must be accompanied by `.dockerignore` audit.

## Post-Task Hygiene

See `AGENTS.md § Post-Task Hygiene` for the mandatory post-task steps.

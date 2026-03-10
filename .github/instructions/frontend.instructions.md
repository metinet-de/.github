# Frontend Instructions

applyTo: "_layouts/**", "_includes/**", "assets/**", "*.html", "blog/**", "_posts/**", "tailwind.config.js"

## Jekyll Templates

- Use Liquid templating. Prefer `| relative_url` filter for all internal links.
- Layouts inherit: `post.html` → `default.html`. Keep inheritance chain shallow.
- Reusable HTML belongs in `_includes/`. Do not inline repetitive markup in layouts.
- Front matter is required for all content files. Minimum: `layout`, `title`.

## SCSS / Tailwind

- **Design tokens** live in `assets/css/style.scss` under `:root` and `:root.dark`. Do not duplicate color values in Tailwind config — use CSS custom properties.
- **Tailwind utility classes** are used in HTML for layout. Custom component styles go in `style.scss`.
- After adding a new content directory, update `content` array in `tailwind.config.js`.
- Run `npm run css:build` to regenerate `assets/css/tailwind.css` before committing.

## Dark Mode

- Dark mode uses the `class` strategy (`dark` class on `<html>`).
- Every color must have a dark variant. Check both `:root` and `:root.dark` tokens when changing colors.
- Inline `<script>` in `default.html <head>` prevents FOUC — do not move it.

## Accessibility

- All images require `alt` attributes.
- Interactive SVGs need `aria-hidden="true"` and `focusable="false"` if decorative.
- Use semantic HTML elements (`<nav>`, `<main>`, `<article>`, `<section>` with `aria-label`).
- Links opening in new tabs need `rel="noopener"` and visible indication.

## Blog Posts

- Filename: `YYYY-MM-DD-slug.md` in `_posts/de/` or `_posts/en/`.
- Required front matter: `layout: post`, `title`, `date`, `categories`, `tags`, `description`.
- Use fenced code blocks with language identifiers for Prism.js highlighting.
- Keep image assets in `assets/images/` (create if needed) and reference via `{{ "/assets/images/..." | relative_url }}`.

## Blog Post UX Features

All of these are implemented in `_layouts/post.html` and `_layouts/default.html`:

- **Reading time**: Calculated at build time via Liquid `number_of_words` (~200 wpm). Displayed in post meta.
- **Table of Contents**: Generated client-side from `h2[id]` / `h3[id]` in `.post-content`. Collapsible `<details>`. Hidden when <2 headings.
- **Heading anchor links**: `#` link appended to each heading with an `id`. Visible on hover via `.heading-anchor`.
- **Code copy button**: Added to all `<pre>` blocks. Uses `navigator.clipboard`. Styled as `.code-copy-btn`.
- **Scroll progress bar**: `#scroll-progress` div at top of `<body>`. Width updated on scroll. Only active on post pages.
- **Related posts**: Liquid loop finds same-language posts sharing a tag. Max 3. Rendered as `.related-posts-grid`.
- **Back to top button**: `#back-to-top` button, appears after 400px scroll, smooth scroll to top.
- **Custom 404 page**: `404.html` at root. Uses i18n strings from `t.notfound.*`.

All i18n strings for these features live in `_data/i18n/{en,de}.yml` under `post.*` and `notfound.*`.

When adding new interactive features, keep JS inline in `default.html` (no external JS files) to minimize requests.

## Content Directories

The following directories contain content processed by Tailwind and Jekyll:

- `_layouts/`, `_includes/` — templates and partials
- `_posts/de/`, `_posts/en/` — blog posts separated by language
- `_data/i18n/` — translation files (`en.yml`, `de.yml`)
- `blog/` — English blog section pages
- `de/` — German language pages (homepage, blog, contact, etc.)
- `profile/` — GitHub organization profile
- `assets/` — stylesheets and static assets

When adding a new content directory, update `tailwind.config.js` content paths.

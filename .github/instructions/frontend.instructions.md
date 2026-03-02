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

- Filename: `YYYY-MM-DD-slug.md` in `_posts/`.
- Required front matter: `layout: post`, `title`, `date`, `categories`, `tags`, `description`.
- Use fenced code blocks with language identifiers for Prism.js highlighting.
- Keep image assets in `assets/images/` (create if needed) and reference via `{{ "/assets/images/..." | relative_url }}`.

## Content Directories

The following directories contain content processed by Tailwind and Jekyll:

- `_layouts/`, `_includes/` — templates and partials
- `_posts/` — blog posts
- `blog/` — blog section pages
- `profile/` — GitHub organization profile
- `assets/` — stylesheets and static assets

When adding a new content directory, update `tailwind.config.js` content paths.

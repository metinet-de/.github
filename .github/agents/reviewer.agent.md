# Reviewer Agent

## Role

Reviews code changes for quality, consistency, accessibility, and security.

## Instructions

- Enforce conventions from `.github/copilot-instructions.md`.
- Apply frontend rules from `.github/instructions/frontend.instructions.md`.
- Apply security rules from `.github/instructions/security.instructions.md`.

## Review Checklist

### Structure
- [ ] Front matter is complete on all content files.
- [ ] Layouts and includes are used correctly (no duplicated markup).
- [ ] New directories are reflected in `tailwind.config.js` content paths.

### Styles
- [ ] Both `:root` and `:root.dark` tokens are updated together.
- [ ] No hardcoded colors in HTML — use CSS custom properties or Tailwind classes.
- [ ] `npm run css:build` produces no errors.

### Accessibility
- [ ] All images have `alt` attributes.
- [ ] Decorative SVGs use `aria-hidden="true"`.
- [ ] Semantic HTML is used appropriately.
- [ ] `target="_blank"` links include `rel="noopener"`.

### Security
- [ ] No secrets, tokens, or credentials in source.
- [ ] External resources load from trusted CDNs only.
- [ ] User-facing strings use `| escape` filter.

### Build
- [ ] `bundle exec jekyll build` succeeds.
- [ ] Permalinks follow `/blog/:year/:month/:day/:title/`.

### Docker
- [ ] If Dockerfile or container config was added/changed, `.dockerignore` follows deny-all policy per `AGENTS.md`.

## Output

Provide findings as a checklist with pass/fail status and specific file references for any issues.

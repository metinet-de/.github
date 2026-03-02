# Security Instructions

applyTo: "**"

## Secrets

- Never commit API keys, tokens, passwords, or credentials.
- Use GitHub Actions secrets for CI values. Reference via `${{ secrets.NAME }}`.
- No `.env` files in the repository. Add `.env*` to `.gitignore` if local env files are used.

## Dependencies

- Pin major versions in `Gemfile` and `package.json`.
- Prefer `github-pages` gem for Jekyll to stay compatible with GitHub Pages runtime.
- Review Dependabot alerts promptly. Critical/High within 7 days.
- Audit npm packages: `npm audit`. Audit gems: `bundle audit` (if `bundler-audit` is installed).

## Content Security

- External scripts load only from trusted CDNs (cdnjs.cloudflare.com currently).
- Do not add inline scripts beyond the existing dark-mode and Prism initialization.
- Validate that `rel="noopener"` is present on all `target="_blank"` links.
- No user-generated content is rendered without escaping (`| escape` Liquid filter).

## GitHub Pages

- HTTPS is enforced via GitHub Pages settings. Do not weaken.
- `CNAME` file must contain only the bare domain (`metinet.de`).
- Do not expose internal paths, build artifacts, or drafts in production output.

## Reporting

Follow `SECURITY.md` for vulnerability disclosure. Do not open public issues for security findings.

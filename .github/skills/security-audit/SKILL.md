# Skill: Security Audit

## Scope

Audits this repository for security issues relevant to a Jekyll static site deployed on GitHub Pages.

## Audit Checklist

### 1. Secrets Exposure
- [ ] No API keys, tokens, or passwords in any tracked file.
- [ ] No `.env` files committed.
- [ ] GitHub Actions secrets used for sensitive CI values.

### 2. Dependency Health
- [ ] `npm audit` reports no high/critical vulnerabilities.
- [ ] `bundle audit` (if available) reports no advisories.
- [ ] Dependabot is enabled or dependencies are manually reviewed quarterly.
- [ ] No wildcard version ranges (e.g., `*`) in `package.json` or `Gemfile`.

### 3. External Resources
- [ ] All CDN URLs use HTTPS.
- [ ] CDN resources are from trusted providers (cdnjs.cloudflare.com, unpkg.com, etc.).
- [ ] Subresource Integrity (SRI) hashes considered for critical CDN assets.
- [ ] No untrusted third-party scripts loaded.

### 4. HTML / Content Security
- [ ] All `target="_blank"` links include `rel="noopener"`.
- [ ] User-facing Liquid output uses `| escape` where appropriate.
- [ ] No raw HTML injection points from front matter into templates without escaping.

### 5. GitHub Pages Configuration
- [ ] HTTPS enforcement enabled.
- [ ] `CNAME` contains only the bare domain.
- [ ] `_config.yml` excludes build tooling from site output.
- [ ] No draft or private content in published `_site/`.

### 6. Docker Context (if applicable)
- [ ] `.dockerignore` complies with `AGENTS.md § Docker Ignore Policy`.

## When To Run

- Before any release or deployment change.
- After adding external scripts or CDN resources.
- After dependency updates.
- On Dependabot alert triage.

## Output

Produce a checklist with pass/fail status per item. Flag any failures with severity (Critical / High / Medium / Low) and remediation steps.

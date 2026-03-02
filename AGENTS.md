# AGENTS.md — metinet.de

## Repository

Jekyll static site + GitHub organization hub. Deployed to GitHub Pages at `metinet.de`.

## Agent Delegation

| Agent | Responsibility | File |
|---|---|---|
| Implementer | Feature implementation and bugfixes | `.github/agents/implementer.agent.md` |
| Reviewer | Code review and quality checks | `.github/agents/reviewer.agent.md` |
| Copilot Hygiene | Configuration drift detection and maintenance | `.github/agents/copilot-hygiene.agent.md` |

## Skills

| Skill | Purpose | File |
|---|---|---|
| API Contracts | RSS feed, sitemap, permalink, front matter schema | `.github/skills/api-contracts/SKILL.md` |
| Migrations | Jekyll, Tailwind, Actions version upgrades | `.github/skills/migrations/SKILL.md` |
| Security Audit | Secrets, dependencies, content security | `.github/skills/security-audit/SKILL.md` |
| Copilot Hygiene | Config synchronization checks | `.github/skills/copilot-hygiene/SKILL.md` |

## Prompts

| Prompt | Purpose | File |
|---|---|---|
| Write Tests | Build verification and content validation | `.github/prompts/write-tests.prompt.md` |
| Explain Change | Structured change summaries for commits/PRs | `.github/prompts/explain-change.prompt.md` |
| Copilot Hygiene Check | Post-task configuration audit | `.github/prompts/copilot-hygiene-check.prompt.md` |

## Build Commands

```bash
npm run css:build          # Rebuild Tailwind CSS
bundle exec jekyll build   # Build Jekyll site
bundle exec jekyll serve   # Local preview (http://localhost:4000)
```

## Docker Ignore Policy

This project enforces a **deny-all Docker build context policy**. This section is the single source of truth for Docker context rules.

### Rules

1. **`.dockerignore` must start with `**`** (deny all files by default).
2. **Allowlist only required runtime files** using `!` prefix exceptions.
3. **Never allow:**
   - `.git/`
   - `node_modules/`
   - Test directories
   - Documentation (`*.md`, `SETUP.md`, `DOMAIN_SETUP.md`, etc.)
   - CI configuration (`.github/`)
   - Local environment files (`.env*`)
   - Build artifacts (`_site/`, `.sass-cache/`, `.jekyll-cache/`)
   - Secrets or credentials
4. **Minimal allowlist for this site** (if containerized):
   ```
   !_config.yml
   !Gemfile
   !Gemfile.lock
   !index.html
   !CNAME
   !_layouts/
   !_includes/
   !_posts/
   !assets/
   !blog/
   !package.json
   !package-lock.json
   !tailwind.config.js
   ```

### Enforcement

- Any PR introducing or modifying a `Dockerfile`, `docker-compose.yml`, or `.dockerignore` must include Docker Ignore Policy review.
- The Copilot Hygiene Agent detects Docker file changes and flags policy violations.
- The GitHub Actions workflow `.github/workflows/copilot-hygiene.yml` warns on Docker-related PRs.

### Verification

To audit the current `.dockerignore`:

1. Confirm first line is `**`.
2. Confirm every `!` exception is a required runtime file.
3. Confirm none of the "Never allow" items are excepted.

## Post-Task Hygiene

After completing any feature or bugfix:

1. Run Copilot Hygiene Check (`.github/prompts/copilot-hygiene-check.prompt.md`).
2. If Docker context changed, verify `.dockerignore` per Docker Ignore Policy above.
3. If new directories, tools, or CI steps were added, update Copilot configuration.

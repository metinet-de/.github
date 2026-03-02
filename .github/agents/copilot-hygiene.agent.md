# Copilot Hygiene Agent

## Role

Detects configuration drift between the repository state and Copilot configuration. Proposes minimal patches to keep them aligned.

## Instructions

- This agent does not implement features. It audits and proposes changes only.
- Reference `AGENTS.md` for the canonical Docker Ignore Policy.
- Reference `.github/skills/copilot-hygiene/SKILL.md` for trigger conditions and audit checklist.

## Detection: Repository Drift

Scan for changes that may require Copilot configuration updates:

1. **New directories** — Check if `tailwind.config.js` content paths, `_config.yml` excludes, and `.github/instructions/` coverage need updating.
2. **New tooling** — Check if `package.json` scripts, `Gemfile` gems, or CI steps were added without corresponding instruction updates.
3. **CI changes** — Check if `.github/workflows/` files changed and agents/skills reference outdated commands.
4. **Docker changes** — Check if Dockerfile, docker-compose, or `.dockerignore` were added/modified. Verify deny-all policy compliance.
5. **New runtime assets** — Check if new asset directories exist that aren't reflected in build config.

## Detection: Copilot Drift

Scan for stale or missing Copilot configuration:

1. **Outdated commands** — Verify all commands referenced in instructions and agents still exist in `package.json` scripts and `Gemfile`.
2. **Missing path instructions** — Check if new content directories lack `applyTo` coverage.
3. **Missing skills** — Check if new patterns (e.g., API integrations, databases) lack corresponding skills.
4. **Docker policy violations** — Verify `.dockerignore` uses deny-all model if Docker files exist.

## Output Format

```
## Copilot Hygiene Report

### Repository Drift
- [finding or "No drift detected"]

### Copilot Drift
- [finding or "No drift detected"]

### Suggested Changes
- [file: description of change]
  (or "No changes required")

### Rationale
- [brief justification for each suggested change]
```

If no issues are found, output: "No changes required."

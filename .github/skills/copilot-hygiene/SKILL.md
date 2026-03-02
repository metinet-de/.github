# Skill: Copilot Hygiene

## Scope

Ensures Copilot configuration stays synchronized with repository state.

## Trigger Conditions

Run this skill when any of the following change:

| Change | Why |
|---|---|
| Dockerfile or docker-compose added/modified | Docker Ignore Policy may need enforcement |
| `.dockerignore` modified | Verify deny-all compliance |
| `package.json` scripts changed | Agent/instruction commands may be stale |
| `Gemfile` plugins changed | Build instructions may need update |
| New top-level directory added | Tailwind content paths + instruction coverage may need update |
| `.github/workflows/` modified | Agent references to CI steps may be outdated |
| `_config.yml` modified | Multiple instructions reference config values |
| New `_includes/` or `_layouts/` file added | Frontend instructions may need update |

## Audit Checklist

### Instruction Consistency
- [ ] Commands in `.github/copilot-instructions.md` match `package.json` scripts.
- [ ] Commands in agents match actual build tools.
- [ ] `tailwind.config.js` content paths cover all content directories.
- [ ] `_config.yml` excludes list is current.

### Agent Coverage
- [ ] Every major workflow (implement, review, maintain) has an agent.
- [ ] Agents reference current file paths and tool names.

### Docker Deny-All Enforcement
- [ ] `.dockerignore` complies with `AGENTS.md § Docker Ignore Policy`.

### Script Validity
- [ ] `npm run css:build` succeeds.
- [ ] `bundle exec jekyll build` succeeds.
- [ ] GitHub Actions workflow references valid action versions.

## Output Format

```
## Hygiene Audit Results

### Checks Passed
- [list]

### Issues Found
- [issue: description, affected file, suggested fix]

### Suggested Patch
(minimal diff or "No changes required")
```

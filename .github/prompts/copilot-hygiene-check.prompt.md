# Copilot Hygiene Check

## Purpose

Run after completing any feature or bugfix to verify Copilot configuration is still accurate.

## Steps

1. **Scan for repository drift:**
   - Were new directories added? → Check `tailwind.config.js` content paths.
   - Were new npm scripts added? → Check agent and instruction references.
   - Were Gemfile plugins changed? → Check build instructions.
   - Were CI workflows modified? → Check agent workflow references.
   - Were Docker files added or changed? → Run Docker Ignore Audit (see step 3).

2. **Scan for Copilot drift:**
   - Do all commands in `.github/copilot-instructions.md` still exist?
   - Do all agents reference valid file paths?
   - Are there new content patterns missing skill coverage?

3. **Docker Ignore Audit** (if Docker context changed):
   - Verify `.dockerignore` complies with `AGENTS.md § Docker Ignore Policy`.

4. **Report findings** using the format defined in `.github/agents/copilot-hygiene.agent.md § Output Format`.

## When To Skip

If the change was limited to blog post content (`_posts/*.md`) with no structural, config, or dependency modifications, hygiene check can be skipped.

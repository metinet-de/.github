# Write Tests

## Context

This Jekyll static site has no test framework. "Tests" are build verification and content validation steps.

## Steps

1. **Build verification:**
   ```bash
   npm run css:build
   bundle exec jekyll build
   ```
   Confirm both exit with code 0 and produce no warnings.

2. **HTML validation:**
   Check `_site/` output for:
   - Valid HTML structure (opening/closing tags balanced).
   - All internal links resolve to existing files in `_site/`.
   - All images have `alt` attributes.
   - No broken asset references.

3. **Feed validation:**
   Confirm `_site/feed.xml` is well-formed XML with at least one `<entry>`.

4. **Sitemap validation:**
   Confirm `_site/sitemap.xml` lists all expected page URLs.

5. **Front matter completeness:**
   For each file in `_posts/`, verify required fields per `.github/skills/api-contracts/SKILL.md`.

## Output

Report pass/fail per step with specific file references for any failures.

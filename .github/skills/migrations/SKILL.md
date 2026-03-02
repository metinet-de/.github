# Skill: Migrations

## Scope

Handles version upgrades and structural migrations for this Jekyll static site.

## Migration Types

### Jekyll / Ruby

- **Trigger:** Ruby version change, `github-pages` gem update, Jekyll major version bump.
- **Steps:**
  1. Update `Gemfile` version constraints.
  2. Run `bundle update`.
  3. Check for deprecated config keys in `_config.yml` against Jekyll release notes.
  4. Verify `bundle exec jekyll build` succeeds with no deprecation warnings.
  5. Spot-check rendered output in `_site/`.

### Tailwind CSS

- **Trigger:** Tailwind major version bump (e.g., v3 → v4).
- **Steps:**
  1. Update `package.json` version.
  2. Run `npm install`.
  3. Review `tailwind.config.js` for breaking config changes.
  4. Run `npm run css:build` and verify output.
  5. Check that dark mode classes and custom colors still apply.

### GitHub Actions

- **Trigger:** Action version deprecation (e.g., `actions/checkout@v4` → `@v5`).
- **Steps:**
  1. Update action versions in `.github/workflows/deploy.yml`.
  2. Verify Node.js and Ruby version compatibility.
  3. Test workflow via `workflow_dispatch`.

### Permalink / URL Migration

- **Trigger:** Change to `_config.yml` permalink pattern or collection paths.
- **Steps:**
  1. Document all existing URLs (from `_site/sitemap.xml`).
  2. Apply change.
  3. Generate diff of old vs. new URLs.
  4. Create redirect map (via `jekyll-redirect-from` plugin or manual).
  5. Verify no 404s for previously published URLs.

## Output

For each migration, produce:

1. **Before state** — current versions/config.
2. **Change list** — files modified and why.
3. **Verification** — build/deploy confirmation.
4. **Rollback plan** — how to revert if issues arise.

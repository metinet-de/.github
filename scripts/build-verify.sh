#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────
# build-verify.sh — Automated build verification for metinet.de
# Checks the _site/ output for correctness after Jekyll build.
# Exit code 0 = all checks pass, 1 = at least one failure.
# ─────────────────────────────────────────────────────────
set -euo pipefail

SITE_DIR="${1:-_site}"
FAIL=0
PASS=0
TOTAL=0

pass() { ((PASS++)); ((TOTAL++)); printf "  ✅ %s\n" "$1"; }
fail() { ((FAIL++)); ((TOTAL++)); printf "  ❌ %s\n" "$1"; }
section() { printf "\n── %s ──\n" "$1"; }

# ═══════════════════════════════════════════
# 1. Build output exists
# ═══════════════════════════════════════════
section "Build Output"

if [[ -d "$SITE_DIR" ]]; then
  pass "Site directory exists"
else
  fail "Site directory missing: $SITE_DIR"
  echo "Run 'make build' first."
  exit 1
fi

page_count=$(find "$SITE_DIR" -name "*.html" | wc -l | tr -d ' ')
if [[ "$page_count" -gt 0 ]]; then
  pass "HTML pages generated ($page_count files)"
else
  fail "No HTML pages found"
fi

# ═══════════════════════════════════════════
# 2. Key pages exist
# ═══════════════════════════════════════════
section "Key Pages"

key_pages=(
  "index.html"
  "404.html"
  "sitemap.xml"
  "feed.xml"
  "feed-en.xml"
  "feed-de.xml"
  "llms.txt"
  "llms-full.txt"
  "robots.txt"
  "blog/index.html"
  "de/blog/index.html"
  "blog/tags/index.html"
  "de/blog/tags/index.html"
  "en/index.html"
  "de/index.html"
  "contact/index.html"
)

for page in "${key_pages[@]}"; do
  if [[ -f "$SITE_DIR/$page" ]]; then
    pass "$page"
  else
    fail "$page missing"
  fi
done

# ═══════════════════════════════════════════
# 3. Blog post features
# ═══════════════════════════════════════════
section "Blog Post Features"

# Find a post page to test
test_post=$(find "$SITE_DIR/blog" -path "*/20*/index.html" | head -1)
if [[ -z "$test_post" ]]; then
  fail "No English blog post found to test"
else
  post_name=$(echo "$test_post" | sed "s|$SITE_DIR/||")
  printf "  Testing: %s\n" "$post_name"

  # Reading time
  if grep -q "min read\|Min. Lesezeit" "$test_post"; then
    pass "Reading time present"
  else
    fail "Reading time missing"
  fi

  # TOC placeholder
  if grep -q 'id="toc-list"' "$test_post"; then
    pass "Table of Contents placeholder"
  else
    fail "TOC placeholder missing"
  fi

  # Scroll progress bar
  if grep -q 'id="scroll-progress"' "$test_post"; then
    pass "Scroll progress bar"
  else
    fail "Scroll progress bar missing"
  fi

  # Back to top button
  if grep -q 'id="back-to-top"' "$test_post"; then
    pass "Back to top button"
  else
    fail "Back to top button missing"
  fi

  # Code copy JS
  if grep -q 'code-copy-btn' "$test_post"; then
    pass "Code copy button JS"
  else
    fail "Code copy button JS missing"
  fi

  # Heading anchor JS
  if grep -q 'heading-anchor' "$test_post"; then
    pass "Heading anchor links JS"
  else
    fail "Heading anchor links JS missing"
  fi

  # Related posts section (may not appear on all posts if no tag overlap)
  if grep -q 'related-post' "$test_post"; then
    pass "Related posts section"
  else
    # Not a failure — some posts might not match any tags
    printf "  ⚠️  Related posts not found (may be expected if no tag overlap)\n"
  fi

  # Post navigation
  if grep -q 'post-navigation' "$test_post"; then
    pass "Post navigation (prev/next)"
  else
    fail "Post navigation missing"
  fi

  # Tags as links (not spans)
  if grep -q 'class="tag".*href\|href.*class="tag"' "$test_post"; then
    pass "Tags are clickable links"
  else
    fail "Tags are not links"
  fi
fi

# ═══════════════════════════════════════════
# 4. German blog post features
# ═══════════════════════════════════════════
section "German Blog Post Features"

de_post=$(find "$SITE_DIR/de/blog" -path "*/20*/index.html" | head -1)
if [[ -z "$de_post" ]]; then
  fail "No German blog post found"
else
  de_name=$(echo "$de_post" | sed "s|$SITE_DIR/||")
  printf "  Testing: %s\n" "$de_name"

  if grep -q "Min. Lesezeit\|min read" "$de_post"; then
    pass "DE: Reading time present"
  else
    fail "DE: Reading time missing"
  fi

  if grep -q 'id="toc-list"' "$de_post"; then
    pass "DE: TOC placeholder"
  else
    fail "DE: TOC placeholder missing"
  fi
fi

# ═══════════════════════════════════════════
# 5. RSS Feeds
# ═══════════════════════════════════════════
section "RSS Feeds"

for feed in feed.xml feed-en.xml feed-de.xml; do
  if [[ -f "$SITE_DIR/$feed" ]]; then
    # Check it's valid XML (basic: has xml declaration and feed/entry)
    if head -1 "$SITE_DIR/$feed" | grep -q '<?xml'; then
      pass "$feed is XML"
    else
      fail "$feed missing XML declaration"
    fi

    entry_count=$(grep -c '<entry' "$SITE_DIR/$feed" || true)
    if [[ "$entry_count" -gt 0 ]]; then
      pass "$feed has $entry_count entries"
    else
      fail "$feed has no entries"
    fi
  fi
done

# Per-language feed should only contain that language
if grep -q 'hreflang="de"' "$SITE_DIR/feed-en.xml" 2>/dev/null; then
  fail "feed-en.xml contains German posts"
else
  pass "feed-en.xml is English-only"
fi

if grep -q 'hreflang="en"' "$SITE_DIR/feed-de.xml" 2>/dev/null; then
  fail "feed-de.xml contains English posts"
else
  pass "feed-de.xml is German-only"
fi

# ═══════════════════════════════════════════
# 6. Sitemap
# ═══════════════════════════════════════════
section "Sitemap"

if [[ -f "$SITE_DIR/sitemap.xml" ]]; then
  url_count=$(grep -c '<loc>' "$SITE_DIR/sitemap.xml" || true)
  pass "Sitemap has $url_count URLs"

  # Documentation files should NOT be in sitemap
  docs_in_sitemap=$(grep -cE 'AGENTS|SETUP|ANALYTICS|DOMAIN_SETUP|I18N\.html|SECURITY\.html|README' "$SITE_DIR/sitemap.xml" || true)
  if [[ "$docs_in_sitemap" -eq 0 ]]; then
    pass "No documentation files in sitemap"
  else
    fail "$docs_in_sitemap documentation files found in sitemap"
  fi
fi

# ═══════════════════════════════════════════
# 7. 404 Page
# ═══════════════════════════════════════════
section "404 Page"

if [[ -f "$SITE_DIR/404.html" ]]; then
  if grep -q '404' "$SITE_DIR/404.html" && grep -q 'notfound' "$SITE_DIR/404.html"; then
    pass "404 page has correct content"
  else
    fail "404 page missing expected content"
  fi
fi

# ═══════════════════════════════════════════
# 8. llms.txt
# ═══════════════════════════════════════════
section "llms.txt"

if [[ -f "$SITE_DIR/llms.txt" ]]; then
  if grep -q 'metinet.de' "$SITE_DIR/llms.txt"; then
    pass "llms.txt has site name"
  else
    fail "llms.txt missing site name"
  fi
fi

if [[ -f "$SITE_DIR/llms-full.txt" ]]; then
  post_links=$(grep -cE '/blog/[0-9]{4}/' "$SITE_DIR/llms-full.txt" || true)
  if [[ "$post_links" -gt 0 ]]; then
    pass "llms-full.txt has $post_links post links"
  else
    fail "llms-full.txt has no post links"
  fi
fi

# ═══════════════════════════════════════════
# 9. Front Matter Completeness
# ═══════════════════════════════════════════
section "Front Matter (Posts)"

required_fields=("layout" "title" "date" "categories" "tags" "description" "lang" "ref")
fm_failures=0

for post_file in _posts/*.md; do
  [[ -f "$post_file" ]] || continue
  post_basename=$(basename "$post_file")
  for field in "${required_fields[@]}"; do
    if ! grep -q "^${field}:" "$post_file"; then
      fail "$post_basename missing field: $field"
      ((fm_failures++))
    fi
  done
done

if [[ "$fm_failures" -eq 0 ]]; then
  post_count=$(ls -1 _posts/*.md 2>/dev/null | wc -l | tr -d ' ')
  pass "All $post_count posts have required front matter"
fi

# ═══════════════════════════════════════════
# 10. Accessibility Basics
# ═══════════════════════════════════════════
section "Accessibility"

# Skip-to-content link
if grep -q 'skip-link\|skip.*content' "$SITE_DIR/index.html"; then
  pass "Skip-to-content link on homepage"
else
  fail "Skip-to-content link missing"
fi

# Main landmark
if grep -q '<main' "$SITE_DIR/index.html"; then
  pass "Main landmark on homepage"
else
  fail "Main landmark missing"
fi

# lang attribute on html
if grep -q '<html lang=' "$SITE_DIR/index.html"; then
  pass "lang attribute on <html>"
else
  fail "lang attribute missing on <html>"
fi

# ═══════════════════════════════════════════
# 11. Dark Mode
# ═══════════════════════════════════════════
section "Dark Mode"

if grep -q 'theme-toggle' "$SITE_DIR/index.html"; then
  pass "Theme toggle button present"
else
  fail "Theme toggle missing"
fi

if grep -q "localStorage.*theme" "$SITE_DIR/index.html"; then
  pass "Theme persistence via localStorage"
else
  fail "Theme persistence missing"
fi

# ═══════════════════════════════════════════
# 12. CSS Output
# ═══════════════════════════════════════════
section "CSS"

if [[ -f "$SITE_DIR/assets/css/tailwind.css" ]]; then
  pass "Tailwind CSS built"
else
  fail "Tailwind CSS missing"
fi

if [[ -f "$SITE_DIR/assets/css/style.css" ]]; then
  css_size=$(wc -c < "$SITE_DIR/assets/css/style.css" | tr -d ' ')
  pass "Custom CSS present (${css_size} bytes)"
else
  fail "Custom CSS missing"
fi

# ═══════════════════════════════════════════
# Summary
# ═══════════════════════════════════════════
printf "\n══════════════════════════════════════\n"
printf "Results: %d passed, %d failed (of %d checks)\n" "$PASS" "$FAIL" "$TOTAL"
printf "══════════════════════════════════════\n"

if [[ "$FAIL" -gt 0 ]]; then
  exit 1
else
  printf "All checks passed! ✅\n"
  exit 0
fi

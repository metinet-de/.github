#!/usr/bin/env bash

set -euo pipefail

: "${CLOUDFLARE_API_TOKEN:?Set CLOUDFLARE_API_TOKEN before running this script.}"

DOMAIN="${1:-metinet.de}"
ZONE_ID="${CLOUDFLARE_ZONE_ID:-0a8f7ac6a6e3680fa631907ba9668a0f}"
API_BASE="https://api.cloudflare.com/client/v4"

auth_header=("-H" "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" "-H" "Content-Type: application/json")

www_record_id="$(curl -fsS "${auth_header[@]}" "${API_BASE}/zones/${ZONE_ID}/dns_records?name=www.${DOMAIN}" | jq -r '.result[0].id // empty')"
redirect_ruleset_id="$(curl -fsS "${auth_header[@]}" "${API_BASE}/zones/${ZONE_ID}/rulesets/phases/http_request_dynamic_redirect/entrypoint" | jq -r '.result.id // empty')"

echo "Zone ID: ${ZONE_ID}"
echo

if [[ -n "${www_record_id}" ]]; then
  echo "tofu import cloudflare_record.www ${ZONE_ID}/${www_record_id}"
else
  echo "# No existing www record found for www.${DOMAIN}. tofu apply will create cloudflare_record.www."
fi

if [[ -n "${redirect_ruleset_id}" ]]; then
  echo "tofu import cloudflare_ruleset.redirect_www_to_apex zones/${ZONE_ID}/${redirect_ruleset_id}"
else
  echo "# No existing dynamic redirect entrypoint ruleset found. tofu apply will create cloudflare_ruleset.redirect_www_to_apex."
fi
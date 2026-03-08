# Infrastructure Instructions

applyTo: "infra/**"

## OpenTofu

- Use OpenTofu commands (`tofu init`, `tofu fmt`, `tofu validate`, `tofu plan`) instead of Terraform unless the user explicitly asks otherwise.
- Keep provider versions pinned and commit `.terraform.lock.hcl`.
- Do not commit `.tfstate`, `.tfvars`, `.terraform/`, or secrets.

## Cloudflare

- Prefer `CLOUDFLARE_API_TOKEN` from the environment over checked-in credentials.
- Use data sources for pre-existing shared resources like the zone when full zone management is not intended.
- Be careful with `cloudflare_ruleset`: zone rulesets are authoritative per phase. Import existing rulesets before applying when a phase may already be configured.
- Keep the `www` record proxied if Cloudflare edge redirects need to terminate before origin routing.

## Repository Hygiene

- Infrastructure files under `infra/` must stay excluded from Jekyll output via `_config.yml`.
- Helper scripts may use `curl` and `jq`, but should require credentials through environment variables and fail fast when prerequisites are missing.
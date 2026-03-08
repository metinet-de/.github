variable "cloudflare_api_token" {
  description = "Optional Cloudflare API token. Leave null to use the CLOUDFLARE_API_TOKEN environment variable."
  type        = string
  sensitive   = true
  default     = null
}

variable "domain" {
  description = "Apex domain"
  type        = string
  default     = "metinet.de"
}

variable "zone_id" {
  description = "Cloudflare zone id for the managed domain"
  type        = string
  default     = "0a8f7ac6a6e3680fa631907ba9668a0f"
}

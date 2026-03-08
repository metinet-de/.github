resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  ttl     = 1
  type    = "A"
  content = "5.75.228.131"
  proxied = true
}

resource "cloudflare_ruleset" "redirect_www_to_apex" {
  zone_id     = var.zone_id
  name        = "default"
  description = ""
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    ref         = "redirect_www_to_apex"
    description = "Redirect www.metinet.de to metinet.de"
    expression  = format("http.host eq \"www.%s\"", var.domain)
    action      = "redirect"

    action_parameters {
      from_value {
        status_code           = 301
        preserve_query_string = true

        target_url {
          expression = format("concat(\"https://%s\", http.request.uri.path)", var.domain)
        }
      }
    }
  }

  rules {
    ref         = "61f51bd6dbf849d1abe1a2a261ee0188"
    description = "Redirect from HTTP to HTTPS [Template]"
    expression  = "(http.request.full_uri wildcard r\"http://*\")"
    action      = "redirect"

    action_parameters {
      from_value {
        status_code           = 301
        preserve_query_string = false

        target_url {
          expression = "wildcard_replace(http.request.full_uri, r\"http://*\", r\"https://$${1}\")"
        }
      }
    }
  }
}
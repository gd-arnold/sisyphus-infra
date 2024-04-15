resource "cloudflare_record" "dns_record" {
  zone_id = var.zone_id
  name    = var.name
  content = var.content
  type    = var.type
  ttl     = var.ttl
  proxied = var.proxied
}

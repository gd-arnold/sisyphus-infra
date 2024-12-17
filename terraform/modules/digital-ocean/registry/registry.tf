resource "digitalocean_container_registry" "this" {
  name                   = "${var.name_prefix}-registry"
  subscription_tier_slug = var.subscription_tier
  region                 = var.region
}

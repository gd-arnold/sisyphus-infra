resource "digitalocean_kubernetes_cluster" "this" {
  name    = "${var.name_prefix}-cluster"
  region  = var.region
  version = "latest"

  node_pool {
    name       = "${var.name_prefix}-node-pool"
    size       = var.node_size
    node_count = var.node_count
  }

  registry_integration = true
}

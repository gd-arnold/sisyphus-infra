resource "digitalocean_database_cluster" "this" {
  name       = "${var.name_prefix}-pg-cluster"
  engine     = var.db_engine
  version    = var.db_version
  size       = var.db_size
  region     = var.region
  node_count = var.node_count

  maintenance_window {
    day  = "saturday"
    hour = "00:00" # UTC time
  }
}

resource "digitalocean_database_firewall" "this" {
  cluster_id = digitalocean_database_cluster.this.id

  rule {
    type  = "ip_addr"
    value = var.client_ip_addr
  }

  rule {
    type  = "k8s"
    value = var.k8s_cluster_id
  }
}

resource "digitalocean_database_db" "this" {
  cluster_id = digitalocean_database_cluster.this.id
  name       = "${var.name_prefix}-db"
}

resource "digitalocean_database_connection_pool" "this" {
  cluster_id = digitalocean_database_cluster.this.id
  name       = "${var.name_prefix}-pool"
  mode       = var.pool_mode
  size       = var.pool_size
  db_name    = digitalocean_database_db.this.name
  user       = var.db_user
}

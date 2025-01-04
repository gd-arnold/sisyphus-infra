output "db_connection_details" {
  value = {
    host     = digitalocean_database_cluster.this.host
    port     = digitalocean_database_cluster.this.port
    database = digitalocean_database_db.this.name
    pool_id  = digitalocean_database_connection_pool.this.id
  }

  sensitive = true
}

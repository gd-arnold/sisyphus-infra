output "registry_name" {
  value = digitalocean_container_registry.this.name
}

output "registry_id" {
  value = digitalocean_container_registry.this.id
}

output "registry_endpoint" {
  value = digitalocean_container_registry.this.endpoint
}

output "registry_server_url" {
  value = digitalocean_container_registry.this.endpoint
}

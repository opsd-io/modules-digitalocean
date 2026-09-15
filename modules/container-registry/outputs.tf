output "id" {
  description = "Container Registry ID"
  value       = digitalocean_container_registry.this.id
}

output "name" {
  description = "Container Registry name"
  value       = digitalocean_container_registry.this.name
}

output "endpoint" {
  description = "Container Registry endpoint"
  value       = digitalocean_container_registry.this.endpoint
}

output "server_url" {
  description = "Container Registry server URL"
  value       = digitalocean_container_registry.this.server_url
}

output "subscription_tier_slug" {
  description = "Registry subscription tier"
  value       = digitalocean_container_registry.this.subscription_tier_slug
}

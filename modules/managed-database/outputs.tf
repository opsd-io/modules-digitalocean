output "id" {
  description = "Database cluster ID"
  value       = digitalocean_database_cluster.this.id
}

output "urn" {
  description = "Database cluster URN"
  value       = digitalocean_database_cluster.this.urn
}

output "engine" {
  description = "Database engine"
  value       = digitalocean_database_cluster.this.engine
}

output "host" {
  description = "Public database host"
  value       = digitalocean_database_cluster.this.host
}

output "private_host" {
  description = "Private database host when private networking is enabled"
  value       = digitalocean_database_cluster.this.private_host
}

output "port" {
  description = "Database port"
  value       = digitalocean_database_cluster.this.port
}

output "database" {
  description = "Default database name"
  value       = digitalocean_database_cluster.this.database
}

output "user" {
  description = "Default user name"
  value       = digitalocean_database_cluster.this.user
}

output "password" {
  description = "Default user password"
  value       = digitalocean_database_cluster.this.password
  sensitive   = true
}

output "uri" {
  description = "Public connection URI"
  value       = digitalocean_database_cluster.this.uri
  sensitive   = true
}

output "private_uri" {
  description = "Private connection URI"
  value       = digitalocean_database_cluster.this.private_uri
  sensitive   = true
}

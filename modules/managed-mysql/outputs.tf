output "cluster_id" {
  description = "MySQL cluster ID"
  value       = module.cluster.id
}

output "cluster_urn" {
  description = "MySQL cluster URN"
  value       = module.cluster.urn
}

output "urn" {
  description = "MySQL cluster URN"
  value       = module.cluster.urn
}

output "host" {
  description = "Public MySQL host"
  value       = module.cluster.host
}

output "private_host" {
  description = "Private MySQL host"
  value       = module.cluster.private_host
}

output "port" {
  description = "MySQL port"
  value       = module.cluster.port
}

output "database_name" {
  description = "Application database name"
  value       = var.create_database ? digitalocean_database_db.app[0].name : null
}

output "app_user_name" {
  description = "Application user name"
  value       = var.create_app_user ? digitalocean_database_user.app[0].name : null
}

output "app_user_password" {
  description = "Application user password"
  value       = var.create_app_user ? digitalocean_database_user.app[0].password : null
  sensitive   = true
}

output "uri" {
  description = "Cluster URI"
  value       = module.cluster.uri
  sensitive   = true
}

output "private_uri" {
  description = "Cluster private URI"
  value       = module.cluster.private_uri
  sensitive   = true
}

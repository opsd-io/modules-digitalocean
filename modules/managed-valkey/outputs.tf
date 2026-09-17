output "cluster_id" {
  description = "Valkey cluster ID"
  value       = module.cluster.id
}

output "cluster_urn" {
  description = "Valkey cluster URN"
  value       = module.cluster.urn
}

output "urn" {
  description = "Valkey cluster URN"
  value       = module.cluster.urn
}

output "host" {
  description = "Public Valkey host"
  value       = module.cluster.host
}

output "private_host" {
  description = "Private Valkey host"
  value       = module.cluster.private_host
}

output "port" {
  description = "Valkey port"
  value       = module.cluster.port
}

output "password" {
  description = "Valkey password"
  value       = module.cluster.password
  sensitive   = true
}

output "uri" {
  description = "Valkey URI"
  value       = module.cluster.uri
  sensitive   = true
}

output "private_uri" {
  description = "Valkey private URI"
  value       = module.cluster.private_uri
  sensitive   = true
}

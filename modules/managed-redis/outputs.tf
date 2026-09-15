output "cluster_id" {
  description = "Redis cluster ID"
  value       = module.cluster.id
}

output "cluster_urn" {
  description = "Redis cluster URN"
  value       = module.cluster.urn
}

output "urn" {
  description = "Redis cluster URN"
  value       = module.cluster.urn
}

output "host" {
  description = "Public Redis host"
  value       = module.cluster.host
}

output "private_host" {
  description = "Private Redis host"
  value       = module.cluster.private_host
}

output "port" {
  description = "Redis port"
  value       = module.cluster.port
}

output "password" {
  description = "Redis password"
  value       = module.cluster.password
  sensitive   = true
}

output "uri" {
  description = "Redis URI"
  value       = module.cluster.uri
  sensitive   = true
}

output "private_uri" {
  description = "Redis private URI"
  value       = module.cluster.private_uri
  sensitive   = true
}

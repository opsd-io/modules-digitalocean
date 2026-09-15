output "bucket_id" {
  description = "Spaces bucket ID"
  value       = module.spaces.bucket_id
}

output "bucket_name" {
  description = "Spaces bucket name"
  value       = module.spaces.bucket_name
}

output "bucket_urn" {
  description = "Spaces bucket URN"
  value       = module.spaces.bucket_urn
}

output "urn" {
  description = "Spaces bucket URN"
  value       = module.spaces.bucket_urn
}

output "bucket_domain_name" {
  description = "Spaces bucket FQDN"
  value       = module.spaces.bucket_domain_name
}

output "bucket_endpoint" {
  description = "Spaces regional endpoint"
  value       = module.spaces.bucket_endpoint
}

output "cdn_id" {
  description = "CDN endpoint ID"
  value       = try(digitalocean_cdn.this[0].id, null)
}

output "cdn_endpoint" {
  description = "CDN endpoint FQDN"
  value       = try(digitalocean_cdn.this[0].endpoint, null)
}

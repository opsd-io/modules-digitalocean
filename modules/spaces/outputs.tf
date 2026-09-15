output "bucket_id" {
  description = "Spaces bucket ID"
  value       = digitalocean_spaces_bucket.this.id
}

output "bucket_name" {
  description = "Spaces bucket name"
  value       = digitalocean_spaces_bucket.this.name
}

output "bucket_urn" {
  description = "Spaces bucket URN"
  value       = digitalocean_spaces_bucket.this.urn
}

output "urn" {
  description = "Spaces bucket URN"
  value       = digitalocean_spaces_bucket.this.urn
}

output "bucket_domain_name" {
  description = "Spaces bucket FQDN"
  value       = digitalocean_spaces_bucket.this.bucket_domain_name
}

output "bucket_endpoint" {
  description = "Spaces regional endpoint"
  value       = digitalocean_spaces_bucket.this.endpoint
}

output "id" {
  description = "DigitalOcean domain ID"
  value       = digitalocean_domain.this.id
}

output "name" {
  description = "DNS zone domain name"
  value       = digitalocean_domain.this.name
}

output "urn" {
  description = "DNS zone URN"
  value       = digitalocean_domain.this.urn
}

output "ttl" {
  description = "Domain TTL"
  value       = digitalocean_domain.this.ttl
}

output "id" {
  description = "Droplet ID"
  value       = digitalocean_droplet.this.id
}

output "urn" {
  description = "Droplet URN"
  value       = digitalocean_droplet.this.urn
}

output "name" {
  description = "Droplet name"
  value       = digitalocean_droplet.this.name
}

output "ipv4_address" {
  description = "Public IPv4 address"
  value       = digitalocean_droplet.this.ipv4_address
}

output "ipv4_address_private" {
  description = "Private IPv4 address"
  value       = digitalocean_droplet.this.ipv4_address_private
}

output "ipv6_address" {
  description = "Public IPv6 address"
  value       = digitalocean_droplet.this.ipv6_address
}

output "region" {
  description = "Droplet region"
  value       = digitalocean_droplet.this.region
}

output "volume_ids" {
  description = "Attached volume IDs"
  value       = digitalocean_droplet.this.volume_ids
}

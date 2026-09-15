output "id" {
  description = "Reserved IP ID"
  value       = digitalocean_reserved_ip.this.id
}

output "ip_address" {
  description = "Reserved IPv4 address"
  value       = digitalocean_reserved_ip.this.ip_address
}

output "urn" {
  description = "Reserved IP URN"
  value       = digitalocean_reserved_ip.this.urn
}

output "region" {
  description = "Reserved IP region"
  value       = digitalocean_reserved_ip.this.region
}

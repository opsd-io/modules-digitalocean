output "id" {
  description = "VPC ID"
  value       = digitalocean_vpc.this.id
}

output "urn" {
  description = "VPC URN"
  value       = digitalocean_vpc.this.urn
}

output "name" {
  description = "VPC name"
  value       = digitalocean_vpc.this.name
}

output "region" {
  description = "VPC region"
  value       = digitalocean_vpc.this.region
}

output "ip_range" {
  description = "VPC CIDR range"
  value       = digitalocean_vpc.this.ip_range
}

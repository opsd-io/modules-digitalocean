output "id" {
  description = "Load balancer ID"
  value       = digitalocean_loadbalancer.this.id
}

output "urn" {
  description = "Load balancer URN"
  value       = digitalocean_loadbalancer.this.urn
}

output "name" {
  description = "Load balancer name"
  value       = digitalocean_loadbalancer.this.name
}

output "ip" {
  description = "Public IPv4 address"
  value       = digitalocean_loadbalancer.this.ip
}

output "ipv6" {
  description = "Public IPv6 address when dual stack is enabled"
  value       = digitalocean_loadbalancer.this.ipv6
}

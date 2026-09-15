output "id" {
  description = "Firewall ID"
  value       = digitalocean_firewall.this.id
}

output "name" {
  description = "Firewall name"
  value       = digitalocean_firewall.this.name
}

output "status" {
  description = "Firewall status"
  value       = digitalocean_firewall.this.status
}

output "droplet_ids" {
  description = "Droplet IDs attached to firewall"
  value       = digitalocean_firewall.this.droplet_ids
}

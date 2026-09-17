output "project_id" {
  description = "DigitalOcean project ID"
  value       = digitalocean_project_resources.this.project
}

output "resource_urns" {
  description = "DigitalOcean resource URNs assigned to the project"
  value       = digitalocean_project_resources.this.resources
}

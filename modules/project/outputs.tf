output "id" {
  description = "Project ID"
  value       = digitalocean_project.this.id
}

output "project_id" {
  description = "Project ID (explicit alias for downstream linking)"
  value       = digitalocean_project.this.id
}

output "name" {
  description = "Project name"
  value       = digitalocean_project.this.name
}

output "environment" {
  description = "Project environment"
  value       = digitalocean_project.this.environment
}

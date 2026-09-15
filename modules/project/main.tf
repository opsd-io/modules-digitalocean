resource "digitalocean_project" "this" {
  name        = var.name
  description = var.description
  purpose     = var.purpose
  environment = var.environment
  is_default  = var.is_default
  resources   = var.resource_urns
}

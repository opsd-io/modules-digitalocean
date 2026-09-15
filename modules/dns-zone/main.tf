resource "digitalocean_domain" "this" {
  name       = var.name
  ip_address = var.ip_address
}

locals {
  is_custom = var.type == "custom"
}

resource "digitalocean_certificate" "this" {
  name = var.name
  type = var.type

  domains           = local.is_custom ? null : var.domains
  private_key       = local.is_custom ? var.private_key : null
  leaf_certificate  = local.is_custom ? var.leaf_certificate : null
  certificate_chain = local.is_custom ? var.certificate_chain : null
}

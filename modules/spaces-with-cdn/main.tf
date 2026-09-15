module "spaces" {
  source = "../spaces"

  bucket_name        = var.bucket_name
  region             = var.region
  acl                = var.acl
  force_destroy      = var.force_destroy
  versioning_enabled = var.versioning_enabled
}

resource "digitalocean_cdn" "this" {
  count = var.enable_cdn ? 1 : 0

  origin           = module.spaces.bucket_domain_name
  ttl              = var.cdn_ttl
  custom_domain    = var.cdn_custom_domain
  certificate_name = var.cdn_certificate_name
}

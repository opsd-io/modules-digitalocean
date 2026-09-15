resource "digitalocean_spaces_bucket" "this" {
  name          = var.bucket_name
  region        = var.region
  acl           = var.acl
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning_enabled
  }
}

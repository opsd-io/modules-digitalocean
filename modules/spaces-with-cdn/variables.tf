variable "bucket_name" {
  description = "Unique Spaces bucket name"
  type        = string
}

variable "region" {
  description = "DigitalOcean Spaces region"
  type        = string
  default     = "fra1"
}

variable "acl" {
  description = "Bucket ACL"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "Destroy bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable Spaces bucket versioning"
  type        = bool
  default     = true
}

variable "enable_cdn" {
  description = "Create DigitalOcean CDN endpoint in front of the bucket"
  type        = bool
  default     = true
}

variable "cdn_ttl" {
  description = "CDN cache TTL in seconds"
  type        = number
  default     = 3600
}

variable "cdn_custom_domain" {
  description = "Optional custom domain for CDN endpoint"
  type        = string
  default     = null
}

variable "cdn_certificate_name" {
  description = "Optional managed certificate name for custom CDN domain"
  type        = string
  default     = null
}

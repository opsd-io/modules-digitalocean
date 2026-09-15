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

variable "terraform_destroy_protection" {
  description = "Terraform-level protection against accidental destroy"
  type        = bool
  default     = false
}

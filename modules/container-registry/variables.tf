variable "name" {
  description = "Container Registry name"
  type        = string
}

variable "subscription_tier_slug" {
  description = "Registry subscription tier (starter, basic, professional)"
  type        = string
  default     = "starter"
}

variable "region" {
  description = "Optional region for registry data"
  type        = string
  default     = null
}

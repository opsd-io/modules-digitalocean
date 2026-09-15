variable "name" {
  description = "VPC name"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "description" {
  description = "Optional VPC description"
  type        = string
  default     = null
}

variable "ip_range" {
  description = "Optional VPC CIDR range"
  type        = string
  default     = null
}

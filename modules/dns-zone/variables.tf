variable "name" {
  description = "DNS zone domain name (for example: example.com)"
  type        = string
}

variable "ip_address" {
  description = "Optional apex A record target added by DigitalOcean when creating domain"
  type        = string
  default     = null
}

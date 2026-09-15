variable "domain" {
  description = "DigitalOcean DNS zone domain (for example: example.com)"
  type        = string
}

variable "records" {
  description = "DNS records to create in the zone"
  type = map(object({
    type     = string
    name     = string
    value    = string
    ttl      = optional(number)
    priority = optional(number)
    port     = optional(number)
    weight   = optional(number)
    flags    = optional(number)
    tag      = optional(string)
  }))
}

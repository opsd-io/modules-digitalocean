variable "name" {
  description = "Certificate name"
  type        = string
}

variable "type" {
  description = "Certificate type: lets_encrypt or custom"
  type        = string
  default     = "lets_encrypt"
}

variable "domains" {
  description = "Domains for a managed Let's Encrypt certificate"
  type        = list(string)
  default     = []
}

variable "private_key" {
  description = "Private key for custom certificate"
  type        = string
  default     = null
  sensitive   = true
}

variable "leaf_certificate" {
  description = "Leaf certificate for custom certificate"
  type        = string
  default     = null
}

variable "certificate_chain" {
  description = "Optional certificate chain for custom certificate"
  type        = string
  default     = null
}

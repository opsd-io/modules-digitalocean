variable "name" {
  description = "Firewall name"
  type        = string
}

variable "droplet_ids" {
  description = "Droplet IDs covered by firewall"
  type        = set(number)
  default     = []
}

variable "tags" {
  description = "Tag targets covered by firewall"
  type        = set(string)
  default     = []
}

variable "inbound_rules" {
  description = "Inbound rules"
  type = list(object({
    protocol                  = string
    port_range                = optional(string)
    source_addresses          = optional(set(string))
    source_droplet_ids        = optional(set(number))
    source_kubernetes_ids     = optional(set(string))
    source_load_balancer_uids = optional(set(string))
    source_tags               = optional(set(string))
  }))
  default = []
}

variable "outbound_rules" {
  description = "Outbound rules"
  type = list(object({
    protocol                       = string
    port_range                     = optional(string)
    destination_addresses          = optional(set(string))
    destination_droplet_ids        = optional(set(number))
    destination_kubernetes_ids     = optional(set(string))
    destination_load_balancer_uids = optional(set(string))
    destination_tags               = optional(set(string))
  }))
  default = []
}

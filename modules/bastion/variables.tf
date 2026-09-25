variable "name" {
  description = "Bastion droplet name"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "size" {
  description = "Bastion droplet size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "Bastion droplet image"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "vpc_uuid" {
  description = "VPC UUID for the bastion"
  type        = string
}

variable "tags" {
  description = "Bastion droplet tags"
  type        = set(string)
  default     = []
}

variable "digitalocean_keys" {
  description = "DigitalOcean SSH key references with optional descriptions"
  type = list(object({
    ref         = string
    description = optional(string)
  }))
  default = []
}

variable "authorized_keys" {
  description = "Additional public keys installed for the bastion user"
  type = list(object({
    key         = string
    description = optional(string)
  }))
  default = []
}

variable "cloudinit_user" {
  description = "Non-root bastion operator user"
  type        = string
  default     = "bastion"
}

variable "motd" {
  description = "Message displayed on bastion login"
  type        = string
  default     = "OPSd bastion. Kubernetes credentials are not stored on this host."
}

variable "ssh_allowed_cidrs" {
  description = "CIDRs allowed to connect to SSH"
  type        = set(string)
  default     = []
}

variable "outbound_rules" {
  description = "Restricted outbound firewall rules"
  type = list(object({
    protocol              = string
    port_range            = optional(string)
    destination_addresses = optional(set(string))
  }))
  default = []
}

variable "monitoring" {
  description = "Enable DigitalOcean monitoring"
  type        = bool
  default     = true
}

variable "backups" {
  description = "Enable droplet backups"
  type        = bool
  default     = true
}

variable "droplet_agent" {
  description = "Enable the DigitalOcean droplet agent"
  type        = bool
  default     = true
}

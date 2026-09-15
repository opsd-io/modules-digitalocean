variable "name" {
  description = "Droplet name"
  type        = string
}

variable "region" {
  description = "Droplet region"
  type        = string
  default     = "fra1"
}

variable "size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "Droplet image slug"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "ssh_keys" {
  description = "SSH key fingerprints or IDs"
  type        = set(string)
}

variable "volume_ids" {
  description = "Additional volume IDs attached to droplet"
  type        = set(string)
  default     = []
}

variable "user_data" {
  description = "Raw cloud-init user data. If set, generated cloud-init SSH config is ignored."
  type        = string
  default     = null
}

variable "cloudinit_ssh_authorized_keys" {
  description = "SSH public keys installed through generated cloud-init user config"
  type        = list(string)
  default     = []
}

variable "cloudinit_user" {
  description = "Provisioning user created by generated cloud-init"
  type        = string
  default     = "opsd"
}

variable "cloudinit_user_groups" {
  description = "User groups for provisioning user in generated cloud-init"
  type        = list(string)
  default     = ["sudo"]
}

variable "cloudinit_user_shell" {
  description = "Login shell for provisioning user in generated cloud-init"
  type        = string
  default     = "/bin/bash"
}

variable "cloudinit_user_sudo" {
  description = "Sudo policy for provisioning user in generated cloud-init"
  type        = string
  default     = "ALL=(ALL) NOPASSWD:ALL"
}

variable "cloudinit_user_lock_passwd" {
  description = "Whether to lock password login for provisioning user in generated cloud-init"
  type        = bool
  default     = true
}

variable "vpc_uuid" {
  description = "Optional VPC UUID"
  type        = string
  default     = null
}

variable "tags" {
  description = "Droplet tags"
  type        = set(string)
  default     = []
}

variable "ipv6" {
  description = "Enable IPv6"
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "Enable DigitalOcean monitoring agent"
  type        = bool
  default     = true
}

variable "backups" {
  description = "Enable DigitalOcean backups"
  type        = bool
  default     = true
}

variable "droplet_agent" {
  description = "Enable Droplet agent"
  type        = bool
  default     = true
}

variable "graceful_shutdown" {
  description = "Enable graceful shutdown on destroy"
  type        = bool
  default     = false
}

variable "resize_disk" {
  description = "Resize disk when resizing droplet"
  type        = bool
  default     = true
}

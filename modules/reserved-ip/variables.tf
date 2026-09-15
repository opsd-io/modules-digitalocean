variable "region" {
  description = "Region where Reserved IP is allocated"
  type        = string
}

variable "droplet_id" {
  description = "Droplet ID to assign Reserved IP to"
  type        = number
  default     = null
}

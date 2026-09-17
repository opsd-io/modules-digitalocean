variable "project_id" {
  description = "DigitalOcean project ID"
  type        = string
}

variable "resource_urns" {
  description = "DigitalOcean resource URNs to assign to the project"
  type        = list(string)
}

variable "digitalocean_token" {
  description = "DigitalOcean API token used to verify resource visibility"
  type        = string
  sensitive   = true
}

variable "timeout_seconds" {
  description = "Maximum time to wait for resources to become visible"
  type        = number
  default     = 600
}

variable "poll_interval_seconds" {
  description = "Seconds between resource visibility checks"
  type        = number
  default     = 15
}

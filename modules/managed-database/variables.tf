variable "name" {
  description = "Database cluster name"
  type        = string
}

variable "engine" {
  description = "Database engine (pg, mysql, redis, kafka, opensearch, valkey)"
  type        = string
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = null
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "size" {
  description = "Cluster node size slug"
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 1
}

variable "private_network_uuid" {
  description = "Optional VPC UUID for private networking"
  type        = string
  default     = null
}

variable "project_id" {
  description = "Optional project ID to attach cluster during creation"
  type        = string
  default     = null
}

variable "tags" {
  description = "Cluster tags"
  type        = set(string)
  default     = []
}

variable "maintenance_window_day" {
  description = "Optional maintenance day (monday..sunday)"
  type        = string
  default     = null
}

variable "maintenance_window_hour" {
  description = "Optional maintenance hour in UTC (HH:MM:SS)"
  type        = string
  default     = null
}

variable "backup_restore" {
  description = "Optional backup restore options"
  type = object({
    database_name     = string
    backup_created_at = optional(string)
  })
  default = null
}

variable "firewall_rules" {
  description = "Firewall rules for the database cluster"
  type = set(object({
    type  = string
    value = string
  }))
  default = []
}

variable "eviction_policy" {
  description = "Optional eviction policy for Redis/Valkey engines"
  type        = string
  default     = null
}

variable "terraform_destroy_protection" {
  description = "Terraform-level protection against accidental destroy"
  type        = bool
  default     = false
}

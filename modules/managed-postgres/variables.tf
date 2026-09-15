variable "name" {
  description = "PostgreSQL cluster name"
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "16"
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
  description = "Number of nodes in the PostgreSQL cluster"
  type        = number
  default     = 1
}

variable "private_network_uuid" {
  description = "Optional VPC UUID"
  type        = string
  default     = null
}

variable "project_id" {
  description = "Optional project ID"
  type        = string
  default     = null
}

variable "tags" {
  description = "Cluster tags"
  type        = set(string)
  default     = []
}

variable "maintenance_window_day" {
  description = "Optional maintenance day"
  type        = string
  default     = null
}

variable "maintenance_window_hour" {
  description = "Optional maintenance hour in UTC"
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
  description = "Firewall rules for the PostgreSQL cluster"
  type = set(object({
    type  = string
    value = string
  }))
  default = []
}

variable "database_name" {
  description = "Application database name"
  type        = string
  default     = "app"
}

variable "create_database" {
  description = "Create application database"
  type        = bool
  default     = true
}

variable "app_user_name" {
  description = "Application user name"
  type        = string
  default     = "app"
}

variable "create_app_user" {
  description = "Create application user"
  type        = bool
  default     = true
}

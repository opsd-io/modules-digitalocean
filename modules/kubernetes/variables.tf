variable "name" {
  description = "Kubernetes cluster name"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version slug or latest"
  type        = string
  default     = "latest"
}

variable "vpc_uuid" {
  description = "Optional VPC UUID for the cluster"
  type        = string
  default     = null
}

variable "tags" {
  description = "Cluster tags"
  type        = set(string)
  default     = []
}

variable "auto_upgrade" {
  description = "Enable automatic Kubernetes version upgrades"
  type        = bool
  default     = true
}

variable "surge_upgrade" {
  description = "Enable surge upgrades for node pools"
  type        = bool
  default     = true
}

variable "ha" {
  description = "Enable high availability control plane"
  type        = bool
  default     = false
}

variable "node_pool_name" {
  description = "Default node pool name"
  type        = string
  default     = "default"
}

variable "node_size" {
  description = "Default node pool size slug"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "node_count" {
  description = "Node count when autoscaling is disabled"
  type        = number
  default     = 1
}

variable "node_auto_scale" {
  description = "Enable autoscaling for the default node pool"
  type        = bool
  default     = false
}

variable "node_min_nodes" {
  description = "Minimum nodes when autoscaling is enabled"
  type        = number
  default     = 1
}

variable "node_max_nodes" {
  description = "Maximum nodes when autoscaling is enabled"
  type        = number
  default     = 3
}

variable "node_tags" {
  description = "Node pool tags"
  type        = set(string)
  default     = []
}

variable "node_labels" {
  description = "Node pool labels"
  type        = map(string)
  default     = {}
}

variable "maintenance_day" {
  description = "Optional maintenance day"
  type        = string
  default     = null
}

variable "maintenance_start_time" {
  description = "Optional maintenance start time (UTC, HH:MM)"
  type        = string
  default     = null
}

variable "maintenance_duration" {
  description = "Optional maintenance duration in hours"
  type        = string
  default     = null
}

variable "terraform_destroy_protection" {
  description = "Terraform-level protection against accidental destroy"
  type        = bool
  default     = false
}

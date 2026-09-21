variable "name" {
  description = "Project name"
  type        = string
}

variable "description" {
  description = "Project description"
  type        = string
}

variable "purpose" {
  description = "Project purpose (for example: Web Application, Service or API)"
  type        = string
}

variable "environment" {
  description = "Project environment (for example: Development, Staging, Production)"
  type        = string
}

variable "is_default" {
  description = "Whether this is the default DigitalOcean project"
  type        = bool
  default     = false
}

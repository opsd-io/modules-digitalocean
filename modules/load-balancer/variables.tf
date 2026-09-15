variable "name" {
  description = "Load balancer name"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "droplet_ids" {
  description = "Droplet IDs attached to the load balancer"
  type        = set(number)

  validation {
    condition     = length(var.droplet_ids) > 0
    error_message = "droplet_ids must include at least one droplet ID."
  }
}

variable "entry_protocol" {
  description = "Incoming protocol"
  type        = string
  default     = "http"

  validation {
    condition     = contains(["http", "https", "http2", "http3", "tcp", "udp"], lower(var.entry_protocol))
    error_message = "entry_protocol must be one of: http, https, http2, http3, tcp, udp."
  }
}

variable "entry_port" {
  description = "Incoming port"
  type        = number
  default     = 80
}

variable "forwarding_rules" {
  description = "Optional forwarding rules; when set these override the single-rule entry_* and target_* inputs"
  type = list(object({
    entry_protocol   = string
    entry_port       = number
    target_protocol  = string
    target_port      = number
    certificate_name = optional(string)
    tls_passthrough  = optional(bool)
  }))
  default = []

  validation {
    condition = alltrue([
      for rule in var.forwarding_rules :
      contains(["http", "https", "http2", "http3", "tcp", "udp"], lower(rule.entry_protocol))
      && contains(["http", "https", "http2", "http3", "tcp", "udp"], lower(rule.target_protocol))
      && (
        try(rule.tls_passthrough, false) == false ||
        contains(["https", "http2"], lower(rule.entry_protocol))
      )
    ])
    error_message = "forwarding_rules entry_protocol and target_protocol must be one of: http, https, http2, http3, tcp, udp, and tls_passthrough may only be used with https or http2 entry protocols."
  }
}

variable "target_protocol" {
  description = "Backend protocol"
  type        = string
  default     = "http"

  validation {
    condition     = contains(["http", "https", "http2", "http3", "tcp", "udp"], lower(var.target_protocol))
    error_message = "target_protocol must be one of: http, https, http2, http3, tcp, udp."
  }
}

variable "target_port" {
  description = "Backend port"
  type        = number
  default     = 80
}

variable "redirect_http_to_https" {
  description = "Redirect HTTP to HTTPS"
  type        = bool
  default     = false
}

variable "enable_proxy_protocol" {
  description = "Enable PROXY protocol"
  type        = bool
  default     = false
}

variable "enable_backend_keepalive" {
  description = "Enable backend keepalive"
  type        = bool
  default     = false
}

variable "algorithm" {
  description = "Load balancing algorithm"
  type        = string
  default     = null

  validation {
    condition     = var.algorithm == null || contains(["round_robin", "least_connections"], lower(var.algorithm))
    error_message = "algorithm must be one of: round_robin, least_connections."
  }
}

variable "http_idle_timeout_seconds" {
  description = "HTTP idle timeout in seconds"
  type        = number
  default     = null

  validation {
    condition     = var.http_idle_timeout_seconds == null || (var.http_idle_timeout_seconds >= 30 && var.http_idle_timeout_seconds <= 600)
    error_message = "http_idle_timeout_seconds must be between 30 and 600 seconds."
  }
}

variable "disable_lets_encrypt_dns_records" {
  description = "Disable automatic DNS record creation for Let's Encrypt certificates"
  type        = bool
  default     = null
}

variable "sticky_sessions" {
  description = "Optional sticky session configuration"
  type = object({
    type               = string
    cookie_name        = optional(string)
    cookie_ttl_seconds = optional(number)
  })
  default = null

  validation {
    condition = var.sticky_sessions == null || (
      contains(["cookies", "none"], lower(var.sticky_sessions.type)) &&
      (
        lower(var.sticky_sessions.type) != "cookies" ||
        (
          try(trimspace(var.sticky_sessions.cookie_name), "") != "" &&
          try(var.sticky_sessions.cookie_ttl_seconds, null) != null
        )
      )
    )
    error_message = "sticky_sessions must use type cookies or none; when type = cookies, cookie_name and cookie_ttl_seconds are required."
  }
}

variable "vpc_uuid" {
  description = "Optional VPC UUID"
  type        = string
  default     = null
}

variable "healthcheck_protocol" {
  description = "Healthcheck protocol"
  type        = string
  default     = "http"

  validation {
    condition     = contains(["http", "https", "tcp"], lower(var.healthcheck_protocol))
    error_message = "healthcheck_protocol must be one of: http, https, tcp."
  }
}

variable "healthcheck_port" {
  description = "Healthcheck port"
  type        = number
  default     = 80
}

variable "healthcheck_path" {
  description = "Healthcheck path (used for HTTP/HTTPS)"
  type        = string
  default     = "/"
}

variable "healthcheck_check_interval_seconds" {
  description = "Healthcheck interval"
  type        = number
  default     = 10
}

variable "healthcheck_response_timeout_seconds" {
  description = "Healthcheck timeout"
  type        = number
  default     = 5
}

variable "healthcheck_healthy_threshold" {
  description = "Healthy threshold"
  type        = number
  default     = 5
}

variable "healthcheck_unhealthy_threshold" {
  description = "Unhealthy threshold"
  type        = number
  default     = 3
}

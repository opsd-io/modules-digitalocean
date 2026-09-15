locals {
  forwarding_rules_effective = length(var.forwarding_rules) > 0 ? var.forwarding_rules : [
    {
      entry_protocol  = var.entry_protocol
      entry_port      = var.entry_port
      target_protocol = var.target_protocol
      target_port     = var.target_port
    }
  ]
}

resource "digitalocean_loadbalancer" "this" {
  name     = var.name
  region   = var.region
  vpc_uuid = var.vpc_uuid

  droplet_ids = var.droplet_ids

  algorithm                        = var.algorithm
  http_idle_timeout_seconds        = var.http_idle_timeout_seconds
  disable_lets_encrypt_dns_records = var.disable_lets_encrypt_dns_records
  redirect_http_to_https           = var.redirect_http_to_https
  enable_proxy_protocol            = var.enable_proxy_protocol
  enable_backend_keepalive         = var.enable_backend_keepalive

  dynamic "forwarding_rule" {
    for_each = local.forwarding_rules_effective

    content {
      entry_protocol   = forwarding_rule.value.entry_protocol
      entry_port       = forwarding_rule.value.entry_port
      target_protocol  = forwarding_rule.value.target_protocol
      target_port      = forwarding_rule.value.target_port
      certificate_name = try(forwarding_rule.value.certificate_name, null)
      tls_passthrough  = try(forwarding_rule.value.tls_passthrough, null)
    }
  }

  dynamic "sticky_sessions" {
    for_each = var.sticky_sessions == null ? [] : [var.sticky_sessions]
    content {
      type               = sticky_sessions.value.type
      cookie_name        = try(sticky_sessions.value.cookie_name, null)
      cookie_ttl_seconds = try(sticky_sessions.value.cookie_ttl_seconds, null)
    }
  }

  healthcheck {
    protocol                 = var.healthcheck_protocol
    port                     = var.healthcheck_port
    path                     = var.healthcheck_path
    check_interval_seconds   = var.healthcheck_check_interval_seconds
    response_timeout_seconds = var.healthcheck_response_timeout_seconds
    healthy_threshold        = var.healthcheck_healthy_threshold
    unhealthy_threshold      = var.healthcheck_unhealthy_threshold
  }
}

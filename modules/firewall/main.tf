locals {
  normalized_inbound_rules = [
    for rule in var.inbound_rules : {
      protocol                  = rule.protocol
      port_range                = try(rule.port_range, null)
      source_addresses          = coalesce(try(rule.source_addresses, null), toset([]))
      source_droplet_ids        = coalesce(try(rule.source_droplet_ids, null), toset([]))
      source_kubernetes_ids     = coalesce(try(rule.source_kubernetes_ids, null), toset([]))
      source_load_balancer_uids = coalesce(try(rule.source_load_balancer_uids, null), toset([]))
      source_tags               = coalesce(try(rule.source_tags, null), toset([]))
    }
  ]

  normalized_outbound_rules = [
    for rule in var.outbound_rules : {
      protocol                       = rule.protocol
      port_range                     = try(rule.port_range, null)
      destination_addresses          = coalesce(try(rule.destination_addresses, null), toset([]))
      destination_droplet_ids        = coalesce(try(rule.destination_droplet_ids, null), toset([]))
      destination_kubernetes_ids     = coalesce(try(rule.destination_kubernetes_ids, null), toset([]))
      destination_load_balancer_uids = coalesce(try(rule.destination_load_balancer_uids, null), toset([]))
      destination_tags               = coalesce(try(rule.destination_tags, null), toset([]))
    }
  ]
}

resource "digitalocean_firewall" "this" {
  name        = var.name
  droplet_ids = var.droplet_ids
  tags        = var.tags

  dynamic "inbound_rule" {
    for_each = local.normalized_inbound_rules
    content {
      protocol                  = inbound_rule.value.protocol
      port_range                = inbound_rule.value.port_range
      source_addresses          = inbound_rule.value.source_addresses
      source_droplet_ids        = inbound_rule.value.source_droplet_ids
      source_kubernetes_ids     = inbound_rule.value.source_kubernetes_ids
      source_load_balancer_uids = inbound_rule.value.source_load_balancer_uids
      source_tags               = inbound_rule.value.source_tags
    }
  }

  dynamic "outbound_rule" {
    for_each = local.normalized_outbound_rules
    content {
      protocol                       = outbound_rule.value.protocol
      port_range                     = outbound_rule.value.port_range
      destination_addresses          = outbound_rule.value.destination_addresses
      destination_droplet_ids        = outbound_rule.value.destination_droplet_ids
      destination_kubernetes_ids     = outbound_rule.value.destination_kubernetes_ids
      destination_load_balancer_uids = outbound_rule.value.destination_load_balancer_uids
      destination_tags               = outbound_rule.value.destination_tags
    }
  }
}

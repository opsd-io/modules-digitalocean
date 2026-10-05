resource "digitalocean_kubernetes_cluster" "this" {
  name           = var.name
  region         = var.region
  version        = var.kubernetes_version
  vpc_uuid       = var.vpc_uuid
  cluster_subnet = var.cluster_subnet
  service_subnet = var.service_subnet
  tags           = var.tags
  auto_upgrade   = var.auto_upgrade
  surge_upgrade  = var.surge_upgrade
  ha             = var.ha

  lifecycle {
    precondition {
      condition     = (var.cluster_subnet == null) == (var.service_subnet == null)
      error_message = "cluster_subnet and service_subnet must either both be set or both be null."
    }
  }

  dynamic "control_plane_firewall" {
    for_each = var.control_plane_firewall_enabled ? [true] : []
    content {
      enabled           = true
      allowed_addresses = var.control_plane_firewall_allowed_addresses
    }
  }

  node_pool {
    name       = var.node_pool_name
    size       = var.node_size
    auto_scale = var.node_auto_scale
    node_count = var.node_auto_scale ? null : var.node_count
    min_nodes  = var.node_auto_scale ? var.node_min_nodes : null
    max_nodes  = var.node_auto_scale ? var.node_max_nodes : null
    tags       = var.node_tags
    labels     = var.node_labels
  }

  dynamic "maintenance_policy" {
    for_each = var.maintenance_day != null && var.maintenance_start_time != null ? [1] : []
    content {
      day        = var.maintenance_day
      start_time = var.maintenance_start_time
      duration   = var.maintenance_duration
    }
  }
}

resource "digitalocean_database_cluster" "this" {
  name    = var.name
  engine  = var.engine
  version = var.engine_version
  region  = var.region
  size    = var.size

  node_count           = var.node_count
  private_network_uuid = var.private_network_uuid
  project_id           = var.project_id
  tags                 = var.tags
  eviction_policy      = var.eviction_policy

  dynamic "maintenance_window" {
    for_each = var.maintenance_window_day != null && var.maintenance_window_hour != null ? [1] : []
    content {
      day  = var.maintenance_window_day
      hour = var.maintenance_window_hour
    }
  }

  dynamic "backup_restore" {
    for_each = var.backup_restore == null ? [] : [var.backup_restore]
    content {
      database_name     = backup_restore.value.database_name
      backup_created_at = try(backup_restore.value.backup_created_at, null)
    }
  }
}

resource "digitalocean_database_firewall" "this" {
  count      = length(var.firewall_rules) > 0 ? 1 : 0
  cluster_id = digitalocean_database_cluster.this.id

  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      type  = rule.value.type
      value = rule.value.value
    }
  }
}

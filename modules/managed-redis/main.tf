module "cluster" {
  source = "../managed-database"

  name                 = var.name
  engine               = "redis"
  engine_version       = var.redis_version
  region               = var.region
  size                 = var.size
  node_count           = var.node_count
  private_network_uuid = var.private_network_uuid
  project_id           = var.project_id
  tags                 = var.tags

  maintenance_window_day  = var.maintenance_window_day
  maintenance_window_hour = var.maintenance_window_hour
  backup_restore          = var.backup_restore
  firewall_rules          = var.firewall_rules
  eviction_policy         = var.eviction_policy
}

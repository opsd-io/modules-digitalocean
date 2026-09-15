module "cluster" {
  source = "../managed-database"

  name                 = var.name
  engine               = "pg"
  engine_version       = var.postgres_version
  region               = var.region
  size                 = var.size
  node_count           = var.node_count
  private_network_uuid = var.private_network_uuid
  project_id           = var.project_id
  tags                 = var.tags

  maintenance_window_day       = var.maintenance_window_day
  maintenance_window_hour      = var.maintenance_window_hour
  backup_restore               = var.backup_restore
  firewall_rules               = var.firewall_rules
  terraform_destroy_protection = var.terraform_destroy_protection
}

resource "digitalocean_database_db" "app" {
  count = var.create_database ? 1 : 0

  cluster_id = module.cluster.id
  name       = var.database_name
}

resource "digitalocean_database_user" "app" {
  count = var.create_app_user ? 1 : 0

  cluster_id = module.cluster.id
  name       = var.app_user_name
}

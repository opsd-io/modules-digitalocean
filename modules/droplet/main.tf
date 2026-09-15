locals {
  generated_cloudinit_user_data = length(coalesce(var.cloudinit_ssh_authorized_keys, [])) > 0 ? join("", [
    "#cloud-config\n",
    yamlencode({
      users = [
        {
          name                = var.cloudinit_user
          groups              = var.cloudinit_user_groups
          shell               = var.cloudinit_user_shell
          sudo                = var.cloudinit_user_sudo
          lock_passwd         = var.cloudinit_user_lock_passwd
          ssh_authorized_keys = coalesce(var.cloudinit_ssh_authorized_keys, [])
        }
      ]
    })
  ]) : null

  effective_user_data = var.user_data != null ? var.user_data : local.generated_cloudinit_user_data
}

resource "digitalocean_droplet" "this" {
  name              = var.name
  region            = var.region
  size              = var.size
  image             = var.image
  ssh_keys          = var.ssh_keys
  volume_ids        = var.volume_ids
  user_data         = local.effective_user_data
  vpc_uuid          = var.vpc_uuid
  tags              = var.tags
  ipv6              = var.ipv6
  monitoring        = var.monitoring
  backups           = var.backups
  droplet_agent     = var.droplet_agent
  graceful_shutdown = var.graceful_shutdown
  resize_disk       = var.resize_disk
}

data "digitalocean_ssh_keys" "account" {}

locals {
  digitalocean_key_references = [for key in var.digitalocean_keys : key.ref]
  digitalocean_public_keys = flatten([
    for reference in local.digitalocean_key_references : [
      for key in data.digitalocean_ssh_keys.account.ssh_keys : key.public_key
      if contains([key.id, key.name, key.fingerprint], reference)
    ]
  ])
  authorized_public_keys = concat(
    local.digitalocean_public_keys,
    [for key in var.authorized_keys : key.key]
  )
  cloudinit_user_data = join("", [
    "#cloud-config\n",
    yamlencode({
      packages = ["openssh-server"]
      bootcmd  = [["install", "-d", "-o", "root", "-g", "root", "-m", "0755", "/etc/ssh/authorized_keys"]]
      runcmd = [
        ["sshd", "-t"],
        ["systemctl", "enable", "ssh"],
        ["systemctl", "restart", "ssh"]
      ]
      users = [
        {
          name        = var.cloudinit_user
          groups      = ["sudo"]
          shell       = "/bin/bash"
          sudo        = "ALL=(ALL) NOPASSWD:ALL"
          lock_passwd = true
        }
      ]
      write_files = [
        {
          path        = "/etc/ssh/sshd_config.d/00-opsd-bastion.conf"
          owner       = "root:root"
          permissions = "0644"
          content     = <<-SSHD
            PermitRootLogin no
            PasswordAuthentication no
            KbdInteractiveAuthentication no
            PubkeyAuthentication yes
            AuthorizedKeysFile /etc/ssh/authorized_keys/%u
            AllowUsers ${var.cloudinit_user}
            X11Forwarding no
            AllowAgentForwarding no
            AllowTcpForwarding local
            GatewayPorts no
            PermitTunnel no
            UsePAM yes
          SSHD
        },
        {
          path        = "/etc/ssh/authorized_keys/${var.cloudinit_user}"
          owner       = "root:root"
          permissions = "0644"
          content     = format("%s\n", join("\n", local.authorized_public_keys))
        },
        {
          path        = "/etc/motd"
          owner       = "root:root"
          permissions = "0644"
          content     = var.motd
        }
      ]
    })
  ])
}

module "droplet" {
  source = "../droplet"

  name          = var.name
  region        = var.region
  size          = var.size
  image         = var.image
  ssh_keys      = toset(local.digitalocean_key_references)
  vpc_uuid      = var.vpc_uuid
  tags          = var.tags
  user_data     = local.cloudinit_user_data
  monitoring    = var.monitoring
  backups       = var.backups
  droplet_agent = var.droplet_agent
}

module "reserved_ip" {
  source = "../reserved-ip"

  region     = var.region
  droplet_id = module.droplet.id
}

module "firewall" {
  source = "../firewall"

  name        = "${var.name}-firewall"
  droplet_ids = [module.droplet.id]
  inbound_rules = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = var.ssh_allowed_cidrs
    }
  ]
  outbound_rules = var.outbound_rules
}

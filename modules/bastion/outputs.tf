output "id" {
  description = "Bastion droplet ID"
  value       = module.droplet.id
}

output "urn" {
  description = "Bastion droplet URN"
  value       = module.droplet.urn
}

output "ip_address" {
  description = "Stable Reserved IP address"
  value       = module.reserved_ip.ip_address
}

output "user" {
  description = "Bastion operator user"
  value       = var.cloudinit_user
}

output "ssh_key_descriptions" {
  description = "Descriptions of configured DigitalOcean and inline public keys"
  value = concat(
    [for key in var.digitalocean_keys : {
      source      = "digitalocean"
      ref         = key.ref
      description = try(key.description, null)
    }],
    [for key in var.authorized_keys : {
      source      = "authorized_keys"
      ref         = null
      description = try(key.description, null)
    }]
  )
}

# droplet

Creates a single DigitalOcean Droplet VM.

Typical usage:
- baseline VM workloads
- single-node environments
- building block for multi-node and load-balanced blueprints

Key capabilities:
- attach additional block storage volumes (`volume_ids`)
- install SSH keys through generated cloud-init user configuration
- optionally enable Terraform-level destroy protection with `terraform_destroy_protection`

Cloud-init precedence:
- if `user_data` is set, module uses it directly
- otherwise, when `cloudinit_ssh_authorized_keys` is non-empty, module generates cloud-init for provisioning user

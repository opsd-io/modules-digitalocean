# firewall

Creates a DigitalOcean cloud firewall and attaches it to Droplets and/or tags.

## What this module manages

- `digitalocean_firewall`

## Key inputs

- `name` (required)
- `droplet_ids` (optional)
- `tags` (optional)
- `inbound_rules` (optional)
- `outbound_rules` (optional)

## Outputs

- `id`, `name`, `status`, `droplet_ids`

## Project attachment

- this module does not currently expose a project attachment path
- the underlying firewall resource is not wired in this repository through `project_id` or a standard `urn` output

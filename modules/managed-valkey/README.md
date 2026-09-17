# managed-valkey

Valkey wrapper over `managed-database`.

## What this module manages

- Valkey cluster via `managed-database`
- optional firewall rules (forwarded to core module)

## Key inputs

- `name` (required)
- `valkey_version` (default `7`)
- `region` (required)
- `size` (default `db-s-1vcpu-1gb`)
- `node_count`
- `firewall_rules` (optional)
- `private_network_uuid` (optional)
- `project_id` (optional)

## Outputs

- `cluster_id`, `cluster_urn`, `urn`
- `host`, `private_host`, `port`
- `password` (sensitive)
- `uri`, `private_uri` (sensitive)

## Project attachment

- supports direct assignment during creation through optional `project_id`
- also exposes `urn` for use with the `project` module `resource_urns` pattern

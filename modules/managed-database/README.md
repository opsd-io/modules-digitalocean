# managed-database

Engine-agnostic module for DigitalOcean managed database clusters.

## What this module manages

- `digitalocean_database_cluster`
- optional `digitalocean_database_firewall`

## Typical use cases

- single reusable base for PostgreSQL/MySQL/Redis wrappers
- centralizing DB cluster lifecycle and firewall model

## Key inputs

- `name` (required)
- `engine` (required) — for example `pg`, `mysql`, `redis`
- `engine_version` (optional)
- `region` (required)
- `size` (default `db-s-1vcpu-1gb`)
- `node_count`
- `private_network_uuid` (optional)
- `project_id` (optional)
- `firewall_rules` (optional)

## Outputs

- `id`, `urn`
- `engine`
- `host`, `private_host`, `port`
- `database`, `user`
- `password` (sensitive)
- `uri` (sensitive)
- `private_uri` (sensitive)

## Notes

- Prefer engine-specific wrappers (`managed-postgres`, `managed-mysql`, `managed-redis`) in scenarios.
- Use this module directly only when you intentionally need a generic engine switch.

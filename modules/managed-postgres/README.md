# managed-postgres

PostgreSQL wrapper over `managed-database`.

## What this module manages

- PostgreSQL cluster via `managed-database`
- optional app DB via `digitalocean_database_db`
- optional app user via `digitalocean_database_user`
- optional DB firewall rules (forwarded to core module)

## Key inputs

- `name` (required)
- `postgres_version` (default `16`)
- `region` (required)
- `size` (default `db-s-1vcpu-1gb`)
- `node_count`
- `database_name`, `create_database`
- `app_user_name`, `create_app_user`
- `firewall_rules` (optional)
- `private_network_uuid` (optional)
- `project_id` (optional)

## Outputs

- `cluster_id`, `cluster_urn`, `urn`
- `host`, `private_host`, `port`
- `database_name`
- `app_user_name`
- `app_user_password` (sensitive)
- `uri`, `private_uri` (sensitive)

## Project attachment

- supports direct assignment during creation through optional `project_id`
- also exposes `urn` for use with the `project` module `resource_urns` pattern

## Example

```hcl
module "postgres" {
  source = "../../modules/managed-postgres"

  name             = "opsd-pg"
  postgres_version = "16"
  region           = "fra1"

  database_name = "app"
  app_user_name = "app"

  firewall_rules = [
    { type = "ip_addr", value = "203.0.113.10" }
  ]
}
```

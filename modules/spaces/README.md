# spaces

Creates a DigitalOcean Spaces bucket without CDN.

Use this module when you only need object storage and want CDN concerns
handled separately.

## Outputs

- `bucket_id`, `bucket_name`
- `bucket_urn`, `urn`
- `bucket_domain_name`, `bucket_endpoint`

## Project attachment

- does not accept `project_id` directly
- exposes `urn` for attachment through the `project` module `resource_urns` pattern

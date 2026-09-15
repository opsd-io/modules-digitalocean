# spaces-with-cdn

Creates a DigitalOcean Spaces bucket with optional CDN endpoint.

This module wraps `modules/spaces` (bucket core) and adds CDN resources.

Typical usage:
- host static frontend assets
- expose content through DigitalOcean CDN
- attach bucket URN to project governance modules

## Outputs

- `bucket_id`, `bucket_name`
- `bucket_urn`, `urn`
- `bucket_domain_name`, `bucket_endpoint`
- `cdn_id`, `cdn_endpoint`

## Project attachment

- does not accept `project_id` directly
- exposes the bucket `urn` for attachment through the `project` module `resource_urns` pattern
- CDN endpoint attachment is not exposed separately by this module

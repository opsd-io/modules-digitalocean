# kubernetes

Creates a DigitalOcean Kubernetes cluster with a default node pool.

Typical usage:
- run containerized workloads on managed Kubernetes
- migrate from App Platform to Kubernetes while staying on DigitalOcean

The optional `control_plane_firewall_enabled` and
`control_plane_firewall_allowed_addresses` inputs restrict access to the DOKS
API endpoint to the supplied CIDR addresses.

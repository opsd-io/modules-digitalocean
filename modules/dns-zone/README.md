# dns-zone

Creates and manages a DigitalOcean DNS zone (domain).

Typical usage:
- bootstrap DNS zone as infrastructure code
- keep domain ownership in Terraform/OpenTofu state
- use with `modules/dns-record` for record management

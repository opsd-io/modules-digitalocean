# certificate

Creates a DigitalOcean certificate.

Supported modes:
- managed Let's Encrypt certificate (`type = "lets_encrypt"`)
- custom certificate upload (`type = "custom"`)

Typical usage:
- attach certificate by name to DigitalOcean CDN custom domain
- centralize certificate provisioning in Terraform modules

## Project attachment

- this module does not currently expose a project attachment path
- the underlying certificate resource is not wired in this repository through `project_id` or a standard `urn` output

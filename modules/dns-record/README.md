# dns-record

Creates DNS records inside an existing DigitalOcean DNS zone.

Typical usage:
- map application hostnames to CDN endpoints
- create TXT records for domain verification
- create MX/SRV records when needed

## Project attachment

- this module does not currently expose a project attachment path
- project-level attachment should happen at the DNS zone level through `modules/dns-zone`, not per-record

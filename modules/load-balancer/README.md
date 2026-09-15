# load-balancer

Creates a DigitalOcean Load Balancer and attaches Droplets.

## What this module manages

- `digitalocean_loadbalancer`

## Typical use cases

- stateless web/app tier behind one stable endpoint
- gradual scale-up from single Droplet to multiple Droplets

## Key inputs

- `name` (required)
- `region` (required)
- `droplet_ids` (required, non-empty set)
- `entry_protocol`, `entry_port`
- `target_protocol`, `target_port`
- `forwarding_rules` for multiple listeners on one balancer
- `certificate_name` and `tls_passthrough` on HTTPS forwarding rules
- `algorithm`
- `sticky_sessions`
- `http_idle_timeout_seconds`
- `disable_lets_encrypt_dns_records`
- `healthcheck_*`
- `redirect_http_to_https`
- `vpc_uuid` (optional)

## Outputs

- `id`
- `urn`
- `name`
- `ip`
- `ipv6`

## Example

```hcl
module "load_balancer" {
  source = "../../modules/load-balancer"

  name        = "opsd-lb"
  region      = "fra1"
  droplet_ids = toset([123456789, 123456790])

  entry_protocol  = "http"
  entry_port      = 80
  target_protocol = "http"
  target_port     = 8080

  healthcheck_protocol = "http"
  healthcheck_port     = 8080
  healthcheck_path     = "/healthz"
}
```

Multiple forwarding rules, including HTTPS termination and transport listeners:

```hcl
module "load_balancer" {
  source = "../../modules/load-balancer"

  name        = "opsd-lb"
  region      = "fra1"
  droplet_ids = toset([123456789, 123456790])

  forwarding_rules = [
    {
      entry_protocol = "http"
      entry_port     = 80
      target_protocol = "http"
      target_port    = 8080
    },
    {
      entry_protocol   = "https"
      entry_port       = 443
      target_protocol  = "http"
      target_port      = 8080
      certificate_name = "example-com"
    }
  ]

  sticky_sessions = {
    type               = "cookies"
    cookie_name        = "opsd"
    cookie_ttl_seconds = 300
  }

  http_idle_timeout_seconds = 60

  healthcheck_protocol = "http"
  healthcheck_port     = 8080
  healthcheck_path     = "/healthz"
}
```

TLS passthrough on a transport listener:

```hcl
module "load_balancer" {
  source = "../../modules/load-balancer"

  name        = "opsd-lb"
  region      = "fra1"
  droplet_ids = toset([123456789, 123456790])

  forwarding_rules = [
    {
      entry_protocol  = "https"
      entry_port      = 443
      target_protocol = "https"
      target_port     = 8443
      tls_passthrough = true
    },
    {
      entry_protocol  = "udp"
      entry_port      = 53
      target_protocol = "udp"
      target_port     = 53
    }
  ]

  healthcheck_protocol = "http"
  healthcheck_port     = 8080
  healthcheck_path     = "/healthz"
}
```

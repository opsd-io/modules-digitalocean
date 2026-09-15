# reserved-ip

Allocates a DigitalOcean Reserved IP and optionally assigns it to a droplet.

Typical usage:
- keep stable public endpoint independent from droplet lifecycle
- support failover/migration between droplets
- use DNS records against reserved IP instead of droplet ephemeral endpoint

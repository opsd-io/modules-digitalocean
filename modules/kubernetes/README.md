# kubernetes

Creates a DigitalOcean Kubernetes cluster with a default node pool.

Typical usage:
- run containerized workloads on managed Kubernetes
- migrate from App Platform to Kubernetes while staying on DigitalOcean

The optional `control_plane_firewall_enabled` and
`control_plane_firewall_allowed_addresses` inputs restrict access to the DOKS
API endpoint to the supplied CIDR addresses.

Set both `cluster_subnet` and `service_subnet` to create a VPC-native cluster.
They must be RFC 1918 CIDRs and must not overlap each other or any VPC or
VPC-native cluster subnet in the team. DOKS assigns each node a `/25` from the
cluster subnet and one IP per Kubernetes Service from the service subnet.
DigitalOcean recommends `/16` for the cluster subnet and `/19` for the service
subnet. These subnet ranges cannot be resized after cluster creation.
VPC-native networking is only available when creating a new cluster; it cannot
be enabled on an existing cluster.
See DigitalOcean's [VPC-native cluster guide](https://docs.digitalocean.com/products/kubernetes/how-to/create-clusters/)
for subnet requirements and sizing guidance.

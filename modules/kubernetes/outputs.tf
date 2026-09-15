output "id" {
  description = "Kubernetes cluster ID"
  value       = digitalocean_kubernetes_cluster.this.id
}

output "urn" {
  description = "Kubernetes cluster URN"
  value       = digitalocean_kubernetes_cluster.this.urn
}

output "name" {
  description = "Kubernetes cluster name"
  value       = digitalocean_kubernetes_cluster.this.name
}

output "endpoint" {
  description = "Kubernetes API endpoint"
  value       = digitalocean_kubernetes_cluster.this.endpoint
}

output "ipv4_address" {
  description = "Kubernetes control plane IPv4 address"
  value       = digitalocean_kubernetes_cluster.this.ipv4_address
}

output "status" {
  description = "Kubernetes cluster status"
  value       = digitalocean_kubernetes_cluster.this.status
}

output "version" {
  description = "Kubernetes cluster version"
  value       = digitalocean_kubernetes_cluster.this.version
}

output "cluster_subnet" {
  description = "Kubernetes cluster subnet"
  value       = digitalocean_kubernetes_cluster.this.cluster_subnet
}

output "service_subnet" {
  description = "Kubernetes services subnet"
  value       = digitalocean_kubernetes_cluster.this.service_subnet
}

output "kubeconfig_raw" {
  description = "Raw kubeconfig for cluster access"
  value       = try(digitalocean_kubernetes_cluster.this.kube_config[0].raw_config, null)
  sensitive   = true
}

output "node_pool_id" {
  description = "Default node pool ID"
  value       = try(digitalocean_kubernetes_cluster.this.node_pool[0].id, null)
}

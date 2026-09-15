output "id" {
  description = "Certificate ID"
  value       = digitalocean_certificate.this.id
}

output "name" {
  description = "Certificate name"
  value       = digitalocean_certificate.this.name
}

output "uuid" {
  description = "Certificate UUID"
  value       = digitalocean_certificate.this.uuid
}

output "state" {
  description = "Certificate state"
  value       = digitalocean_certificate.this.state
}

output "sha1_fingerprint" {
  description = "SHA1 fingerprint"
  value       = digitalocean_certificate.this.sha1_fingerprint
}

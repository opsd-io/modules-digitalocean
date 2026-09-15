output "record_ids" {
  description = "Created DNS record IDs"
  value       = { for key, record in digitalocean_record.this : key => record.id }
}

output "record_fqdns" {
  description = "Created DNS record FQDNs"
  value       = { for key, record in digitalocean_record.this : key => record.fqdn }
}

resource "digitalocean_record" "this" {
  for_each = var.records

  domain = var.domain
  type   = each.value.type
  name   = each.value.name
  value  = each.value.value

  ttl      = try(each.value.ttl, null)
  priority = try(each.value.priority, null)
  port     = try(each.value.port, null)
  weight   = try(each.value.weight, null)
  flags    = try(each.value.flags, null)
  tag      = try(each.value.tag, null)
}

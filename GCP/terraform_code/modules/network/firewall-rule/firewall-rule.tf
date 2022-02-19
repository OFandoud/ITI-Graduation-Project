# resource "google_compute_firewall" "rule" {
#   name          = var.name
#   network       = var.vpc_id
#   description   = var.description
#   source_ranges = var.source_ranges
#   direction = var.dirction

#   allow {
#     protocol = var.allow_protocol_name
#     ports    = var.allow_ports
#   }

#   deny {
#     protocol = var.deny_protocol_name
#     ports    = var.deny_ports
#   }

# }
//==============================================================//
resource "google_compute_firewall" "rules" {
  for_each                = { for r in var.rules : r.name => r }
  name                    = each.value.name
  description             = each.value.description
  direction               = each.value.direction
  network                 = var.network_name
  project                 = var.project_name
  source_ranges           = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.ranges : null
  priority                = each.value.priority

  
  dynamic "allow" {
    for_each = lookup(each.value, "allow", [])
    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  dynamic "deny" {
    for_each = lookup(each.value, "deny", [])
    content {
      protocol = deny.value.protocol
      ports    = lookup(deny.value, "ports", null)
    }
  }
}

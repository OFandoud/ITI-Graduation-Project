resource "google_compute_router" "router" {
  name    = var.name
  network = var.vpc_id
  region  = var.region
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}


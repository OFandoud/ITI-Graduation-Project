resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_block
  region        = var.region
  network       = var.vpc_id
}
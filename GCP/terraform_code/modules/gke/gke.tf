resource "google_container_cluster" "primary" {
  name     = var.name
  location = var.region
  network    = var.vpc_id
  subnetwork = var.subnet

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count

  release_channel {
    channel = "REGULAR"
  }
  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = var.enable_private_nodes
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.cidr_block
      display_name = var.display_name
    }
  }


}

// container node pool 
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.pool_name
  location   = var.pool_region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count


  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.sa
    oauth_scopes = var.oauth_scopes
  }
  depends_on = [
    google_container_cluster.primary
  ]
}
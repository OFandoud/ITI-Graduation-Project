module "gke" {
  source                   = "./modules/gke"
  name                     = var.cluster_name
  region                   = var.cluster_region
  vpc_id                   = var.vpc
  subnet                   = var.subnetwork_name2
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  enable_private_endpoint  = var.enable_private_endpoint
  enable_private_nodes     = var.enable_private_nodes
  master_ipv4_cidr_block   = var.master_ipv4_cidr_block
  cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
  services_ipv4_cidr_block = var.services_ipv4_cidr_block
  cidr_block               = var.ip_subnet_range
  display_name             = var.subnetwork_name
  pool_name                = var.pool_name
  pool_region              = var.pool_region

  node_count   = var.node_count
  preemptible  = var.preemptible
  machine_type = var.instance_type
  disk_size_gb = var.disk_size_gb
  disk_type    = var.disk_type
  sa           = module.sa.service_account_email
  oauth_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"

  ]

}



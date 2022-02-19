variable "project_name" {
  type    = string
  default = "gcp-iti-course-2021"
}
variable "region" {
  type    = string
  default = "europe-west1"
}
//=============== vpc ===============//
variable "vpc" {
  type    = string
  default = "final-project-vpc"
}

variable "auto" {
  type    = bool
  default = false
}
//=============== subnets ===============//
variable "subnetwork_name" {
  type    = string
  default = "public-subnet"
}
variable "ip_subnet_range" {
  default = "10.0.1.0/24"
}
//=============== subnets ===============//
variable "subnetwork_name2" {
  type    = string
  default = "private-subnet"
}
variable "ip_subnet_range2" {
  default = "10.0.2.0/24"
}
//=============== Nat gateway ===============//
variable "nat_gateway_name" {
  default = "my-nat"
}
//=============== Internet gateway ===============//
variable "router_name" {
  default = "my-router"
}

//=============== Service account ===============//
variable "service_account_id" {
  default = "final-service-account"
}
variable "service_account_display_name" {
  default = "final-service-account"
}
variable "service_account_role" {
  default = "roles/admin"
}
//=============== Machine ===============//
variable "instance_name" {
  default = "master-vm"
}
variable "instance_type" {
  default = "e2-medium"
}
variable "instance_zone" {
  default = "europe-west1-b"
}
variable "update" {
  default = "true"
}
variable "instance_image" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "instance_access_config" {
  default = [{
    network_tier = "STANDARD"
  }]
}
variable "instance_metadata_startup_script" {
  default = ""
}
variable "instance_scopes" {
  default = ["cloud-platform"]
}
//=============== GKE ===============//
variable "cluster_name" {
  default = "gke-cluster"
}
variable "cluster_region" {
  default = "europe-west1"
}
variable "remove_default_node_pool" {
  default = "true"
}
variable "initial_node_count" {
  default = 1
}
variable "enable_private_endpoint" {
  default = "false"
}
variable "enable_private_nodes" {
  default = "false"
}
variable "master_ipv4_cidr_block" {
  default = ""
}
variable "cluster_ipv4_cidr_block" {
  default = "10.2.0.0/16"
}
variable "services_ipv4_cidr_block" {
  default = "10.3.0.0/16"
}
variable "pool_name" {
  default = "gke-cluster-pool"
}
variable "pool_region" {
  default = "europe-west1"
}
variable "node_count" {
  default = 1
}
variable "preemptible" {
  default = "true"
}
variable "disk_size_gb" {
  default = "30"
}
variable "disk_type" {
  default = "pd-standard"
}

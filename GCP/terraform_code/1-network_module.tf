//============== VPC module =======================//
module "vpc" {
  source                  = "./modules/network/vpc"
  vpc_name                = var.vpc
  auto_create_subnetworks = var.auto
}
//============== Public Subnet module =======================//
module "public_subnet" {
  source        = "./modules/network/subnets"
  subnet_name   = var.subnetwork_name
  ip_cidr_block = var.ip_subnet_range
  region        = var.region
  vpc_id        = module.vpc.vpc_id
}
//============== Private Subnet module =======================//
module "private_subnet" {
  source        = "./modules/network/subnets"
  subnet_name   = var.subnetwork_name2
  ip_cidr_block = var.ip_subnet_range2
  region        = var.region
  vpc_id        = module.vpc.vpc_id
}
//============== Internet Gateway module =======================//
module "router" {
  source = "./modules/network/internet-gateway"
  name   = var.router_name
  region = var.region
  vpc_id = module.vpc.vpc_id
}
//============== Nat Gateway module =======================//
module "nat_gateway" {
  source      = "./modules/network/nat-gateway"
  nat_name    = var.nat_gateway_name
  router      = module.router.router_name
  subnet_name = module.public_subnet.subnet_name
  region      = var.region
}
//================= Firewall Rule module ====================//
module "firewall_rules" {
  source       = "./modules/network/firewall-rule"
  project_name = var.project_name
  network_name = module.vpc.vpc_id

  rules = [{
    name        = "allow-ssh-http-https-ingress"
    description = "allow ssh, http, and https port "
    direction   = "INGRESS"
    priority    = null
    ranges      = ["35.235.240.0/20","0.0.0.0/0"]
    allow = [{
      protocol = "tcp"
      ports    = ["22", "80", "443", "8080",  "50000"]
    }]
    deny = []

    }
    # ,
    # {
    #   name        = "allow-egress"
    #   description = "allow all port "
    #   direction   = "EGRESS"
    #   priority    = null
    #   ranges      = ["0.0.0.0/0"]
    #   allow = [{
    #     protocol = "tcp"
    #     ports    = []
    #   }]
    #   deny = []

    # }
  ]
}
module "machine" {
  source                  = "./modules/machine"
  name                    = var.instance_name
  machine_type            = var.instance_type
  zone                    = var.instance_zone
  allowing_update         = var.update
  image                   = var.instance_image
  vpc_id                  = module.vpc.vpc_id
  subnet                  = module.public_subnet.subnet_name
  access_config           = var.instance_access_config
  metadata_startup_script = var.instance_metadata_startup_script
  email                   = local.sa-email
  scopes                  = var.instance_scopes

}

locals {
  sa-email     = module.sa.service_account_email
  nat_ip       = module.nat_gateway.nat_output
  network_tier = "STANDARD"
}


output "master_vm_ip" {
  value = module.machine.instances_ip
  
}

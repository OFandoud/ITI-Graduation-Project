module "sa" {
  source     = "./modules/service-account"
  sa_id      = var.service_account_id
  sa_dn      = var.service_account_display_name
  role       = var.service_account_role
  project_id = var.project_name
  members = [
    "serviceAccount:${local.email}",
  ]
}
locals {
  email = module.sa.service_account_email
}

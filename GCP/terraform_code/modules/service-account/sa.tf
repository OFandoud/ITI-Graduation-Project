resource "google_service_account" "service_account" {
  account_id   = var.sa_id
  display_name = var.sa_dn
  
  }

resource "google_project_iam_binding" "admin" {
  
  role               = var.role
  project = var.project_id

  members = var.members
}
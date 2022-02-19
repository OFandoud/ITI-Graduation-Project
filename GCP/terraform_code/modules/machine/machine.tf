resource "google_compute_instance" "vm" {
  name                      = var.name
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = var.allowing_update


  boot_disk {
    initialize_params {
      image = var.image
    }
  }


  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet

        dynamic "access_config" {
      for_each = var.access_config
      content {
        # nat_ip       = access_config.value.nat_ip
        network_tier = access_config.value.network_tier
      }
    }

  }

  metadata_startup_script = var.metadata_startup_script


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.email
    scopes = var.scopes
  }
}

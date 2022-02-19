terraform {
  backend "gcs" {
    bucket = "tf-state-file-iti"
    prefix = "terraform/state"

  }
}
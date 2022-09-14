locals {
  zones = {
    dev   = "us-central1-a"
    stage = "us-central1-b"
    prod  = "us-central1-c"
  }
}

provider "google" {
  project = "tf-multiple-envs-ts"
  region  = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "instance-${terraform.workspace}"
  # Conditional expression, good for only two options
  machine_type = terraform.workspace == "prod" ? "e2-medium" : "e2-small"
  # Use maps for greater control
  zone         = local.zones[terraform.workspace]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }

}

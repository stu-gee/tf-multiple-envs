provider "google" {
  project = "tf-multiple-envs-ts"
  region  = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "instance-${var.instance_name}"
  machine_type = var.machine_type
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

provider "google" {
  project = "tf-multiple-envs-ts"
  region  = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "instance-${var.instance_name}"
  machine_type = var.machine_type
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }

}

module "server" {
  source = "github.com/org/repo//modules/compute-instance?ref=v1.0.0"


}
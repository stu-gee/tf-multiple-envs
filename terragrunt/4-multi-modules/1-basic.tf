## If modules existed in the same Terraform configuration it was easy to reference them

module "vpc" {
  source = "github.com/org/repo//modules/compute-instance?ref=v1.0.0"

  ###
  ###  ... some parameters
  ###

}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = module.vpc.id
  }

}

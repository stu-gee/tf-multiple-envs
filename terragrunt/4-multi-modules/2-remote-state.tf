## When modules are ran separately, or stored in separate state files, you need to leverage `terraform-remote-state` to access them

## Let's say we have a VPC module
/modules/vpc/
    main.tf
    vars.tf
    providers.tf
    backend.tf
    outputs.tf

# backend.tf contents
terraform {
  backend "gcs" {
    bucket  =  "vpc-module-bucket"
    prefix  = "terraform/state"
  }
}

# outputs.tf contents
output "vpc-id" {
  value = google_compute_network.vpc.id
}

# In a separate module
/modules/myserver
    main.tf
    vars.tf
    providers.tf
    backend.tf


# We can use the `terraform_remote_state` Data Source to grab the output, by referencing the bucket where the state file is stored
data "terraform_remote_state" "vpc" {
  backend       = "gcs"
  config        = {
    bucket      = "vpc-module-bucket"
    key         = "terraform/state"
    location    = "us"
  }
}

# Then reference it where needed
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
    network = data.terraform_remote_state.outputs.vpc-id
  }
}
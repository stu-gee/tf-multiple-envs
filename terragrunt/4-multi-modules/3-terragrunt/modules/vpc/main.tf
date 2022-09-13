provider "google" {
  project = "tf-multiple-envs-ts"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  project                 = "tf-multiple-envs-ts"
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

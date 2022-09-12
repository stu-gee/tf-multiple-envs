provider "google" {
  project = "tf-multiple-envs-ts"
  region  = "us-central1"
}

provider "random" {

}

resource "random_pet" "server" {

}

resource "google_compute_instance" "default" {
  name         = random_pet.server.id
  machine_type = "e2-medium"
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
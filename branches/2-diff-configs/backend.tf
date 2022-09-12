# Store state in remote backend
terraform {
  backend "gcs" {
    bucket  = "tf-state-dev"
    prefix  = "terraform/state"
  }
}
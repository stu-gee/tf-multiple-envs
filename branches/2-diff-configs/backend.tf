# Store state in remote backend
terraform {
  backend "gcs" {
    bucket  = "tf-state-stage"
    prefix  = "terraform/state"
  }
}

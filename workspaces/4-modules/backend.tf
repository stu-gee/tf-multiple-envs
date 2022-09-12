# Store state in remote backend
terraform {
  backend "gcs" {
    bucket  = "tf-state"
    prefix  = "terraform/state"
  }
}

# To store in separate buckets you may try this non-functioning code
# Only option is storing in the same bucket
terraform {
  backend "gcs" {
    bucket  =  terraform.workspace == "prod" ? "prod-bucket" : "dev-bucket"
    prefix  = "terraform/state"
  }
}
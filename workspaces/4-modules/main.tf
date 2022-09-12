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

## Calling a specific version of your module
module "server" {
  source = "github.com/org/repo//modules/compute-instance?ref=v1.0.0"

  ###
  ###  ... some parameters
  ###

}

## Testing out version 2.0.0 before promoting to prod
module "server" {
  source = "github.com/org/repo//modules/compute-instance?ref=v2.0.0"


}

## Only hardcoded URLs are allowed - code below does not work
module "server" {
    source = (
    terraform.workspace == "prod" 
    ? "github.com/org/repo//modules/compute-instance?ref=v1.0.0" 
    : "github.com/org/repo//modules/compute-instance?ref=v2.0.0"
  )

}

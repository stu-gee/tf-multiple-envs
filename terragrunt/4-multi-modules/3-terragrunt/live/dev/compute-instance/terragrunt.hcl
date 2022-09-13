terraform {
  source = "../../../modules/compute-instance"
}

# Create a dependency on the mysql module
dependency "vpc" {
  config_path = "../vpc"
}


inputs = {
  instance_name = "compute-instance-dev-3"
  machine_type  = "e2-small"

  # Read the output value from the vpc module and use it as an input value
  network_id = dependency.vpc.outputs.subnet-id
}
# Automatically find the root terragrunt.hcl and inherit its
# configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/compute-instance"
}

inputs = {
  instance_name = "compute-instance-stage-2"
  machine_type = "e2-medium"
}
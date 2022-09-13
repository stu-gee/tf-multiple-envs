terraform {
  source = "../../../modules/compute-instance"
}

inputs = {
  instance_name = "compute-instance-dev"
  machine_type = "e2-small"
}
terraform {
  source = "../../../modules/compute-instance"
}

inputs = {
  instance_name = "compute-instance-stage"
  machine_type = "e2-medium"
}
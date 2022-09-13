terraform {
  source = "<YOUR_GITHUB_URL>//ec2-instance?ref=v2.0.0"
}

inputs = {
  instance_name = "compute-instance-stage-2"
  machine_type = "e2-medium"
}
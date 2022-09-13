terraform {
  source = "<YOUR_GITHUB_URL>//ec2-instance?ref=v1.0.0"
}

inputs = {
  instance_name = "compute-instance-dev-2"
  machine_type = "e2-small"
}
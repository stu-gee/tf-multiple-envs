terraform {
  source = "../../../modules/vpc"
}

inputs = {
  vpc_name     = "vpc-dev"
  subnet_name  = "subnet-dev"
}
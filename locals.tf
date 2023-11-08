data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  name   = "fiap-tech-challenge"
  region = "us-east-1"

  /* Kubernetes */
  kubernetes_version = "1.28"

  instance_types = ["t3.small"]

  vpc_cidr = "23.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)

  tags = {
    Name       = local.name
  }
}

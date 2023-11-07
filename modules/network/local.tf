data "aws_availability_zones" "available" {}

locals {
  name   = "fiap-tech-challenge"
  region = "us-east-1"

  vpc_cidr = var.vpc_cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = local.name
  }
}

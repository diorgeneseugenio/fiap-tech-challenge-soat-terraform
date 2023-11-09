
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 3)]

  tags = local.tags

  enable_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}


# resource "aws_security_group" "eks_security_group" {
#   vpc_id = module.vpc.id

#   egress {
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "eks-security-group"
#   }
# }

# resource "aws_security_group_rule" "eks_ingress_rule" {
#   security_group_id = aws_security_group.eks_security_group.id

#   type        = "ingress"
#   from_port   = 0
#   to_port     = 65535
#   protocol    = "tcp"
#   cidr_blocks = vpc.cidr_blocks
# }

# resource "aws_security_group" "rds_security_group" {
#   vpc_id = module.vpc.id

# }

# resource "aws_security_group_rule" "rds_ingress_rule" {
#   security_group_id = aws_security_group.rds_security_group.id

#   type        = "ingress"
#   from_port   = 3306
#   to_port     = 3306
#   protocol    = "tcp"
#   source_security_group_id = aws_security_group.eks_security_group.id
# }

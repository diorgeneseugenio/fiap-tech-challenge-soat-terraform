module "network" {
  source = "./modules/network"

  cluster_name    = var.cluster_name
  region          = var.region
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  intra_subnets   = var.intra_subnets
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs

}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  region             = var.region
  min_size           = var.max_size
  max_size           = var.max_size
  capacity_type      = var.capacity_type
  desired_size       = var.desired_size
  instance_types     = var.instance_types

  vpc_id          = module.network.vpc_id
  intra_subnets   = module.network.intra_subnets
  private_subnets = module.network.private_subnets
}

module "rds" {
  source = "./modules/rds"
}

module "cognito" {
  source = "./modules/cognito"
}

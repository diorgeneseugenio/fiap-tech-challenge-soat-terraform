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

module ecs {
  source = "./modules/ecs"

  aws_region = var.region
  cluster_name = var.cluster_name
}

module "documentdb_cluster" {
  source = "./modules/documentDB"

  cluster_identifier = var.cluster_identifier
  master_username    = var.docdb_master_username
  master_password    = var.docdb_master_password
  aws_security_group_id = module.network.security_group_id
  azs                = var.azs
  private_subnets = module.network.private_subnets
}

module "sqs" {
  source = "./modules/sqs"
}

module "rds" {
  source          = "./modules/rds"

  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  security_group_id = module.network.security_group_id
  vpc_id          = module.network.vpc_id
  intra_subnets   = module.network.intra_subnets
  private_subnets = module.network.private_subnets
}

# module "cognito" {
#   source = "./modules/cognito"
# }

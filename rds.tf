module "rds" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.2.0"

  identifier = "${local.name}-db"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"

  db_name  = "fiap_tech_challenge"
  username = "fiap_tech_challenge"
  port     = "3306"

  publicly_accessible = true
  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.security_group_db.security_group_id]

  allocated_storage = 5

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.public_subnets

  create_db_option_group = false

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}

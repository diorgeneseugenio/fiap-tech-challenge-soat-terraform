


# resource "aws_db_subnet_group" "my_db_subnet_group" {
#   name       = "my-db-subnet-group"
#   subnet_ids = module.vpc.private_subnets
# }

module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.db_name
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t2.small"
  allocated_storage = 5

  db_name  =  var.db_name
  username =  var.db_username
  password =  var.db_password
  port     = "3306"
  manage_master_user_password = false

  vpc_security_group_ids = [var.security_group_id]

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids = var.private_subnets
  
  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  # Database Deletion Protection
  deletion_protection = false # TODO - reverter   

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

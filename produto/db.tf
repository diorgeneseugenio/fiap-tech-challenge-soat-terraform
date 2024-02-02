resource "aws_db_instance" "db" {
  identifier           = "${local.name}-db"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  allocated_storage    = 10
  db_name              = "${local.name}_db"
  username             = local.name
  password             = "${local.name}-password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  port                   = local.db_port
  vpc_security_group_ids = [aws_security_group.produto_db.id]
  db_subnet_group_name   = var.subnet_group_name
}

resource "aws_docdb_subnet_group" "service" {
  name       = "tf-${var.cluster_identifier}"
  subnet_ids = var.private_subnets
}

resource "aws_docdb_cluster_parameter_group" "docdb_pg" {
  family = "docdb5.0"
  name   = "${var.cluster_identifier}-parameter-group"
  description = "Custom parameter group for DocumentDB cluster"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}

resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier      = var.cluster_identifier
  master_username         = var.master_username
  master_password         = var.master_password
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.docdb_pg.name
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.aws_security_group_id]
  db_subnet_group_name    = "${aws_docdb_subnet_group.service.name}"
}

resource "aws_docdb_cluster_instance" "docdb_instance" {
  cluster_identifier = aws_docdb_cluster.docdb_cluster.id
  identifier        = "${var.cluster_identifier}-instance"
  instance_class    = var.instance_class

}
resource "aws_docdb_cluster_parameter_group" "docdb_pg" {
  family = "docdb5.0"
  name   = "${local.name}-parameter-group"
  description = "Custom parameter group for DocumentDB cluster"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${local.name}-docdb-cluster"
  engine                  = "docdb"
  master_username         = "${local.document_db_user}"
  master_password         = "${local.document_db_password}"
  preferred_backup_window = "07:00-09:00"

  skip_final_snapshot = true

  port                   = 27017
  vpc_security_group_ids = [aws_security_group.document_db_sg.id]
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.docdb_pg.name
  db_subnet_group_name   = aws_db_subnet_group.private.name
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-cluster-${local.name}-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.t3.medium"
}

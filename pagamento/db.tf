resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${local.name}-docdb-cluster"
  engine                  = "docdb"
  master_username         = local.name
  master_password         = "${local.name}-password"
  preferred_backup_window = "07:00-09:00"

  skip_final_snapshot = true

  port                   = local.db_port
  vpc_security_group_ids = [aws_security_group.pagamento_db.id]
  db_subnet_group_name   = var.subnet_group_name
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-cluster-${local.name}-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.r5.large"
}

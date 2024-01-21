output "docdb_endpoint" {
  value = aws_docdb_cluster.docdb_cluster.endpoint
}

output "docdb_instance_endpoint" {
  value = aws_docdb_cluster_instance.docdb_instance.endpoint
}
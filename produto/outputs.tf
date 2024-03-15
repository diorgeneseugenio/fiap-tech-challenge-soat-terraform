

output "lb_url" {
  value = aws_lb.produto.dns_name
}
output "ecr_produto_name" {
  value = aws_ecr_repository.produto.name
}

output "mysql_db_name" {
    value = aws_db_instance.db.db_name
}
output "mysql_db_host" {
    value = local.split_endpoint
}
output "mysql_db_port" {
    value = "${tostring(aws_db_instance.db.port)}"
}
output "mysql_db_username" {
    value = aws_db_instance.db.username
}
output "mysql_db_password" {
    value = "${aws_db_instance.db.username}-password"
}
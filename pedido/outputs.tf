output "lb_url" {
  value = aws_lb.pedido.dns_name
}

output "ecr_pedido_name" {
  value = aws_ecr_repository.pedido.name
}
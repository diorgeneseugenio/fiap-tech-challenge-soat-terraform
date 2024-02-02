

output "lb_url" {
  value = aws_lb.pagamento.dns_name
}

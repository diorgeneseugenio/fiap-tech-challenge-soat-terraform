

output "lb_url" {
  value = aws_lb.pagamento.dns_name
}

output "ecr_pagamento_name" {
  value = aws_ecr_repository.pagamento.name
}

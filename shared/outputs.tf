

output "ecs_task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}

output "ecs_exec_role_arn" {
  value = aws_iam_role.ecs_exec_role.arn
}

output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.logs.name
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "subnets_id" {
  value = aws_subnet.public[*].id
}

output "vpc_id" {
  value = aws_vpc.default.id
}

output "api_gateway_api_id" {
  value = aws_apigatewayv2_api.api.id
}

output "private_subnets_id" {
  value = aws_subnet.private[*].id

}

output "sqs_queue_notificacao" {
  value = aws_sqs_queue.sqs_queue_notificacao.id
}

output "sqs_queue_cancelamento" {
  value = aws_sqs_queue.sqs_queue_cancelamento.id
}

output "sqs_queue_envio_pagamento" {
  value = aws_sqs_queue.sqs_queue_envio_pagamento.id
}

output "sqs_queue_envio_cobranca" {
  value = aws_sqs_queue.sqs_queue_envio_cobranca.id
}

output "sqs_queue_envio_pagamento_dlq" {
  value = aws_sqs_queue.sqs_queue_envio_pagamento_dlq.id
}

output "sqs_queue_pedido_pago" {
  value = aws_sqs_queue.sqs_queue_pedido_pago.id
}
output "sqs_atualiza_pagamento" {
  value = aws_sqs_queue.sqs_atualiza_pagamento.id
}

output "subnet_group_name" {
  value = aws_db_subnet_group.private.name
}
output "db_uri" {
  value = "mongodb://${aws_docdb_cluster.docdb.master_username}:${aws_docdb_cluster.docdb.master_password}@${aws_docdb_cluster.docdb.reader_endpoint}:27017/"
}

output "aws_security_group_document_db_sg_id" {
  value = aws_security_group.document_db_sg.id
}

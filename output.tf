output "ecr_pedido_name" {
  value = module.produto.ecr_produto_name
}

output "ecr_pagamento_name" {
    value = module.pagamento.ecr_pagamento_name
}

output "ecr_produto_name" {
    value = module.produto.ecr_produto_name
}


output "mysql_db_name" {
    value = module.produto.mysql_db_name
}

output "mysql_db_host" {
    value = module.produto.mysql_db_host
}

output "mysql_db_port" {
    value = module.produto.mysql_db_port
}

output "mysql_db_username" {
    value = module.produto.mysql_db_username
}

output "mysql_db_password" {
    value = module.produto.mysql_db_password
}

output "document_db_uri" {
    value = module.shared.db_uri
    sensitive = true
}

output "ecs_task_role" {
    value = "ecs-task-role"
}

output "ecs_tasl_rol_arn" {
    value = module.shared.ecs_task_role_arn
}

output "ecs_exec_role_arn" {
    value = module.shared.ecs_exec_role_arn
}

output "ecs_cluster_id" {
    value = module.shared.ecs_cluster_id
}

output "sqs_queue_envio_cobranca" {
    value = module.shared.sqs_queue_envio_cobranca
}

output "sqs_queue_envio_pagamento" {
    value = module.shared.sqs_queue_envio_pagamento
}

output "sqs_queue_envio_pagamento_dlq" {
    value = module.shared.sqs_queue_envio_pagamento_dlq
}

output "sqs_queue_pedido_pago" {
    value = module.shared.sqs_queue_pedido_pago
}

output "sqs_queue_notificacao" {
    value = module.shared.sqs_queue_notificacao
}

output "sqs_atualiza_pagamento" {
    value = module.shared.sqs_atualiza_pagamento
}

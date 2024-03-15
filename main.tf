module "shared" {
  source = "./shared"

  region = local.region
}

module "produto" {
  source = "./produto"

  ecs_task_role_arn         = module.shared.ecs_task_role_arn
  ecs_exec_role_arn         = module.shared.ecs_exec_role_arn
  cloudwatch_log_group_name = module.shared.cloudwatch_log_group_name
  ecs_cluster_id            = module.shared.ecs_cluster_id
  subnets_id                = module.shared.subnets_id
  vpc_id                    = module.shared.vpc_id
  api_gateway_api_id        = module.shared.api_gateway_api_id
  private_subnets_id        = module.shared.private_subnets_id
  region                    = local.region
  subnet_group_name         = module.shared.subnet_group_name

  depends_on = [module.shared]
}

module "pagamento" {
  source = "./pagamento"

  aws_security_group_document_db_sg_id = module.shared.aws_security_group_document_db_sg_id
  db_uri                        = module.shared.db_uri
  ecs_task_role_arn             = module.shared.ecs_task_role_arn
  ecs_exec_role_arn             = module.shared.ecs_exec_role_arn
  cloudwatch_log_group_name     = module.shared.cloudwatch_log_group_name
  ecs_cluster_id                = module.shared.ecs_cluster_id
  subnets_id                    = module.shared.subnets_id
  vpc_id                        = module.shared.vpc_id
  api_gateway_api_id            = module.shared.api_gateway_api_id
  private_subnets_id            = module.shared.private_subnets_id
  region                        = local.region
  sqs_queue_envio_cobranca      = module.shared.sqs_queue_envio_cobranca
  sqs_queue_envio_pagamento     = module.shared.sqs_queue_envio_pagamento
  sqs_queue_envio_pagamento_dlq = module.shared.sqs_queue_envio_pagamento_dlq
  sqs_queue_pedido_pago         = module.shared.sqs_queue_pedido_pago
  sqs_atualiza_pagamento        = module.shared.sqs_atualiza_pagamento
  sqs_queue_cancelamento        = module.shared.sqs_queue_cancelamento
  aws_access_key                = local.aws_access_key
  aws_secret_key                = local.aws_secret_key
  subnet_group_name             = module.shared.subnet_group_name

  depends_on = [module.shared]
}

module "pedido" {
  source = "./pedido"

  aws_security_group_document_db_sg_id = module.shared.aws_security_group_document_db_sg_id
  db_uri                        = module.shared.db_uri
  ecs_task_role_arn             = module.shared.ecs_task_role_arn
  ecs_exec_role_arn             = module.shared.ecs_exec_role_arn
  cloudwatch_log_group_name     = module.shared.cloudwatch_log_group_name
  ecs_cluster_id                = module.shared.ecs_cluster_id
  subnets_id                    = module.shared.subnets_id
  vpc_id                        = module.shared.vpc_id
  api_gateway_api_id            = module.shared.api_gateway_api_id
  private_subnets_id            = module.shared.private_subnets_id
  region                        = local.region
  aws_access_key                = local.aws_access_key
  aws_secret_key                = local.aws_secret_key
  endpoint_ms_pagamento         = module.pagamento.lb_url
  endpoint_ms_produto           = module.produto.lb_url
  sqs_queue_envio_pagamento     = module.shared.sqs_queue_envio_pagamento
  sqs_queue_envio_pagamento_dlq = module.shared.sqs_queue_envio_pagamento_dlq
  sqs_queue_pedido_pago         = module.shared.sqs_queue_pedido_pago
  sqs_atualiza_pagamento        = module.shared.sqs_atualiza_pagamento
  sqs_queue_cancelamento        = module.shared.sqs_queue_cancelamento
  sqs_queue_notificacao         = module.shared.sqs_queue_notificacao
  subnet_group_name             = module.shared.subnet_group_name

  depends_on = [module.shared, module.produto, module.pagamento]
}

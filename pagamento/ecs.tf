resource "aws_ecs_task_definition" "pagamento" {
  family                   = local.name
  task_role_arn            = var.ecs_task_role_arn
  execution_role_arn       = var.ecs_exec_role_arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name         = local.name,
    image        = "${aws_ecr_repository.pagamento.repository_url}:latest",
    essential    = true,
    portMappings = [{ containerPort = local.port, hostPort = local.port }],

    environment = [
      { name = "NODE_ENV", value = "production" },
      { name = "PORT", value = "${tostring(local.port)}" },
      { name = "MONGODB_CONNECTIONSTRING", value = var.db_uri },
      { name = "MONGODB_DB_NAME", value = local.name },
      { name = "AWS_REGION", value = var.region },
      { name = "AWS_ACCESS_KEY", value = var.aws_access_key },
      { name = "AWS_SECRET_KEY", value = var.aws_secret_key },
      { name = "FILA_PEDIDO_PAGO", value = var.sqs_queue_pedido_pago },
      { name = "URL_FILA_PEDIDO_PAGO", value = var.sqs_queue_pedido_pago },
      { name = "FILA_ENVIO_COBRANCA", value = var.sqs_queue_envio_cobranca },
      { name = "URL_FILA_ENVIO_COBRANCA", value = var.sqs_queue_envio_cobranca },
      { name = "FILA_ENVIO_PAGAMENTO", value = var.sqs_queue_envio_pagamento },
      { name = "URL_FILA_ENVIO_PAGAMENTO", value = var.sqs_queue_envio_pagamento },
      { name = "URL_FILA_ENVIO_PAGAMENTO_DLQ", value = var.sqs_queue_envio_pagamento_dlq },
      { name = "URL_FILA_CANCELAMENTO_PEDIDO", value = var.sqs_queue_cancelamento },
      { name = "URL_FILA_ATUALIZA_PEDIDO", value = var.sqs_atualiza_pagamento },
    ]

    logConfiguration = {
      logDriver = "awslogs",
      options = {
        "awslogs-region"        = var.region,
        "awslogs-group"         = var.cloudwatch_log_group_name,
        "awslogs-stream-prefix" = local.name
      }
    },
  }])
}

resource "aws_ecs_service" "pagamento" {
  name            = local.name
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.pagamento.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    security_groups = [aws_security_group.pagamento.id]
    subnets         = var.private_subnets_id
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.pagamento.arn
    container_name   = local.name
    container_port   = local.port
  }
}

resource "aws_security_group_rule" "allow_ingress" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = var.aws_security_group_document_db_sg_id
  source_security_group_id = aws_security_group.pagamento.id
}

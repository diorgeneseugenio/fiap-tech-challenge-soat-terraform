resource "aws_sqs_queue" "terraform_queue_pagamento_pago" {
  name                      = "pagamento-pago"
  delay_seconds             = 20
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_pagamento_pago_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev-fiap"
  }
}

resource "aws_sqs_queue" "terraform_queue_pagamento_pago_deadletter" {
  name = "pagamento-pago-deadletter-queue"
}

resource "aws_sqs_queue" "terraform_queue_pedido_criado_pagto_pendente" {
  name                      = "pedido-criado-pagto-pendente"
  delay_seconds             = 20
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_pedido_criado_pagto_pendente_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev-fiap"
  }
}

resource "aws_sqs_queue" "terraform_queue_pedido_criado_pagto_pendente_deadletter" {
  name = "pedido-criado-pagto-pendente-deadletter-queue"
}

resource "aws_sqs_queue" "terraform_queue_pagto_em_processamento" {
  name                      = "pagto-em-processamento"
  delay_seconds             = 20
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_pagto_em_processamento_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev-fiap"
  }
}

resource "aws_sqs_queue" "terraform_queue_pagto_em_processamento_deadletter" {
  name = "pagto-em-processamento-deadletter-queue"
}

resource "aws_sqs_queue" "terraform_queue_pagto_processado" {
  name                      = "pagto-processado"
  delay_seconds             = 20
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_pagto_processado_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev-fiap"
  }
}


resource "aws_sqs_queue" "terraform_queue_pagto_processado_deadletter" {
  name = "pagto-processado-deadletter-queue"
}

resource "aws_sqs_queue" "terraform_queue_pedido_pago" {
  name                      = "pedido-pago"
  delay_seconds             = 20
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_pedido_pago_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev-fiap"
  }
}


resource "aws_sqs_queue" "terraform_queue_pedido_pago_deadletter" {
  name = "pedido-pago-deadletter-queue"
}
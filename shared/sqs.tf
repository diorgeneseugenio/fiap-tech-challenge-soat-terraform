resource "aws_sqs_queue" "sqs_queue_envio_pagamento" {
  name                        = "pagamento-queue"
  fifo_queue                  = false
  content_based_deduplication = false
}

resource "aws_sqs_queue" "sqs_queue_notificacao" {
  name                        = "notification-queue"
  fifo_queue                  = false
  content_based_deduplication = false
}

resource "aws_sqs_queue" "sqs_queue_envio_pagamento_dlq" {
  name                        = "pagamento-queue-dlq-queue"
  fifo_queue                  = false
  content_based_deduplication = false
}
resource "aws_sqs_queue" "sqs_queue_envio_cobranca" {
  name                        = "cobranca-queue"
  fifo_queue                  = false
  content_based_deduplication = false
}

resource "aws_sqs_queue" "sqs_queue_cancelamento" {
  name                        = "cancelamento-queue"
  fifo_queue                  = false
  content_based_deduplication = false
}


resource "aws_sqs_queue" "sqs_queue_pedido_pago" {
  name                        = "pedido-pago"
  fifo_queue                  = false
  content_based_deduplication = false
}

resource "aws_sqs_queue" "sqs_atualiza_pagamento" {
  name                        = "atualiza-pagamento"
  fifo_queue                  = false
  content_based_deduplication = false
}

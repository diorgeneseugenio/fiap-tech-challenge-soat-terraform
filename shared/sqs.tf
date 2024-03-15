resource "aws_sqs_queue" "sqs_queue_envio_pagamento" {
  name                        = "pagamento-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_notificacao" {
  name                        = "notification-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_envio_pagamento_dlq" {
  name                        = "pagamento-queue-dlq-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}
resource "aws_sqs_queue" "sqs_queue_envio_cobranca" {
  name                        = "cobranca-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_cancelamento" {
  name                        = "cancelamento-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}


resource "aws_sqs_queue" "sqs_queue_pedido_pago" {
  name                        = "pedido-pago.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_atualiza_pagamento" {
  name                        = "atualiza-pagamento.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

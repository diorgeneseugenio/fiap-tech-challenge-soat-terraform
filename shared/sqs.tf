resource "aws_sqs_queue" "sqs_queue_envio_pagamento" {
  name                        = "envio-pagamento-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_envio_cobranca" {
  name                        = "envio-cobranca-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_envio_pagamento_dlq" {
  name                        = "envio-pagamento-dlq-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_pedido_pago" {
  name                        = "pedido-pago-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "sqs_queue_notification_client" {
  name                        = "notifica_cliente.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

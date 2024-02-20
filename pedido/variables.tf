variable "region" {
  type        = string
  description = "AWS region"
}

variable "aws_access_key" {
  type        = string
  description = "AWS ACCESS KEY"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS SECRET KEY"
}


variable "ecs_task_role_arn" {
  type        = string
  description = "value of the ecs_task_role_arn output from the iam module"
}

variable "ecs_exec_role_arn" {
  type        = string
  description = "value of the ecs_exec_role_arn output from the iam module"
}

variable "cloudwatch_log_group_name" {
  type        = string
  description = "value of the cloudwatch_log_group_name output from the logs module"

}

variable "ecs_cluster_id" {
  type        = string
  description = "value of the ecs_cluster_id output from the ecs module"

}

variable "subnets_id" {
  type        = list(string)
  description = "value of the subnets_id output from the vpc module"
}

variable "vpc_id" {
  type        = string
  description = "value of the vpc_id output from the vpc module"
}

variable "api_gateway_api_id" {
  type        = string
  description = "value of the api_gateway_api_id output from the api-gateway module"
}

variable "private_subnets_id" {
  type        = list(string)
  description = "value of the subnets_id output from the vpc module"
}

variable "sqs_queue_envio_pagamento" {
  type        = string
  description = "value of the sqs_queue_envio_pagamento output from the sqs module"
}

variable "sqs_queue_envio_pagamento_dlq" {
  type        = string
  description = "value of the sqs_queue_envio_pagamento_dlq output from the sqs module"
}

variable "sqs_queue_pedido_pago" {
  type        = string
  description = "value of the sqs_queue_pedido_pago output from the sqs module"
}

variable "endpoint_ms_pagamento" {
  type        = string
  description = "URL of the endpoint to process the payment"
}

variable "endpoint_ms_produto" {
  type        = string
  description = "URL of the endpoint to process the product"
}

variable "subnet_group_name" {
  type        = string
  description = "value of the subnet_group_name output from the db module"
}

variable "db_uri" {
  type        = string
}

variable "aws_security_group_document_db_sg_id" {
  type        = string
}
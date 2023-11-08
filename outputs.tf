output "region" {
  description = "AWS region"
  value       = var.region
}

/* DB */
output "db_endpoint" {
  description = "Data Base Endpoint"
  value       = module.rds.db_instance_endpoint
}

output "db_name" {
  description = "Data Base Name"
  value       = module.rds.db_instance_name
}

output "db_port" {
  description = "Data Base Port"
  value       = module.rds.db_instance_port
}

/* Cluster */
output "cluster_name" {
  description = "Cluster Name"
  value       = module.eks.cluster_name
  
}

output "cluster_endpoint" {
  description = "Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cognito_client_pool_id" {
  description = "Cognito - Client Pool Id"
  value       = aws_cognito_user_pool.clients_pool.id
}

output "cognito_client_pool_client_id" {
  description = "Cognito - Client - Client Pool Id"
  value       = aws_cognito_user_pool_client.clients_pool_client.id
}

output "cognito_admin_pool_id" {
  description = "Cognito - Admin Pool Id"
  value       = aws_cognito_user_pool.admin_pool.id
}

output "cognito_client_pool_admin_id" {
  description = "Cognito - Client - Admin Pool Id"
  value       = aws_cognito_user_pool_client.admin_pool_client.id
}

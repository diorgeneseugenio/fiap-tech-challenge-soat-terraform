output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "db_name" {
  description = "MySQL Database name"
  value       = var.db_name
}
output "db_username" {
  description = "MySQL Database username"
  value       = var.db_username
}

output "db_password" {
  description = "MySQL Database password"
  value       = var.db_password
}

output "db_instance_address" {
  description = "Database URL"
  value       = module.rds.db_instance_address
}

output "region" {
  description = "AWS region"
  value       = var.region
}

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



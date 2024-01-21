output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "private_subnets" {
  value = module.network.private_subnets
}

output "intra_subnets" {
  value = module.network.intra_subnets
}
output "security_group_id" {
  value = module.network.security_group_id
}

output "ecs_log_role_name" {
  value = module.ecs.ecs_log_role_name
}

output "cluster_name" {
  value = var.cluster_name
}

output "docdb_master_password" {
  value = var.docdb_master_password
}

output "docdb_master_password" {
  value = var.docdb_master_password
}

# output "db_name" {
#   description = "MySQL Database name"
#   value       = var.db_name
# }
# output "db_username" {
#   description = "MySQL Database username"
#   value       = var.db_username
# }

# output "db_password" {
#   description = "MySQL Database password"
#   value       = var.db_password
# }

# output "db_instance_address" {
#   description = "Database URL"
#   value       = module.rds.db_instance_address
# }

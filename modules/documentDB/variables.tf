
variable "cluster_identifier" {
  description = "The identifier for the DocumentDB cluster"
}

variable "master_username" {
  description = "The username for the master user"
}

variable "master_password" {
  description = "The password for the master user"
}

variable "instance_class" {
  description = "The instance class of the DocumentDB instances"
  default     = "db.t3.medium"
}

variable "azs" {}
variable "private_subnets" {}
variable "aws_security_group_id" {}
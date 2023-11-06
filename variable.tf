variable "cluster_name" {
  default = "fiap-tech-challeng-soat"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "kubernetes_version" {
  default = "1.28"
}

variable "vpc_cidr" {
  default = "10.123.0.0/16"
}

variable "instance_types" {
  default = ["t1.micro"]
}


variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}
variable "public_subnets" {
  default = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "private_subnets" {
  default = ["10.123.3.0/24", "10.123.4.0/24"]
}
variable "intra_subnets" {
  default = ["10.123.5.0/24", "10.123.6.0/24"]
}

variable "desired_size" {
  default = "2"

}

variable "max_size" {
  default = "2"
}

variable "min_size" {
  default = "1"
}

variable "capacity_type" {
  default = "ON_DEMAND"
}

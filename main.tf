terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1"
    }
  }

  required_version = "1.6.3"

  backend "s3" {
    bucket         = "test-terraform-fiap-tech"
    key            = "fiap-soat-tech-challenge/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-terraform-fiap-tech-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

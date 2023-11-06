terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1"
    }
  }

  required_version = "1.6.1"

  backend "s3" {
    bucket         = "fiap-soat-tech-challenge-tf-state"
    key            = "fiap-soat-tech-challenge/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "fiap-soat-tech-challenge-tf-state-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

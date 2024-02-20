terraform {
  required_version = "~> 1.7.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.1"
    }
  }

  backend "s3" {
    bucket         = "api-gateway-tf-state2"
    key            = "api-gateway/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-terraform-fiap-tech-lock"
  }

}

provider "aws" {
  region = local.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0.0"
    }
  }
  backend "s3" {
    bucket       = "diptendueksterraform"
    key          = "module/vpc/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
  required_version = ">= 1.13.0"
}
provider "aws" {
  # Configuration options
  region = var.aws_region
}
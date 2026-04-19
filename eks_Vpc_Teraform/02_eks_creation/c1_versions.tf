terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
    backend "s3" {
    bucket       = "diptendueksterraform"
    key          = "module/eks/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
region = var.aws_region
}
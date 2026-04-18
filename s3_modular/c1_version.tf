terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">3.0.0"
    }
  }

  backend "s3" {
    bucket       = "mytfbucket-zf3v"
    key          = "module/s3/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.region
}
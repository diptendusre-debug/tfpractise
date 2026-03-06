terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.34.0"
    }
  }
    backend "s3" {
    bucket         = "diptendu-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt = true
    use_lockfile = true
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
variable "environment"{
  default = "dev"
  type = string
}
resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "diptendu-practice-bucket-12345"

  tags = {
    Name        = "${var.environment}-bucket"
    Environment = var.environment
  }
}

output "vpcname" {
  value = aws_vpc.myvpc.id
  
}
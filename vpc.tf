terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.34.0"
    }
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
resource "aws_vpc" "dipvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dipvpc"
  }
}
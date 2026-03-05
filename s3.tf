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


resource "aws_s3_bucket" "example" {
  bucket = "diptendu-practice-bucket-12345"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
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
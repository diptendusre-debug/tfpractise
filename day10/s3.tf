resource "random_string" "name" {
  length  = 8
  special = false
  upper   = false
}


resource "aws_s3_bucket" "example" {
  bucket = random_string.name.result

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
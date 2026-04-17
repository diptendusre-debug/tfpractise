resource "random_string" "randomName" {
  length  = 8
  special = false
}
resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket-${random_string.randomName.result}"
  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = "My bucket"
    Environment = "terraform-remote-state"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
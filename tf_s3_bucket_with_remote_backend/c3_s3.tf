resource "random_string" "randomName" {
  length  = 4
  special = false
  upper= false
}
resource "aws_s3_bucket" "bucket" {
  bucket = "diptendupractise-${random_string.randomName.result}"
  lifecycle {
    prevent_destroy = false
  }
  tags = var.tags
  }

resource "aws_s3_bucket" "bucket1" {
    count=length(var.bucket1)
    bucket = var.bucket1[count.index]
}
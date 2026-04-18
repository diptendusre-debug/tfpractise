output "mybucket_name" {
  value = aws_s3_bucket.mybucket.id
}
output "mybucket_arn" {
  value = aws_s3_bucket.mybucket.arn

}
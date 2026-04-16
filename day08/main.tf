
##count is used to create multiple resources based on a numeric value. It allows you to specify how many instances of a resource you want to create. In this example, we are using count to create multiple S3 buckets based on the length of the bucket1 variable.
resource "aws_s3_bucket" "bucket1" {
  count  = length(var.bucket1)
  bucket = var.bucket1[count.index]
}


##for_each is used to create multiple resources based on a map or set of strings. It allows you to iterate over the elements and create a resource for each element in the collection. In this example, we are using for_each to create multiple S3 buckets based on the values provided in the bucket2 variable.
resource "aws_s3_bucket" "bucket2" {
  for_each   = var.bucket2
  bucket     = each.value
  depends_on = [aws_s3_bucket.bucket1]

}
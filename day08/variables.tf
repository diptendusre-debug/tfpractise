variable "bucket1" {
  description = "The name of the first S3 bucket"
  type        = list(string)
  default     = ["diptendu-terraform-bucket1", "diptendu-terraform-bucket2"]
}
variable "bucket2" {
  description = "the name of the buckets to created"
  type        = set(string)
  default     = ["diptendu-terraform-bucket3", "diptendu-terraform-bucket4"]

}
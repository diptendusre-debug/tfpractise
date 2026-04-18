variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-west-2"
}
variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default     = "diptendumodulebucket"
}
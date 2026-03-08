variable "bucket1"{
  description = "The name of the first S3 bucket"
  type        = list(string)
    default     = ["diptendu-terraform-bucket1", "diptendu-terraform-bucket2"]  
}
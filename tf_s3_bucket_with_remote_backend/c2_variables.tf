variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
    Name        = "My bucket"
    Environment = "terraform-remote-state-demo"
  }
}
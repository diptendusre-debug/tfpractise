variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"


}
variable "subnet_newbits" {
  description = "The number of new bits to add to the CIDR block for subnetting"
  type        = number
  default     = 8

}
variable "tags" {
  description = "Tags to apply to the VPC and its resources"
  type        = map(string)
  default = {
    Environment = "development"
    Project     = "VPC Example"
  }
}
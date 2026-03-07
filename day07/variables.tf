variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "diptendu-tf"
}
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}
variable "subnet_cidr_block" {
  description = "the cidr block of subnet"
  type        = string
  default     = "10.0.0.0/28"

}
variable "subnet_name" {
  description = "Subnet tag"
  type        = string
  default     = "diptendu-vpc-subnet"
}
##### This is for Set type
variable "zone" {
  description = "The availability Zone"
  type        = set(string)
  default     = ["us-east-1a", "us-east-1b"]
}
variable "ami_id" {
  description = "AWS ami id based on the region"
  type        = string
  default     = "ami-0b6c6ebed2801a5cb"
}
variable "instance_type" {
  description = "AWS instance type"
  type        = string
  default     = "t3.micro"
}
variable "cpu" {
  description = "Number of cpu"
  type        = number
  default     = 2
}
variable "memory" {
  description = "number of memory in GB"
  type        = number
  default     = 1
}
variable "aws_machine_name" {
  description = "machine name"
  type        = string
  default     = "diptendu"
}

### This is for List Type
variable "security_group_cidr"{
    description="cidr blocks for the security group"
    type=list(string)
    default = [ "10.0.0.0/24","192.168.0.0/24" ]
}
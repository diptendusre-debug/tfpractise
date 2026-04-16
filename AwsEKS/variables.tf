variable "cidr_range" {
  description = "CIDR range for the VPC"
  type=string
  default     = "10.0.0.0/16"
}
variable "region"{
    description="AWS region to deploy the resources"
    type=list(string)
    default=["us-east-1a", "us-east-1b"]
}
variable "private_subnets"{
    description="Private subnets for the VPC"
    type=list(string)
    default=["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnets"{
    description="Public subnets for the VPC"
    type=list(string)
    default=["10.0.101.0/24", "10.0.102.0/24"]
}
variable "ami_type"{
    description="AMI type for EKS managed node groups"
    type=string
    default="AL2023_x86_64_STANDARD"

}
variable "instance_types"{
    description="Instance types for EKS managed node groups"
    type=list(string)
    default=["m5.xlarge"]
}
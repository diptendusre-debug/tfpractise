variable "region"{
    description = "This is to provide the region"
    type = string
    default = "us-east-1"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "tags"{
    description = "This is to provide the tags"
    type= map(string)
    default = {
      "Environment" = "dev-diptendu"
    }
}
variable "public_subnet1"{
    description="this is for the cidr for the public subnet1"
    type=string
    default="10.0.1.0/24"
}
variable "public_subnet2"{
    description="this is for the cidr for the public subnet2"
    type=string
    default="10.0.2.0/24"
}
variable "private_subnet1"{
    description="this is for the cidr for the private subnet1"
    type=string
    default="10.0.10.0/24"
    }
variable "private_subnet2"{
    description="this is for the cidr for the private subnet2"
    type=string
    default="10.0.11.0/24"
}
variable "ami" {
    description = "The AMI Value to use"
  
}
variable "instance_type"{
    description = "the instance type to use"
}
variable "tags"{
    description = "The tag to use"
    type=map(string)
}
variable "region"{
    description="the region you need to mention"
}
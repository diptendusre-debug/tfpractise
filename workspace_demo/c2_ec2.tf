module "ec2-instance" {
source  = "./modules/ec2"
ami = var.ami
instance_type = var.instance_type
region = var.region
tags = var.tags
}
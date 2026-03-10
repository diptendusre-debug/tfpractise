resource "random_id" "name" {
  byte_length = 8
}

module "vpc_example_complete" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "diptendu-eks-vpc-${random_id.name.id}"
  region = var.region
  cidr = var.cidrblock
  azs = ["${var.region}a","${var.region}b"]
  public_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24","10.0.4.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true
}
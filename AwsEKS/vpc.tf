resource "random_id" "eks" {
  byte_length = 8
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-eks"
  cidr = var.cidr_range

  azs                = var.region
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Create a list of availability zones for the specified region
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets     = [for i, availability_zone in local.availability_zones : cidrsubnet(var.vpc_cidr_block, var.subnet_newbits, i)]
  private_subnets    = [for i, availability_zone in local.availability_zones : cidrsubnet(var.vpc_cidr_block, var.subnet_newbits, i + 10)]
}
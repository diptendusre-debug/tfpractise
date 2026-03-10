resource "random_id" "name" {
  byte_length = 8
}

module "vpc_example_complete" {
  source  = "terraform-aws-modules/vpc/aws//examples/complete"
  version = "6.6.0"

  name="diptendu-eks-vpc-${random_id.name.id}"
  region = var.region
  cidr = var.cidrblock
}
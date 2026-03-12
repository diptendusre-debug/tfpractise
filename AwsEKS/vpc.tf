resource "random_id" "eks" {
  byte_length = 8
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-eks"
  cidr = "10.0.0.0/16"

  azs                = ["us-east-1a", "us-east-1b"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
resource "aws_security_group" "eks_security_group" {
  name        = "eks_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id
  tags = {
    Name = "eks_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.eks_security_group.id
  cidr_ipv4         = module.vpc.vpc_cidr_block
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.eks_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

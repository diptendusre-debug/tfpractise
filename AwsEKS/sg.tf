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
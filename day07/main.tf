resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = tolist(var.zone)[0]
#####using set here 

  tags = {
    Name = var.subnet_name
  }
}


resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.example.id

  cpu_options {
    core_count       = var.cpu
    threads_per_core = var.memory
  }

  tags = {
    Name = var.aws_machine_name
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.example.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.example.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
### using list here 
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.security_group_cidr[1]
  ip_protocol       = "-1" # semantically equivalent to all ports
}


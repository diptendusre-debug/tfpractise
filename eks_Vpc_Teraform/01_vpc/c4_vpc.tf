resource "aws_vpc" "example" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = var.tags
  lifecycle {
    prevent_destroy = false
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.example.id

  tags = var.tags
}

resource "aws_subnet" "public_subnet" {
  for_each                = { for idx, availability_zone in local.availability_zones : availability_zone => local.public_subnets[idx] }
  vpc_id                  = aws_vpc.example.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags                    = var.tags
}
resource "aws_subnet" "private_subnets" {
  for_each                = { for idx, availability_zone in local.availability_zones : availability_zone => local.private_subnets[idx] }
  vpc_id                  = aws_vpc.example.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = false
  tags                    = var.tags
}

resource "aws_eip" "nat_gw_ip" {
  tags = var.tags
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat_gw_ip.id
  subnet_id     = values(aws_subnet.public_subnet)[0].id
  tags          = var.tags

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.tags
}
resource "aws_route_table_association" "public_rt_assoc" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }

  tags = var.tags
}

resource "aws_route_table_association" "private_rt_assoc" {
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rt.id
}


#Creation of vpc
resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = var.tags
  enable_dns_hostnames = true
  enable_dns_support = true
  lifecycle {
    prevent_destroy = false
  }

}
#creation of igw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = var.tags
}

#creation of public subnet 

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet1
  # Use the first available AZ (e.g., us-east-1a)
  availability_zone = data.aws_availability_zones.available.names[0]
}
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet2
  # Use the first available AZ (e.g., us-east-1a)
  availability_zone = data.aws_availability_zones.available.names[1]
}


#creation of private subnet
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet1
  # Use the first available AZ (e.g., us-east-1a)
  availability_zone = data.aws_availability_zones.available.names[0]
}
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet2
  # Use the first available AZ (e.g., us-east-1a)
  availability_zone = data.aws_availability_zones.available.names[1]
}
# create route table for public subnet and associate with public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route_table_association" "public_assoc1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_assoc2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}


#allocate natgateway elastic ip 
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}


resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id # Place in a PUBLIC subnet

  tags = {
    Name = "main-nat-gateway"
  }

  # Ensure the Internet Gateway exists before creating the NAT Gateway
  depends_on = [aws_internet_gateway.myigw]
}

# ROute table for nat gateway 
resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id # Traffic goes TO the NAT GW
  }

  tags = {
    Name = "private-route-table"
  }
}
#Nat gateway route table association
resource "aws_route_table_association" "private_assoc1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}
resource "aws_route_table_association" "private_assoc2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}
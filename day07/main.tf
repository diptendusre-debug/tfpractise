resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.zone

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
resource "aws_instance" "example" {
  ami           = var.ami # Required: The AMI ID to use
  instance_type = var.instance_type             # Required: The instance size
  
  tags = var.tags
}

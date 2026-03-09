resource "aws_instance" "myec2" {
  ami           = var.amiid
  instance_type = var.instancetype

  tags = {
    Name = var.tagname
  }
  lifecycle {
    create_before_destroy = false
  }
}
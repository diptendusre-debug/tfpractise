# Fetch all AZs in the current region that are "available"
data "aws_availability_zones" "available" {
  state = "available"
}



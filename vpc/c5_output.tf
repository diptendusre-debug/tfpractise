output "VPC_ID" {
  value       = aws_vpc.example.id
  description = "The ID of the created VPC"

}

output "Public_Subnet_IDs" {
  value       = [for subnet in aws_subnet.public_subnet : subnet.id]
  description = "The IDs of the created public subnets"
}

output "Private_Subnet_IDs" {
  value       = [for subnet in aws_subnet.private_subnets : subnet.id]
  description = "The IDs of the created private subnets"
}

output "NAT_Gateway_ID" {
  value       = aws_nat_gateway.example.id
  description = "The ID of the created NAT Gateway"
}

output "vpcid"{
    value = aws_vpc.myvpc.id
}
output "igwid"{
    value = aws_internet_gateway.myigw.id
}
output "public_subnet1_id"{
    value = aws_subnet.public_subnet1.id
}
output "public_subnet2_id"{
    value = aws_subnet.public_subnet2.id
}
output "private_subnet1_id"{
    value = aws_subnet.private_subnet1.id
}
output "private_subnet2_id"{
    value = aws_subnet.private_subnet2.id
}       
output "natgw_eip" {
    value = aws_eip.nat_eip.public_ip
}
output "natgw_id"{
    value = aws_nat_gateway.natgw.id
}
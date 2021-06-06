output "vpc_id" {
	value = aws_vpc.alpha_vpc.id
}

#Public Subnet ID's

output "pb_subnet_1a" {
	value = aws_subnet.public_1a.id
}

#Private Subnet ID's
output "private_subnet" {
	value = aws_subnet.private_subnet1a.id
}

#Private Route Table ID
output "private_RT" {
	value = aws_route_table.private_RT.id
}

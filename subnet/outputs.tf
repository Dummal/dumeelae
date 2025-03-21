output "subnet_ids" {
  description = "IDs of the created subnets."
  value       = aws_subnet.subnet[*].id
}

output "subnet_cidr_blocks" {
  description = "CIDR blocks of the created subnets."
  value       = aws_subnet.subnet[*].cidr_block
}

output "public_route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public_route_table[0].id
}

output "private_route_table_id" {
  description = "ID of the private route table."
  value       = aws_route_table.private_route_table[0].id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway."
  value       = aws_nat_gateway.nat_gateway[0].id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = aws_internet_gateway.igw[0].id
}
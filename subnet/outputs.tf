output "subnet_ids" {
  description = "IDs of the created subnets."
  value       = aws_subnet.subnets[*].id
}

output "route_table_ids" {
  description = "IDs of the created route tables."
  value       = aws_route_table.route_table[*].id
}

output "nat_gateway_ids" {
  description = "IDs of the created NAT Gateways."
  value       = aws_nat_gateway.natgw[*].id
}

output "internet_gateway_id" {
  description = "ID of the created Internet Gateway."
  value       = aws_internet_gateway.igw[*].id
}
output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = aws_subnet.subnets[*].id
}

output "subnet_cidr_blocks" {
  description = "CIDR blocks of the created subnets"
  value       = aws_subnet.subnets[*].cidr_block
}

output "route_table_ids" {
  description = "IDs of the created route tables"
  value       = aws_route_table.route_tables[*].id
}

output "internet_gateway_id" {
  description = "ID of the created Internet Gateway (if applicable)"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_ids" {
  description = "IDs of the created NAT Gateways (if applicable)"
  value       = aws_nat_gateway.natgw[*].id
}

output "network_acl_id" {
  description = "ID of the created Network ACL"
  value       = aws_network_acl.network_acl.id
}
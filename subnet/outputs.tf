output "subnet_ids" {
  description = "IDs of the created subnets."
  value       = { for k, v in aws_subnet.subnets : k => v.id }
}

output "route_table_ids" {
  description = "IDs of the created route tables."
  value       = { for k, v in aws_route_table.route_tables : k => v.id }
}

output "internet_gateway_id" {
  description = "ID of the created Internet Gateway."
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "ID of the created NAT Gateway."
  value       = aws_nat_gateway.ngw.id
}

output "network_acl_id" {
  description = "ID of the created Network ACL."
  value       = aws_network_acl.network_acl.id
}
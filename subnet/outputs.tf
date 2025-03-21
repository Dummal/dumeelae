output "subnet_ids" {
  description = "IDs of the created subnets."
  value       = aws_subnet.subnets[*].id
}

output "public_route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public_rt[0].id
}

output "private_route_table_id" {
  description = "ID of the private route table."
  value       = aws_route_table.private_rt[0].id
}

output "network_acl_id" {
  description = "ID of the created Network ACL."
  value       = aws_network_acl.acl.id
}
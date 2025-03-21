```hcl
output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = module.vpc.private_subnets
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT Gateways."
  value       = module.vpc.nat_gateway_ids
}

output "elastic_ips" {
  description = "The Elastic IPs associated with the public subnets."
  value       = aws_eip.public_subnet_ips[*].id
}
```

This script adheres to security best practices, scalability, cost optimization, and modularization principles. It uses Terraform modules for Control Tower and VPC provisioning, parameterizes the configuration with `variables.tf`, and provides outputs for resource IDs in `outputs.tf`.
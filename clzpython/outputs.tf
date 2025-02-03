### **outputs.tf**
```hcl
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnets
}
```

---

### **modules/vpc/outputs.tf**
```hcl
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}
```

---

### Explanation:
1. **VPC**: A VPC is created with a CIDR block.
2. **Subnets**: Public and private subnets are created in multiple availability zones.
3. **Internet Gateway**: An internet gateway is attached to the VPC for public internet access.
4. **Route Tables**: A public route table is created and associated with public subnets.
5. **NAT Gateway**: If `enable_nat_gateway` is set to true, you can extend the configuration to include a NAT Gateway for private subnets.

This configuration provides a basic multi-AZ setup and can be extended to include additional resources like EC2 instances, RDS databases, or other AWS services. Let me know if you need further customization!
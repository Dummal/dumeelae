### **outputs.tf**
This file defines the outputs for the setup.

```hcl
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.web[*].id
}

output "ec2_instance_public_ips" {
  description = "The public IPs of the EC2 instances"
  value       = aws_instance.web[*].public_ip
}
```

---
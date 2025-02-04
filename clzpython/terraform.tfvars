### **terraform.tfvars**
This file provides values for the variables.

```hcl
aws_region = "us-west-2"
key_name   = "my-key-pair"

tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
}
```

---

### **Explanation of the Setup**
1. **VPC**: A single VPC is created with a CIDR block of `10.0.0.0/16`.
2. **Subnets**: Public subnets are created in multiple availability zones, each with its own CIDR block.
3. **Internet Gateway**: An internet gateway is attached to the VPC to allow internet access.
4. **Route Table**: A public route table is created and associated with the public subnets.
5. **Security Group**: A security group is created to allow SSH (port 22) and HTTP (port 80) access.
6. **EC2 Instances**: An EC2 instance is launched in each public subnet, using the latest Amazon Linux 2 AMI.
7. **Outputs**: Outputs include the VPC ID, public subnet IDs, EC2 instance IDs, and public IPs of the instances.

This configuration ensures a highly available setup by distributing resources across multiple availability zones.
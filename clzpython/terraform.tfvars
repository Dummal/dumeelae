### **`terraform.tfvars`**
```hcl
aws_region          = "us-west-2"
vpc_cidr            = "10.0.0.0/16"
availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
```

---

### Explanation of the Configuration:
1. **VPC**: A single VPC is created with the CIDR block specified in `terraform.tfvars`.
2. **Subnets**: Public subnets are created in each availability zone specified in the `availability_zones` variable.
3. **Internet Gateway**: An internet gateway is attached to the VPC to allow internet access.
4. **Route Table**: A route table is created with a route to the internet gateway, and it is associated with the public subnets.
5. **Multi-AZ Setup**: The configuration ensures that subnets are distributed across multiple availability zones for high availability.

You can customize the CIDR blocks, availability zones, and other parameters in the `terraform.tfvars` file to suit your specific requirements.
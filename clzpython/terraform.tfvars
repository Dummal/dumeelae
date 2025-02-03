### **terraform.tfvars**
```hcl
aws_region          = "us-west-2"
vpc_cidr            = "10.0.0.0/16"
availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
```

---

### Explanation of the Configuration:
1. **VPC**: A single VPC is created with a CIDR block of `10.0.0.0/16`.
2. **Subnets**: Public subnets are created in each availability zone specified in the `availability_zones` variable.
3. **Internet Gateway**: An internet gateway is attached to the VPC to allow internet access.
4. **Route Table**: A route table is created with a route to the internet gateway, and it is associated with the public subnets.
5. **Variables**: The configuration is parameterized using variables for flexibility.
6. **Outputs**: Outputs are defined to provide the IDs of the created resources.

This configuration can be extended further to include private subnets, NAT gateways, and other resources as needed. Let me know if you need additional configurations!
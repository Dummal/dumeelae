### **`variables.tf`**
```hcl
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
```

---

2. **`variables.tf`**:
   - Defines input variables for the AWS region, VPC CIDR block, availability zones, and public subnet CIDRs.
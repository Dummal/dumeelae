```hcl
variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "The AWS account ID for the master account."
  type        = string
  default     = "123456789631"
}

variable "master_account_email" {
  description = "The email address for the master account."
  type        = string
  default     = "ghyut@fggg.io"
}

variable "organizational_units" {
  description = "List of organizational units (OUs) for the Landing Zone."
  type        = list(string)
  default     = ["development"]
}

variable "shared_account_emails" {
  description = "Email addresses for shared accounts."
  type        = list(string)
  default     = ["development@thu.io"]
}

variable "security_account_email" {
  description = "Email address for the Security account."
  type        = string
  default     = "development@thu.io"
}

variable "audit_account_email" {
  description = "Email address for the Audit account."
  type        = string
  default     = "development@thu.io"
}

variable "aft_logs_bucket_name" {
  description = "The name of the S3 bucket for AFT logs."
  type        = string
  default     = "development"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "LandingZoneVPC"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use."
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets."
  type        = bool
  default     = true
}

variable "elastic_ips_count" {
  description = "Number of Elastic IPs required for public subnets."
  type        = number
  default     = 2
}

variable "create_internet_gateway" {
  description = "Create an Internet Gateway for public subnets."
  type        = bool
  default     = true
}

variable "create_public_route_table" {
  description = "Create a route table for public subnets."
  type        = bool
  default     = true
}

variable "create_private_route_table" {
  description = "Create a route table for private subnets."
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default     = {
    "Environment" = "LandingZone",
    "Project"     = "AWSControlTower"
  }
}
```
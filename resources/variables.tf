```hcl
variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "AWS Master Account ID"
  type        = string
  default     = "123456789631"
}

variable "master_account_email" {
  description = "Email address for the master account"
  type        = string
  default     = "ghyut@fggg.io"
}

variable "organizational_units" {
  description = "List of organizational units to create in the Landing Zone"
  type        = list(string)
  default     = ["development"]
}

variable "ou_emails" {
  description = "Email addresses for Organizational Unit accounts"
  type        = map(string)
  default     = {
    development = "development@thu.io"
  }
}

variable "security_audit_emails" {
  description = "Email addresses for Security and Audit accounts"
  type        = map(string)
  default     = {
    security = "development@thu.io",
    audit    = "development@thu.io"
  }
}

variable "aft_logs_bucket_name" {
  description = "S3 bucket name for AFT logs"
  type        = string
  default     = "development"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones to use in the region"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "enable_nat_gateway" {
  description = "Flag to enable NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "enable_internet_gateway" {
  description = "Flag to enable Internet Gateway for public subnets"
  type        = bool
  default     = true
}

variable "elastic_ips_count" {
  description = "Number of Elastic IPs to allocate for NAT Gateway or other resources"
  type        = number
  default     = 2
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "LandingZone",
    Project     = "AWS Control Tower",
    Owner       = "ghyut@fggg.io"
  }
}
```
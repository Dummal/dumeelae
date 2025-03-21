```hcl
variable "aws_region" {
  description = "AWS region for the Landing Zone"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "Master AWS account ID"
  type        = string
  default     = "123456789631"
}

variable "master_account_email" {
  description = "Email address for the master AWS account"
  type        = string
  default     = "ghyut@fggg.io"
}

variable "development_account_email" {
  description = "Email address for the development organizational unit"
  type        = string
  default     = "development@thu.io"
}

variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs"
  type        = string
  default     = "development"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones to use in the region"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
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

variable "create_nat_gateway" {
  description = "Create a NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "create_internet_gateway" {
  description = "Create an Internet Gateway for public subnets"
  type        = bool
  default     = true
}

variable "elastic_ips" {
  description = "Number of Elastic IPs needed for public subnets"
  type        = number
  default     = 2
}

variable "common_tags" {
  description = "Common tags to apply across all resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "Landing Zone"
    Owner       = "ghyut@fggg.io"
  }
}
```
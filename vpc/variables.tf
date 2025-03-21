variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "region" {
  description = "AWS region for deployment"
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Boolean to enable NAT Gateway"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  default     = "default"
}
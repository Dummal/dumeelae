variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of CIDR blocks for private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones for subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to enable a NAT Gateway for private subnets."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The environment name (e.g., development, production)."
  type        = string
}

variable "aft_logs_bucket_name" {
  description = "The name of the S3 bucket for AFT logs."
  type        = string
}
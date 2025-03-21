variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, prod)."
  type        = string
}

variable "account_email" {
  description = "Email address for the new AWS account."
  type        = string
}

variable "organization_role_name" {
  description = "Role name for the organization account."
  type        = string
}

variable "config_s3_bucket" {
  description = "S3 bucket for AWS Config delivery channel."
  type        = string
}

variable "customer_gateway_id" {
  description = "ID of the customer gateway for VPN connection."
  type        = string
}

variable "domain_name" {
  description = "Domain name for Route 53 hosted zone."
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources."
  type        = map(string)
}
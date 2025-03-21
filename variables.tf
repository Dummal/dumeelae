variable "master_account_id" {
  description = "The ID of the master AWS account."
  type        = string
}

variable "enable_control_tower" {
  description = "Enable or disable AWS Control Tower."
  type        = bool
}

variable "master_account_email" {
  description = "Email address of the master AWS account."
  type        = string
}

variable "organizational_units" {
  description = "List of organizational units (OUs) for the landing zone."
  type        = list(string)
}

variable "aws_region" {
  description = "AWS region for the landing zone."
  type        = string
}

variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs."
  type        = string
}

variable "public_vpc_cidr" {
  description = "CIDR block for the public VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "private_vpc_cidr" {
  description = "CIDR block for the private VPC."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "aws_availability_zone" {
  description = "AWS availability zone for the VPC."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch."
  type        = bool
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}
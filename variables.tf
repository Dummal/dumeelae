variable "master_account_id" {
  description = "The AWS account ID of the master account."
  type        = string
}

variable "enable_control_tower" {
  description = "Flag to enable AWS Control Tower."
  type        = bool
}

variable "master_account_email" {
  description = "Email address of the master AWS account."
  type        = string
}

variable "organizational_units" {
  description = "List of organizational units (OUs) to create in the landing zone."
  type        = list(string)
}

variable "aws_region" {
  description = "AWS region where resources will be provisioned."
  type        = string
}

variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs."
  type        = string
}

variable "public_vpc_cidr" {
  description = "CIDR block for public VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnets."
  type        = string
}

variable "private_vpc_cidr" {
  description = "CIDR block for private VPC."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnets."
  type        = string
}

variable "aws_availability_zone" {
  description = "Availability zone for the VPC."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to associate subnets."
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
  description = "Flag to map public IPs on launch for public subnets."
  type        = bool
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}

variable "development_account_email" {
  description = "Email address for the development account."
  type        = string
}
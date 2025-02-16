```hcl
variable "organization_name" {
  type        = string
  description = "The name of the AWS organization."
}

variable "parent_id" {
  type        = string
  description = "The parent ID for the organizational unit."
}

variable "users_email" {
  type        = string
  description = "The email address for the AWS account user."
}

variable "enable_control_tower" {
  type        = bool
  description = "Flag to enable or disable AWS Control Tower."
}

variable "master_account_email" {
  type        = string
  description = "The email address for the master account."
}

variable "organizational_units" {
  type        = list(string)
  description = "List of organizational units to be created."
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources in."
}

variable "master_account_id" {
  type        = string
  description = "The ID of the master account."
}

variable "aft_logs_bucket_name" {
  type        = string
  description = "The name of the S3 bucket for AFT logs."
}

variable "public_vpc_cidr" {
  type        = string
  description = "The CIDR block for the public VPC."
}

variable "public_subnet_cidr" {
  type        = string
  description = "The CIDR block for the public subnet."
}

variable "private_vpc_cidr" {
  type        = string
  description = "The CIDR block for the private VPC."
}

variable "private_subnet_cidr" {
  type        = string
  description = "The CIDR block for the private subnet."
}

variable "aws_availability_zone" {
  type        = string
  description = "The AWS availability zone for the VPC."
}
```

---
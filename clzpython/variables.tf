```hcl
variable "organization_name" {
  type        = string
  description = "The name of the AWS organization."
}

variable "parent_id" {
  type        = string
  description = "The parent ID for the organizational units."
}

variable "users_email" {
  type        = map(string)
  description = "A map of user emails for AWS accounts (e.g., dev, prod, shared, security, audit)."
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
  description = "A list of organizational units to be created."
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources in."
}

variable "master_account_id" {
  type        = string
  description = "The AWS account ID of the master account."
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

variable "dev_account_email" {
  type        = string
  description = "The email address for the Dev account."
}

variable "prod_account_email" {
  type        = string
  description = "The email address for the Prod account."
}

variable "shared_account_email" {
  type        = string
  description = "The email address for the Shared account."
}

variable "security_account_email" {
  type        = string
  description = "The email address for the Security account."
}

variable "audit_account_email" {
  type        = string
  description = "The email address for the Audit account."
}
```

---
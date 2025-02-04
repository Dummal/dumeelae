variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-west-2"
}

variable "enable_control_tower" {
  description = "Flag to enable or disable AWS Control Tower."
  type        = bool
}

variable "master_account_email" {
  description = "Email address for the master account."
  type        = string
}

variable "master_account_id" {
  description = "AWS account ID for the master account."
  type        = string
}

variable "organizational_units" {
  description = "List of organizational units to be created."
  type        = list(string)
}

variable "dev_account_email" {
  description = "Email address for the Dev account."
  type        = string
}

variable "prod_account_email" {
  description = "Email address for the Prod account."
  type        = string
}

variable "shared_account_email" {
  description = "Email address for the Shared account."
  type        = string
}

variable "security_account_email" {
  description = "Email address for the Security account."
  type        = string
}

variable "audit_account_email" {
  description = "Email address for the Audit account."
  type        = string
}

variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for storing AFT logs."
  type        = string
}

variable "organization_name" {
  description = "Name of the AWS Organization."
  type        = string
}

variable "parent_id" {
  description = "Parent ID for the organizational units."
  type        = string
}

variable "users_email" {
  description = "List of email addresses for users in the organization."
  type        = list(string)
}
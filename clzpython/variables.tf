variable "aws_region" {
  description = "The AWS region to deploy the Control Tower landing zone"
  type        = string
  default     = "us-west-2"
}

variable "enable_control_tower" {
  description = "Flag to enable AWS Control Tower if not already enabled"
  type        = bool
  default     = true
}

variable "master_account_email" {
  description = "Email address for the master account"
  type        = string
}

variable "master_account_id" {
  description = "AWS account ID of the master account"
  type        = string
}

variable "organizational_units" {
  description = "List of organizational units to create"
  type        = list(string)
  default     = ["Security", "Audit Log", "Sandbox"]
}

variable "dev_account_email" {
  description = "Email address for the Dev account"
  type        = string
}

variable "prod_account_email" {
  description = "Email address for the Prod account"
  type        = string
}

variable "shared_account_email" {
  description = "Email address for the Shared account"
  type        = string
}

variable "security_account_email" {
  description = "Email address for the Security account"
  type        = string
}

variable "audit_account_email" {
  description = "Email address for the Audit account"
  type        = string
}

variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs"
  type        = string
}

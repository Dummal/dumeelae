variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "eu-west-1"
}

variable "account_name" {
  description = "Name of the new AWS account"
  type        = string
}

variable "account_email" {
  description = "Email for the new AWS account"
  type        = string
}

variable "account_role_name" {
  description = "IAM role name for the new AWS account"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role for Control Tower operations"
  type        = string
  default     = "ti-control-tower-role"
}

variable "policy_name" {
  description = "Name of the IAM policy for Control Tower operations"
  type        = string
  default     = "ti-control-tower-policy"
}

variable "secrets_name" {
  description = "Name of the Secrets Manager secret"
  type        = string
  default     = "ti-control-tower-secret"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic for alerts"
  type        = string
  default     = "ti-alerts-topic"
}

variable "sns_alert_email" {
  description = "Email address for SNS alerts"
  type        = string
}

variable "dns_domain_name" {
  description = "Domain name for Route 53 DNS management"
  type        = string
}

variable "retention_bucket_name" {
  description = "Name of the S3 bucket for data retention"
  type        = string
}

variable "retention_transition_days" {
  description = "Number of days before transitioning to Glacier storage"
  type        = number
  default     = 2555
}

variable "retention_expiration_days" {
  description = "Number of days before data expiration"
  type        = number
  default     = 2555
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
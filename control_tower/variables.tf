variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "account_name" {
  description = "Name for the AWS account to be created"
  type        = string
}

variable "account_email" {
  description = "Email for the AWS account to be created"
  type        = string
}

variable "environment" {
  description = "Environment for the resources (e.g., dev, prod)"
  type        = string
}

variable "service_name" {
  description = "Name of the service being deployed"
  type        = string
}

variable "naming_prefix" {
  description = "Prefix for naming resources"
  type        = string
  default     = "ti-"
}

variable "domain_name" {
  description = "Domain name for DNS management"
  type        = string
}

variable "alert_email" {
  description = "Email address for SNS alerts"
  type        = string
}

variable "archive_transition_days" {
  description = "Number of days before transitioning data to Glacier"
  type        = number
  default     = 30
}

variable "retention_period_days" {
  description = "Number of days for data retention before deletion"
  type        = number
  default     = 2555
}
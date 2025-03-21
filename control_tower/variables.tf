variable "aws_region" {
  description = "AWS region where resources will be deployed."
  type        = string
  default     = "eu-west-1"
}

variable "prefix" {
  description = "Prefix for naming resources."
  type        = string
  default     = "ti-"
}

variable "environment" {
  description = "Environment for resources (e.g., dev, prod)."
  type        = string
}

variable "allowed_regions" {
  description = "List of allowed AWS regions."
  type        = list(string)
  default     = ["eu-west-1", "eu-central-1"]
}

variable "vpn_configuration" {
  description = "VPN configuration for secure on-premises integration."
  type        = map(string)
}

variable "siem_integration" {
  description = "Integration with existing SIEM system."
  type        = bool
}

variable "compliance_rules" {
  description = "Compliance rules to enforce security baselines."
  type        = bool
}

variable "patch_management_enabled" {
  description = "Enable AWS Systems Manager Patch Manager for automated patching."
  type        = bool
}

variable "data_retention_years" {
  description = "Number of years to retain data."
  type        = number
  default     = 7
}

variable "quota_management_enabled" {
  description = "Enable monitoring and requesting quota increases."
  type        = bool
}

variable "security_hub_enabled" {
  description = "Enable AWS Security Hub for compliance monitoring."
  type        = bool
}

variable "license_manager_enabled" {
  description = "Enable AWS License Manager for software license management."
  type        = bool
}

variable "secrets_manager_enabled" {
  description = "Enable AWS Secrets Manager for secret management."
  type        = bool
}

variable "route53_enabled" {
  description = "Enable Amazon Route 53 for DNS management."
  type        = bool
}

variable "tagging_policy_enforced" {
  description = "Enforce mandatory tagging policies."
  type        = bool
}

variable "lifecycle_policy_enabled" {
  description = "Enable lifecycle policies for data archiving."
  type        = bool
}

variable "gdpr_compliance_required" {
  description = "Enforce GDPR compliance."
  type        = bool
}

variable "sns_alerts_enabled" {
  description = "Enable AWS SNS for alerting."
  type        = bool
}

variable "kms_encryption_enabled" {
  description = "Enable encryption using AWS KMS."
  type        = bool
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}
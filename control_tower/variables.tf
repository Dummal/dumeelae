variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
  default     = "eu-west-1"
}

variable "prefix" {
  description = "Naming prefix for resources."
  type        = string
  default     = "ti-"
}

variable "enable_custom_guardrails" {
  description = "Enable custom guardrails for Control Tower."
  type        = bool
  default     = true
}

variable "allowed_regions" {
  description = "Regions where resources can be created."
  type        = list(string)
  default     = ["eu-west-1", "eu-central-1"]
}

variable "data_residency_region" {
  description = "Region for data residency compliance."
  type        = string
  default     = "eu-west-1"
}

variable "enable_vpn" {
  description = "Enable VPN connectivity for secure on-premises integration."
  type        = bool
  default     = true
}

variable "enable_siem_integration" {
  description = "Enable integration with SIEM system."
  type        = bool
  default     = true
}

variable "enable_rbac" {
  description = "Enable role-based access control."
  type        = bool
  default     = true
}

variable "enable_config_rules" {
  description = "Enable AWS Config rules for compliance monitoring."
  type        = bool
  default     = true
}

variable "enable_patch_management" {
  description = "Enable AWS Systems Manager Patch Manager for patching."
  type        = bool
  default     = true
}

variable "data_retention_duration" {
  description = "Data retention duration in years."
  type        = number
  default     = 7
}

variable "enable_security_hub" {
  description = "Enable AWS Security Hub for compliance enforcement."
  type        = bool
  default     = true
}

variable "enable_license_manager" {
  description = "Enable AWS License Manager for software license management."
  type        = bool
  default     = true
}

variable "enable_secrets_manager" {
  description = "Enable AWS Secrets Manager for secret management."
  type        = bool
  default     = true
}

variable "enable_route_53" {
  description = "Enable Amazon Route 53 for DNS management."
  type        = bool
  default     = true
}

variable "enable_tagging_policies" {
  description = "Enable mandatory tagging policies."
  type        = bool
  default     = true
}

variable "enable_data_lifecycle" {
  description = "Enable lifecycle policies for data archiving."
  type        = bool
  default     = true
}

variable "enable_sns_alerts" {
  description = "Enable AWS SNS for alerting."
  type        = bool
  default     = true
}

variable "enable_kms_encryption" {
  description = "Enable AWS KMS for data encryption."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
  default     = "ti-"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "eu-west-1"
}

variable "allowed_regions" {
  description = "List of allowed AWS regions for resource creation"
  type        = list(string)
  default     = ["eu-west-1", "eu-central-1"]
}

variable "data_residency" {
  description = "Data residency requirement"
  type        = string
  default     = "EU"
}

variable "enable_custom_guardrails" {
  description = "Enable custom guardrails for resource creation"
  type        = bool
  default     = true
}

variable "compliance_frameworks" {
  description = "Compliance frameworks to enforce"
  type        = list(string)
  default     = ["GDPR"]
}

variable "vpn_connection" {
  description = "Enable VPN connection for on-premises integration"
  type        = bool
  default     = true
}

variable "siem_integration" {
  description = "Enable integration with existing SIEM system"
  type        = bool
  default     = true
}

variable "patch_management" {
  description = "Enable AWS Systems Manager Patch Manager for patching"
  type        = bool
  default     = true
}

variable "data_retention_policy" {
  description = "Data retention policy duration in years"
  type        = number
  default     = 7
}

variable "resource_quotas_management" {
  description = "Enable resource quotas monitoring and management"
  type        = bool
  default     = true
}

variable "infrastructure_compliance" {
  description = "Enable AWS Config and Security Hub for compliance monitoring"
  type        = bool
  default     = true
}

variable "software_licensing" {
  description = "Enable AWS License Manager for software license management"
  type        = bool
  default     = true
}

variable "secrets_management" {
  description = "Enable AWS Secrets Manager for secret management"
  type        = bool
  default     = true
}

variable "dns_management" {
  description = "Enable Amazon Route 53 for DNS management"
  type        = bool
  default     = true
}

variable "resource_tagging" {
  description = "Enforce mandatory tagging policies"
  type        = bool
  default     = true
}

variable "data_lifecycle_management" {
  description = "Enable lifecycle policies for data archiving"
  type        = bool
  default     = true
}

variable "aws_sns_alerts" {
  description = "Enable AWS SNS for alerting"
  type        = bool
  default     = true
}

variable "data_encryption" {
  description = "Enable data encryption at rest and in transit"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    "Environment" = "Production"
    "Owner"       = "ControlTowerTeam"
  }
}
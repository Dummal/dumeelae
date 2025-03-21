variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "Master AWS Account ID"
  type        = string
}

variable "control_tower_admin_role_name" {
  description = "Name for Control Tower Admin IAM Role"
  type        = string
  default     = "ControlTowerAdminRole"
}

variable "aft_execution_role_name" {
  description = "Name for AFT Lambda Execution IAM Role"
  type        = string
  default     = "AFTExecutionRole"
}

variable "aft_account_provisioning_role_name" {
  description = "Name for AFT Account Provisioning IAM Role"
  type        = string
  default     = "AFTAccountProvisioningRole"
}

variable "aft_admin_role_name" {
  description = "Name for AFT Admin IAM Role"
  type        = string
  default     = "AFTAdminRole"
}

variable "control_tower_admin_policy_name" {
  description = "Name for Control Tower Admin IAM Policy"
  type        = string
  default     = "ControlTowerAdminPolicy"
}

variable "aft_execution_policy_name" {
  description = "Name for AFT Lambda Execution IAM Policy"
  type        = string
  default     = "AFTExecutionPolicy"
}

variable "aft_account_provisioning_policy_name" {
  description = "Name for AFT Account Provisioning IAM Policy"
  type        = string
  default     = "AFTAccountProvisioningPolicy"
}

variable "aft_admin_policy_name" {
  description = "Name for AFT Admin IAM Policy"
  type        = string
  default     = "AFTAdminPolicy"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    "Environment" = "LandingZone"
    "Project"     = "ControlTowerAFT"
  }
}
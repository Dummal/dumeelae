variable "region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "Master AWS account ID"
  type        = string
}

variable "control_tower_admin_role_name" {
  description = "Name of the Control Tower Admin Role"
  type        = string
  default     = "ControlTowerAdminRole"
}

variable "aft_execution_role_name" {
  description = "Name of the AFT Execution Role"
  type        = string
  default     = "AFTExecutionRole"
}

variable "aft_account_provisioning_role_name" {
  description = "Name of the AFT Account Provisioning Role"
  type        = string
  default     = "AFTAccountProvisioningRole"
}

variable "aft_admin_role_name" {
  description = "Name of the AFT Admin Role"
  type        = string
  default     = "AFTAdminRole"
}

variable "control_tower_admin_policy_name" {
  description = "Name of the Control Tower Admin Policy"
  type        = string
  default     = "ControlTowerAdminPolicy"
}

variable "aft_execution_policy_name" {
  description = "Name of the AFT Execution Policy"
  type        = string
  default     = "AFTExecutionPolicy"
}

variable "aft_account_provisioning_policy_name" {
  description = "Name of the AFT Account Provisioning Policy"
  type        = string
  default     = "AFTAccountProvisioningPolicy"
}

variable "aft_admin_policy_name" {
  description = "Name of the AFT Admin Policy"
  type        = string
  default     = "AFTAdminPolicy"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Project = "AWSControlTower"
    Owner   = "Admin"
  }
}
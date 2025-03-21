variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "Master AWS Account ID"
  type        = string
  default     = "123456789631"
}

variable "control_tower_admin_role_name" {
  description = "Name for Control Tower Admin Role"
  type        = string
  default     = "ControlTowerAdminRole"
}

variable "aft_execution_role_name" {
  description = "Name for AFT Execution Role"
  type        = string
  default     = "AFTExecutionRole"
}

variable "aft_account_provisioning_role_name" {
  description = "Name for AFT Account Provisioning Role"
  type        = string
  default     = "AFTAccountProvisioningRole"
}

variable "aft_admin_role_name" {
  description = "Name for AFT Admin Role"
  type        = string
  default     = "AFTAdminRole"
}

variable "control_tower_admin_policy_name" {
  description = "Name for Control Tower Admin Policy"
  type        = string
  default     = "ControlTowerAdminPolicy"
}

variable "aft_execution_policy_name" {
  description = "Name for AFT Execution Policy"
  type        = string
  default     = "AFTExecutionPolicy"
}

variable "aft_account_provisioning_policy_name" {
  description = "Name for AFT Account Provisioning Policy"
  type        = string
  default     = "AFTAccountProvisioningPolicy"
}

variable "aft_admin_policy_name" {
  description = "Name for AFT Admin Policy"
  type        = string
  default     = "AFTAdminPolicy"
}

variable "control_tower_admin_policy_document" {
  description = "Path to JSON document for Control Tower Admin Policy"
  type        = string
}

variable "aft_execution_policy_document" {
  description = "Path to JSON document for AFT Execution Policy"
  type        = string
}

variable "aft_account_provisioning_policy_document" {
  description = "Path to JSON document for AFT Account Provisioning Policy"
  type        = string
}

variable "aft_admin_policy_document" {
  description = "Path to JSON document for AFT Admin Policy"
  type        = string
}

variable "common_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
variable "control_tower_admin_role_name" {
  description = "Name of the Control Tower Admin Role"
  type        = string
}

variable "aft_execution_role_name" {
  description = "Name of the AFT Execution Role"
  type        = string
}

variable "aft_account_provisioning_role_name" {
  description = "Name of the AFT Account Provisioning Role"
  type        = string
}

variable "aft_admin_role_name" {
  description = "Name of the AFT Admin Role"
  type        = string
}

variable "aft_execution_policy_name" {
  description = "Name of the AFT Execution Policy"
  type        = string
}

variable "aft_account_provisioning_policy_name" {
  description = "Name of the AFT Account Provisioning Policy"
  type        = string
}

variable "aft_admin_policy_name" {
  description = "Name of the AFT Admin Policy"
  type        = string
}

variable "master_account_id" {
  description = "AWS Master Account ID"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
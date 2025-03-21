variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "AWS master account ID"
  type        = string
  default     = "123456789631"
}

variable "control_tower_admin_role_name" {
  description = "Name of the Control Tower Admin IAM Role"
  type        = string
  default     = "ControlTowerAdminRole"
}

variable "aft_execution_role_name" {
  description = "Name of the AFT Execution IAM Role"
  type        = string
  default     = "AFTExecutionRole"
}

variable "aft_provisioning_role_name" {
  description = "Name of the AFT Provisioning IAM Role"
  type        = string
  default     = "AFTProvisioningRole"
}

variable "aft_admin_role_name" {
  description = "Name of the AFT Admin IAM Role"
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

variable "aft_provisioning_policy_name" {
  description = "Name of the AFT Provisioning Policy"
  type        = string
  default     = "AFTProvisioningPolicy"
}

variable "aft_admin_policy_name" {
  description = "Name of the AFT Admin Policy"
  type        = string
  default     = "AFTAdminPolicy"
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {
    "Environment" = "Development"
    "Owner"       = "ControlTower"
  }
}
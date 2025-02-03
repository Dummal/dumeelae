variable "enable_aws_organizations" {
  type    = bool
  default = true
}

variable "aws_organization_features" {
  type    = string
  default = "ALL"
}

variable "enabled_policy_types" {
  type    = list(string)
  default = ["SERVICE_CONTROL_POLICY", "TAG_POLICY"]
}

variable "organizational_units" {
  type = list(object({
    name = string
    tags = map(string)
  }))
  default = [
    {
      name = "Security"
      tags = {
        Environment = "Production"
        Purpose     = "Security"
      }
    },
    {
      name = "Audit Log"
      tags = {
        Environment = "Production"
        Purpose     = "Audit"
      }
    }
  ]
}

variable "service_control_policies" {
  type = list(object({
    name       = string
    statement  = object({
      effect    = string
      actions   = list(string)
      principal = string
    })
    conditions = map(string)
    attach_to  = string
  }))
  default = [
    {
      name = "DenyRootUser"
      statement = {
        effect    = "Deny"
        actions   = ["*"]
        principal = "arn:aws:iam::*:root"
      }
      conditions = {}
      attach_to  = "root"
    }
  ]
}

variable "enable_control_tower" {
  type    = bool
  default = true
}

variable "master_account_email" {
  type    = string
  default = ""
}

variable "control_tower_region" {
  type    = string
  default = ""
}

variable "output_organization_ids" {
  type    = bool
  default = true
}
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "control_tower" {
  source = "./modules/control_tower"

  prefix                      = var.prefix
  environment                 = var.environment
  allowed_regions             = var.allowed_regions
  data_residency              = var.data_residency
  compliance_frameworks       = var.compliance_frameworks
  enable_custom_guardrails    = var.enable_custom_guardrails
  vpn_connection              = var.vpn_connection
  siem_integration            = var.siem_integration
  patch_management            = var.patch_management
  data_retention_policy       = var.data_retention_policy
  resource_quotas_management  = var.resource_quotas_management
  infrastructure_compliance   = var.infrastructure_compliance
  software_licensing          = var.software_licensing
  secrets_management          = var.secrets_management
  dns_management              = var.dns_management
  resource_tagging            = var.resource_tagging
  data_lifecycle_management   = var.data_lifecycle_management
  aws_sns_alerts              = var.aws_sns_alerts
  data_encryption             = var.data_encryption
}

resource "aws_iam_role" "control_tower_role" {
  name               = "${var.prefix}-${var.environment}-control-tower-role"
  assume_role_policy = data.aws_iam_policy_document.control_tower_assume_role_policy.json

  tags = var.tags
}

resource "aws_iam_policy" "control_tower_policy" {
  name        = "${var.prefix}-${var.environment}-control-tower-policy"
  description = "Policy for Control Tower service actions"

  policy = data.aws_iam_policy_document.control_tower_policy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "control_tower_attachment" {
  role       = aws_iam_role.control_tower_role.name
  policy_arn = aws_iam_policy.control_tower_policy.arn
}

data "aws_iam_policy_document" "control_tower_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["controltower.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "control_tower_policy" {
  statement {
    actions = [
      "organizations:CreateAccount",
      "organizations:DescribeCreateAccountStatus",
      "iam:CreateRole",
      "iam:AttachRolePolicy",
      "organizations:EnableAWSServiceAccess",
      "organizations:ListAccounts",
      "organizations:ListAWSServiceAccessForOrganization"
    ]

    resources = ["*"]
  }
}

output "control_tower_role_arn" {
  description = "The ARN of the Control Tower IAM role"
  value       = aws_iam_role.control_tower_role.arn
}

output "control_tower_policy_arn" {
  description = "The ARN of the Control Tower IAM policy"
  value       = aws_iam_policy.control_tower_policy.arn
}
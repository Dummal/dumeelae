provider "aws" {
  region = var.aws_region
}

module "control_tower" {
  source = "terraform-aws-modules/control-tower/aws"

  prefix                      = var.prefix
  enable_custom_guardrails    = var.enable_custom_guardrails
  allowed_regions             = var.allowed_regions
  data_residency_region       = var.data_residency_region
  enable_vpn                  = var.enable_vpn
  enable_siem_integration     = var.enable_siem_integration
  enable_rbac                 = var.enable_rbac
  enable_config_rules         = var.enable_config_rules
  enable_patch_management     = var.enable_patch_management
  data_retention_duration     = var.data_retention_duration
  enable_security_hub         = var.enable_security_hub
  enable_license_manager      = var.enable_license_manager
  enable_secrets_manager      = var.enable_secrets_manager
  enable_route_53             = var.enable_route_53
  enable_tagging_policies     = var.enable_tagging_policies
  enable_data_lifecycle       = var.enable_data_lifecycle
  enable_sns_alerts           = var.enable_sns_alerts
  enable_kms_encryption       = var.enable_kms_encryption
}

resource "aws_iam_role" "control_tower_role" {
  name               = "${var.prefix}_control_tower_role"
  assume_role_policy = data.aws_iam_policy_document.control_tower_assume_policy.json

  tags = var.tags
}

resource "aws_iam_policy" "control_tower_policy" {
  name        = "${var.prefix}_control_tower_policy"
  description = "Policy for Control Tower actions"
  policy      = data.aws_iam_policy_document.control_tower_policy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "control_tower_policy_attachment" {
  role       = aws_iam_role.control_tower_role.name
  policy_arn = aws_iam_policy.control_tower_policy.arn
}

output "control_tower_role_arn" {
  value       = aws_iam_role.control_tower_role.arn
  description = "ARN of the Control Tower IAM Role."
}
provider "aws" {
  region = var.aws_region
}

module "control_tower_account_factory" {
  source = "terraform-aws-modules/control-tower/aws"

  prefix                      = var.prefix
  environment                 = var.environment
  allowed_regions             = var.allowed_regions
  vpn_configuration           = var.vpn_configuration
  siem_integration            = var.siem_integration
  compliance_rules            = var.compliance_rules
  patch_management_enabled    = var.patch_management_enabled
  data_retention_years        = var.data_retention_years
  quota_management_enabled    = var.quota_management_enabled
  security_hub_enabled        = var.security_hub_enabled
  license_manager_enabled     = var.license_manager_enabled
  secrets_manager_enabled     = var.secrets_manager_enabled
  route53_enabled             = var.route53_enabled
  tagging_policy_enforced     = var.tagging_policy_enforced
  lifecycle_policy_enabled    = var.lifecycle_policy_enabled
  gdpr_compliance_required    = var.gdpr_compliance_required
  sns_alerts_enabled          = var.sns_alerts_enabled
  kms_encryption_enabled      = var.kms_encryption_enabled
}

resource "aws_iam_role" "control_tower_role" {
  name               = "${var.prefix}-${var.environment}-control-tower-role"
  assume_role_policy = data.aws_iam_policy_document.control_tower_assume_role_policy.json

  tags = var.tags
}

resource "aws_iam_policy" "control_tower_policy" {
  name        = "${var.prefix}-${var.environment}-control-tower-policy"
  description = "Policy for Control Tower with least privilege access."

  policy = data.aws_iam_policy_document.control_tower_policy.json

  tags = var.tags
}

resource "aws_config_config_rule" "gdpr_compliance_rule" {
  name        = "${var.prefix}-${var.environment}-gdpr-compliance-rule"
  description = "AWS Config rule to monitor GDPR compliance."
  source {
    owner             = "AWS"
    source_identifier = "GDPRCompliance"
  }

  tags = var.tags
}

resource "aws_secretsmanager_secret" "control_tower_secret" {
  name        = "${var.prefix}-${var.environment}-control-tower-secret"
  description = "Secret for Control Tower configuration."

  tags = var.tags
}

output "control_tower_role_arn" {
  value       = aws_iam_role.control_tower_role.arn
  description = "ARN of the Control Tower IAM Role."
}

output "control_tower_policy_arn" {
  value       = aws_iam_policy.control_tower_policy.arn
  description = "ARN of the Control Tower IAM Policy."
}

output "gdpr_compliance_rule_id" {
  value       = aws_config_config_rule.gdpr_compliance_rule.id
  description = "ID of the GDPR compliance AWS Config Rule."
}

output "control_tower_secret_arn" {
  value       = aws_secretsmanager_secret.control_tower_secret.arn
  description = "ARN of the Control Tower Secret."
}
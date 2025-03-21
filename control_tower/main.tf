provider "aws" {
  region = var.aws_region
}

resource "aws_organizations_account" "new_account" {
  name            = var.account_name
  email           = var.account_email
  role_name       = var.account_role_name
  iam_user_access_to_billing = "DENY"
  tags = var.tags
}

resource "aws_iam_role" "control_tower_role" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.control_tower_assume_role_policy.json
  tags               = var.tags
}

resource "aws_iam_policy" "control_tower_policy" {
  name        = var.policy_name
  description = "Policy for Control Tower operations"
  policy      = data.aws_iam_policy_document.control_tower_policy.json
  tags        = var.tags
}

resource "aws_secretsmanager_secret" "control_tower_secret" {
  name              = var.secrets_name
  description       = "Secrets for Control Tower operations"
  kms_key_id        = aws_kms_key.control_tower_kms_key.id
  tags              = var.tags
}

resource "aws_kms_key" "control_tower_kms_key" {
  description             = "KMS key for data encryption in Control Tower"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  tags                    = var.tags
}

resource "aws_config_config_rule" "gdpr_compliance_rule" {
  name        = "gdpr-compliance-rule"
  description = "Ensure GDPR compliance"
  scope {
    compliance_resource_types = ["AWS::AllSupported"]
  }
  source {
    owner             = "AWS"
    source_identifier = "GDPRComplianceCheck"
  }
  tags = var.tags
}

resource "aws_sns_topic" "alerts_topic" {
  name = var.sns_topic_name
  tags = var.tags
}

resource "aws_sns_topic_subscription" "alerts_subscription" {
  topic_arn = aws_sns_topic.alerts_topic.arn
  protocol  = "email"
  endpoint  = var.sns_alert_email
}

resource "aws_route53_zone" "dns_management_zone" {
  name = var.dns_domain_name
  tags = var.tags
}

resource "aws_s3_bucket" "data_retention_bucket" {
  bucket = var.retention_bucket_name
  lifecycle_rule {
    id      = "data-retention-policy"
    enabled = true
    transition {
      days          = var.retention_transition_days
      storage_class = "GLACIER"
    }
    expiration {
      days = var.retention_expiration_days
    }
  }
  tags = var.tags
}

output "account_id" {
  value = aws_organizations_account.new_account.id
}

output "kms_key_arn" {
  value = aws_kms_key.control_tower_kms_key.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts_topic.arn
}

output "route53_zone_id" {
  value = aws_route53_zone.dns_management_zone.zone_id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.data_retention_bucket.bucket
}
provider "aws" {
  region = var.aws_region
}

resource "aws_organizations_account" "new_account" {
  name             = "ti-${var.environment}-new-account"
  email            = var.account_email
  role_name        = var.organization_role_name
  iam_user_access_to_billing = "DENY"

  tags = var.common_tags
}

resource "aws_iam_role" "cross_account_role" {
  name               = "ti-${var.environment}-cross-account-role"
  assume_role_policy = data.aws_iam_policy_document.cross_account_assume_role_policy.json

  tags = var.common_tags
}

resource "aws_iam_policy" "compliance_monitoring_policy" {
  name        = "ti-${var.environment}-compliance-monitoring-policy"
  description = "Policy for AWS Config and Security Hub monitoring compliance."

  policy = data.aws_iam_policy_document.compliance_policy.json

  tags = var.common_tags
}

resource "aws_config_configuration_recorder" "recorder" {
  name     = "ti-${var.environment}-config-recorder"
  role_arn = aws_iam_role.cross_account_role.arn

  recording_group {
    all_supported = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "delivery_channel" {
  name           = "ti-${var.environment}-delivery-channel"
  s3_bucket_name = var.config_s3_bucket

  sns_topic_arn = aws_sns_topic.alerts.arn
}

resource "aws_secretsmanager_secret" "secrets" {
  name = "ti-${var.environment}-secrets"

  tags = var.common_tags
}

resource "aws_sns_topic" "alerts" {
  name = "ti-${var.environment}-alerts"

  tags = var.common_tags
}

resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = var.customer_gateway_id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = var.common_tags
}

resource "aws_route53_zone" "dns_zone" {
  name = var.domain_name

  tags = var.common_tags
}
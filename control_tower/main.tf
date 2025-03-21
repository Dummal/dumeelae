provider "aws" {
  region = var.aws_region
}

resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "new_account" {
  name  = var.account_name
  email = var.account_email

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}

resource "aws_iam_role" "control_tower_role" {
  name               = "${var.naming_prefix}-control-tower-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}

resource "aws_iam_policy" "control_tower_policy" {
  name        = "${var.naming_prefix}-control-tower-policy"
  description = "Policy for Control Tower actions"

  policy = data.aws_iam_policy_document.control_tower_policy.json
}

resource "aws_config_configuration_recorder" "config_recorder" {
  name     = "${var.naming_prefix}-config-recorder"
  role_arn = aws_iam_role.control_tower_role.arn

  recording_group {
    all_supported = true
    include_global_resource_types = true
  }
}

resource "aws_config_rule" "compliance_rule" {
  name        = "${var.naming_prefix}-compliance-rule"
  description = "Compliance monitoring for GDPR"

  source {
    owner             = "AWS"
    source_identifier = "required-tags"
  }

  input_parameters = jsonencode({
    tag1Key = "Environment"
    tag2Key = "Service"
  })
}

resource "aws_secretsmanager_secret" "control_tower_secret" {
  name = "${var.naming_prefix}-control-tower-secret"

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}

resource "aws_kms_key" "encryption_key" {
  description             = "KMS key for data encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}

resource "aws_sns_topic" "alerts_topic" {
  name = "${var.naming_prefix}-alerts-topic"

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}

resource "aws_sns_topic_subscription" "alerts_subscription" {
  topic_arn = aws_sns_topic.alerts_topic.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_route53_zone" "dns_zone" {
  name = var.domain_name

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}

resource "aws_s3_bucket" "data_retention_bucket" {
  bucket = "${var.naming_prefix}-data-retention"

  lifecycle {
    rule {
      id      = "archive-data"
      enabled = true

      transition {
        days          = var.archive_transition_days
        storage_class = "GLACIER"
      }

      expiration {
        days = var.retention_period_days
      }
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.encryption_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    "Environment" = var.environment
    "Service"     = var.service_name
  }
}
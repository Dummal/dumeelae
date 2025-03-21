provider "aws" {
  region = var.region
}

resource "aws_iam_role" "control_tower_admin_role" {
  name               = var.control_tower_admin_role_name
  description        = "IAM Role for Control Tower Admin actions"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "controltower.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.common_tags
}

resource "aws_iam_role" "aft_execution_role" {
  name               = var.aft_execution_role_name
  description        = "IAM Role for AFT Lambda execution"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.common_tags
}

resource "aws_iam_role" "aft_account_provisioning_role" {
  name               = var.aft_account_provisioning_role_name
  description        = "IAM Role for AFT Account provisioning via CloudFormation"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudformation.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.common_tags
}

resource "aws_iam_role" "aft_admin_role" {
  name               = var.aft_admin_role_name
  description        = "IAM Role for AFT Admin actions with cross-account access and MFA enforcement"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.master_account_id
        }
        Action = "sts:AssumeRole"
        Condition = {
          Bool = {
            "aws:MultiFactorAuthPresent" = "true"
          }
        }
      }
    ]
  })
  tags = var.common_tags
}

resource "aws_iam_policy" "control_tower_admin_policy" {
  name        = var.control_tower_admin_policy_name
  description = "Policy for Control Tower Admin actions"
  policy      = file("policies/control_tower_admin_policy.json")
}

resource "aws_iam_policy" "aft_execution_policy" {
  name        = var.aft_execution_policy_name
  description = "Policy for AFT Lambda execution"
  policy      = file("policies/aft_execution_policy.json")
}

resource "aws_iam_policy" "aft_account_provisioning_policy" {
  name        = var.aft_account_provisioning_policy_name
  description = "Policy for AFT Account provisioning"
  policy      = file("policies/aft_account_provisioning_policy.json")
}

resource "aws_iam_policy" "aft_admin_policy" {
  name        = var.aft_admin_policy_name
  description = "Policy for AFT Admin actions"
  policy      = file("policies/aft_admin_policy.json")
}

resource "aws_iam_role_policy_attachment" "control_tower_admin_attach" {
  role       = aws_iam_role.control_tower_admin_role.name
  policy_arn = aws_iam_policy.control_tower_admin_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_execution_attach" {
  role       = aws_iam_role.aft_execution_role.name
  policy_arn = aws_iam_policy.aft_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_account_provisioning_attach" {
  role       = aws_iam_role.aft_account_provisioning_role.name
  policy_arn = aws_iam_policy.aft_account_provisioning_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_admin_attach" {
  role       = aws_iam_role.aft_admin_role.name
  policy_arn = aws_iam_policy.aft_admin_policy.arn
}
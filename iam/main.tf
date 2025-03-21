provider "aws" {
  region = var.region
}

resource "aws_iam_role" "control_tower_admin_role" {
  name               = var.control_tower_admin_role_name
  description        = "IAM Role for Control Tower Admin"
  assume_role_policy = data.aws_iam_policy_document.control_tower_admin_assume_role.json

  tags = var.common_tags
}

resource "aws_iam_role" "aft_execution_role" {
  name               = var.aft_execution_role_name
  description        = "IAM Role for AFT Lambda Execution"
  assume_role_policy = data.aws_iam_policy_document.aft_execution_assume_role.json

  tags = var.common_tags
}

resource "aws_iam_role" "aft_account_provisioning_role" {
  name               = var.aft_account_provisioning_role_name
  description        = "IAM Role for AFT Account Provisioning via CloudFormation"
  assume_role_policy = data.aws_iam_policy_document.aft_account_provisioning_assume_role.json

  tags = var.common_tags
}

resource "aws_iam_role" "aft_admin_role" {
  name               = var.aft_admin_role_name
  description        = "IAM Role for AFT Admin with cross-account access and MFA enforcement"
  assume_role_policy = data.aws_iam_policy_document.aft_admin_assume_role.json

  tags = var.common_tags
}

data "aws_iam_policy_document" "control_tower_admin_assume_role" {
  statement {
    actions    = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["controltower.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_execution_assume_role" {
  statement {
    actions    = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_account_provisioning_assume_role" {
  statement {
    actions    = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["cloudformation.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_admin_assume_role" {
  statement {
    actions    = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.master_account_id]
    }
    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

resource "aws_iam_policy" "control_tower_admin_policy" {
  name        = var.control_tower_admin_policy_name
  description = "Policy for Control Tower Admin"
  policy      = data.aws_iam_policy_document.control_tower_admin_permissions.json
}

resource "aws_iam_policy" "aft_execution_policy" {
  name        = var.aft_execution_policy_name
  description = "Policy for AFT Lambda Execution"
  policy      = data.aws_iam_policy_document.aft_execution_permissions.json
}

resource "aws_iam_policy" "aft_account_provisioning_policy" {
  name        = var.aft_account_provisioning_policy_name
  description = "Policy for AFT Account Provisioning"
  policy      = data.aws_iam_policy_document.aft_account_provisioning_permissions.json
}

resource "aws_iam_policy" "aft_admin_policy" {
  name        = var.aft_admin_policy_name
  description = "Policy for AFT Admin"
  policy      = data.aws_iam_policy_document.aft_admin_permissions.json
}

data "aws_iam_policy_document" "control_tower_admin_permissions" {
  statement {
    actions   = ["organizations:CreateAccount", "organizations:DescribeCreateAccountStatus"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_execution_permissions" {
  statement {
    actions   = ["lambda:InvokeFunction"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_account_provisioning_permissions" {
  statement {
    actions   = ["cloudformation:CreateStack", "cloudformation:DescribeStacks"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_admin_permissions" {
  statement {
    actions   = ["iam:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "control_tower_admin_attachment" {
  role       = aws_iam_role.control_tower_admin_role.name
  policy_arn = aws_iam_policy.control_tower_admin_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_execution_attachment" {
  role       = aws_iam_role.aft_execution_role.name
  policy_arn = aws_iam_policy.aft_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_account_provisioning_attachment" {
  role       = aws_iam_role.aft_account_provisioning_role.name
  policy_arn = aws_iam_policy.aft_account_provisioning_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_admin_attachment" {
  role       = aws_iam_role.aft_admin_role.name
  policy_arn = aws_iam_policy.aft_admin_policy.arn
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_role" "control_tower_admin_role" {
  name               = var.control_tower_admin_role_name
  description        = "IAM Role for Control Tower Admin"
  assume_role_policy = data.aws_iam_policy_document.control_tower_admin_assume_role_policy.json

  tags = var.common_tags
}

resource "aws_iam_role" "aft_execution_role" {
  name               = var.aft_execution_role_name
  description        = "IAM Role for AFT Lambda Execution"
  assume_role_policy = data.aws_iam_policy_document.aft_execution_assume_role_policy.json

  tags = var.common_tags
}

resource "aws_iam_role" "aft_account_provisioning_role" {
  name               = var.aft_account_provisioning_role_name
  description        = "IAM Role for AFT CloudFormation Account Provisioning"
  assume_role_policy = data.aws_iam_policy_document.aft_account_provisioning_assume_role_policy.json

  tags = var.common_tags
}

resource "aws_iam_role" "aft_admin_role" {
  name               = var.aft_admin_role_name
  description        = "IAM Role for AFT Admin with cross-account access and MFA enforcement"
  assume_role_policy = data.aws_iam_policy_document.aft_admin_assume_role_policy.json

  tags = var.common_tags
}

data "aws_iam_policy_document" "control_tower_admin_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["controltower.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_execution_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_account_provisioning_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["cloudformation.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_admin_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
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

resource "aws_iam_policy" "aft_execution_policy" {
  name        = var.aft_execution_policy_name
  description = "Policy for AFT Lambda Execution"
  policy      = data.aws_iam_policy_document.aft_execution_policy.json
}

resource "aws_iam_policy" "aft_account_provisioning_policy" {
  name        = var.aft_account_provisioning_policy_name
  description = "Policy for AFT CloudFormation Account Provisioning"
  policy      = data.aws_iam_policy_document.aft_account_provisioning_policy.json
}

resource "aws_iam_policy" "aft_admin_policy" {
  name        = var.aft_admin_policy_name
  description = "Policy for AFT Admin Role"
  policy      = data.aws_iam_policy_document.aft_admin_policy.json
}

data "aws_iam_policy_document" "aft_execution_policy" {
  statement {
    actions   = ["lambda:InvokeFunction", "lambda:GetFunctionConfiguration"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_account_provisioning_policy" {
  statement {
    actions   = ["cloudformation:CreateStack", "cloudformation:DescribeStacks"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_admin_policy" {
  statement {
    actions   = ["organizations:CreateAccount", "organizations:DescribeCreateAccountStatus"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "aft_execution_policy_attachment" {
  role       = aws_iam_role.aft_execution_role.name
  policy_arn = aws_iam_policy.aft_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_account_provisioning_policy_attachment" {
  role       = aws_iam_role.aft_account_provisioning_role.name
  policy_arn = aws_iam_policy.aft_account_provisioning_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_admin_policy_attachment" {
  role       = aws_iam_role.aft_admin_role.name
  policy_arn = aws_iam_policy.aft_admin_policy.arn
}
provider "aws" {
  region = var.region
}

resource "aws_iam_role" "control_tower_admin_role" {
  name               = var.control_tower_admin_role_name
  description        = "IAM Role for Control Tower Admin with trust relationship for Control Tower service"
  assume_role_policy = data.aws_iam_policy_document.control_tower_admin_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "aft_execution_role" {
  name               = var.aft_execution_role_name
  description        = "IAM Role for AFT Lambda Functions execution"
  assume_role_policy = data.aws_iam_policy_document.aft_execution_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "aft_provisioning_role" {
  name               = var.aft_provisioning_role_name
  description        = "IAM Role for AFT CloudFormation Account Provisioning"
  assume_role_policy = data.aws_iam_policy_document.aft_provisioning_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "aft_admin_role" {
  name               = var.aft_admin_role_name
  description        = "IAM Role for AFT Admin with cross-account access and MFA enforcement"
  assume_role_policy = data.aws_iam_policy_document.aft_admin_assume_role.json

  tags = var.tags
}

resource "aws_iam_policy" "control_tower_admin_policy" {
  name        = var.control_tower_admin_policy_name
  description = "Policy for Control Tower Admin role to manage landing zones"

  policy = data.aws_iam_policy_document.control_tower_admin_policy.json
}

resource "aws_iam_policy" "aft_execution_policy" {
  name        = var.aft_execution_policy_name
  description = "Policy for AFT Lambda Functions execution role"

  policy = data.aws_iam_policy_document.aft_execution_policy.json
}

resource "aws_iam_policy" "aft_provisioning_policy" {
  name        = var.aft_provisioning_policy_name
  description = "Policy for AFT CloudFormation Account Provisioning role"

  policy = data.aws_iam_policy_document.aft_provisioning_policy.json
}

resource "aws_iam_policy" "aft_admin_policy" {
  name        = var.aft_admin_policy_name
  description = "Policy for AFT Admin role with cross-account access and MFA enforcement"

  policy = data.aws_iam_policy_document.aft_admin_policy.json
}

resource "aws_iam_role_policy_attachment" "control_tower_admin_policy_attachment" {
  role       = aws_iam_role.control_tower_admin_role.name
  policy_arn = aws_iam_policy.control_tower_admin_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_execution_policy_attachment" {
  role       = aws_iam_role.aft_execution_role.name
  policy_arn = aws_iam_policy.aft_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_provisioning_policy_attachment" {
  role       = aws_iam_role.aft_provisioning_role.name
  policy_arn = aws_iam_policy.aft_provisioning_policy.arn
}

resource "aws_iam_role_policy_attachment" "aft_admin_policy_attachment" {
  role       = aws_iam_role.aft_admin_role.name
  policy_arn = aws_iam_policy.aft_admin_policy.arn
}

data "aws_iam_policy_document" "control_tower_admin_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["controltower.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_execution_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_provisioning_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["cloudformation.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aft_admin_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.master_account_id]
    }
    conditions {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

data "aws_iam_policy_document" "control_tower_admin_policy" {
  statement {
    actions   = ["organizations:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_execution_policy" {
  statement {
    actions   = ["lambda:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_provisioning_policy" {
  statement {
    actions   = ["cloudformation:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "aft_admin_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = ["*"]
  }
}
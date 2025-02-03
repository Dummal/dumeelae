# Create IAM roles for Control Tower and AFT

resource "aws_iam_role" "aft_execution_role" {
  name               = "aft-execution-role"
  description        = "Execution role for AFT Lambda functions"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Purpose = "AFT"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "aft_execution_policy" {
  role       = aws_iam_role.aft_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role" "aft_account_provisioning_role" {
  name               = "aft-account-provisioning-role"
  description        = "Role for AFT account provisioning"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "cloudformation.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Purpose = "AFT"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "aft_account_provisioning_policy" {
  role       = aws_iam_role.aft_account_provisioning_role.name
  policy_arn = aws_iam_policy.aft_account_provisioning_policy.arn
}

resource "aws_iam_policy" "aft_account_provisioning_policy" {
  name        = "aft-account-provisioning-policy"
  description = "Policy for AFT account provisioning"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "organizations:CreateAccount",
          "organizations:DescribeCreateAccountStatus",
          "organizations:ListAccounts",
          "organizations:MoveAccount",
          "iam:CreateServiceLinkedRole"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "aft_admin_role" {
  name               = "aft-admin-role"
  description        = "Admin role for AFT management"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.master_account_id}:root"
        }
        Condition = {
          Bool = {
            "aws:MultiFactorAuthPresent": "true"
          }
        }
      }
    ]
  })

  tags = {
    Purpose = "AFT"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "aft_admin_policy" {
  role       = aws_iam_role.aft_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

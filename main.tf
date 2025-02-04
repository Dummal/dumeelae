provider "aws" {
  region = "us-west-2"
}

module "control_tower" {
  source                = "./modules/control_tower"
  enable_control_tower  = true
  master_account_email  = var.master_account_email
  master_account_id     = var.master_account_id
  organizational_units  = {
    Security   = "Security",
    AuditLog   = "AuditLog",
    Sandbox    = "Sandbox"
  }
  security_account_email = var.security_account_email
  audit_account_email    = var.audit_account_email
}

module "iam" {
  source = "./modules/iam"

  roles = {
    aft_execution_role = {
      name        = "AFTExecutionRole"
      description = "Role for AFT Lambda execution"
    }
    aft_account_provisioning_role = {
      name        = "AFTAccountProvisioningRole"
      description = "Role for AFT account provisioning"
    }
    aft_admin_role = {
      name        = "AFTAdminRole"
      description = "Role for AFT management"
    }
  }
}

module "aws_resources" {
  source = "./modules/aws_resources"

  s3_bucket = {
    name          = "aft-logs-bucket-863518414447"
    versioning    = true
    encryption    = true
    kms_key_arn   = aws_kms_key.aft_key.arn
    public_access = false
  }

  kms_key = {
    alias_name       = "alias/aft-key"
    enable_key_rotation = true
  }

  sns_topic = {
    name        = "aft-notifications"
    kms_key_arn = aws_kms_key.aft_key.arn
  }

  dynamodb_table = {
    name                = "aft-requests"
    billing_mode        = "PAY_PER_REQUEST"
    hash_key            = "id"
    kms_key_arn         = aws_kms_key.aft_key.arn
    point_in_time_recovery = true
  }

  cloudwatch_log_group = {
    name              = "/aws/aft/logs"
    retention_in_days = 90
    kms_key_arn       = aws_kms_key.aft_key.arn
  }
}

resource "aws_organizations_account" "dev_account" {
  name      = "DevAccount"
  email     = var.dev_account_email
  parent_id = module.control_tower.organizational_units["Security"]
}

resource "aws_organizations_account" "prod_account" {
  name      = "ProdAccount"
  email     = var.prod_account_email
  parent_id = module.control_tower.organizational_units["Security"]
}

resource "aws_organizations_account" "shared_account" {
  name      = "SharedAccount"
  email     = var.shared_account_email
  parent_id = module.control_tower.organizational_units["Security"]
}

resource "aws_kms_key" "aft_key" {
  description         = "KMS key for AFT resources"
  enable_key_rotation = true
  policy              = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Sid       = "Enable IAM User Permissions",
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.master_account_id}:root"
        },
        Action    = "kms:*",
        Resource  = "*"
      },
      {
        Sid       = "Allow CloudWatch Logs",
        Effect    = "Allow",
        Principal = {
          Service = "logs.${var.aws_region}.amazonaws.com"
        },
        Action    = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        Resource  = "*"
      }
    ]
  })
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role" "aft_execution_role" {
  name               = "AFTExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.aft_execution_role.json
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role" "aft_account_provisioning_role" {
  name               = "AFTAccountProvisioningRole"
  assume_role_policy = data.aws_iam_policy_document.aft_account_provisioning_role.json
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role" "aft_admin_role" {
  name               = "AFTAdminRole"
  assume_role_policy = data.aws_iam_policy_document.aft_admin_role.json
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
```hcl
module "control_tower" {
  source                = "./modules/control_tower"
  enable_control_tower  = var.enable_control_tower
  master_account_email  = var.master_account_email
  organizational_units  = var.organizational_units
  aws_region            = var.aws_region
}

module "iam" {
  source             = "./modules/iam"
  master_account_id  = var.master_account_id
}

module "aws_resources" {
  source                = "./modules/aws_resources"
  aft_logs_bucket_name  = var.aft_logs_bucket_name
  aws_region            = var.aws_region
  master_account_id     = var.master_account_id
}

module "vpc" {
  source                 = "./modules/vpc"
  public_vpc_cidr        = var.public_vpc_cidr
  public_subnet_cidr     = var.public_subnet_cidr
  private_vpc_cidr       = var.private_vpc_cidr
  private_subnet_cidr    = var.private_subnet_cidr
  aws_availability_zone  = var.aws_availability_zone
}

resource "aws_organizations_account" "accounts" {
  name   = var.organization_name
  email  = var.users_email
  parent_id = var.parent_id
}

resource "aws_s3_bucket" "aft_logs" {
  bucket = "aft-logs-bucket-863518414447"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.aft_logs_key.arn
      }
    }
  }

  block_public_access {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
}

resource "aws_kms_key" "aft_logs_key" {
  description             = "KMS key for AFT logs encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  policy = jsonencode({
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.master_account_id}:root"
        }
        Action    = "kms:*"
        Resource  = "*"
      },
      {
        Effect    = "Allow"
        Principal = {
          Service = "logs.${var.aws_region}.amazonaws.com"
        }
        Action    = "kms:Encrypt"
        Resource  = "*"
      }
    ]
  })
}

resource "aws_dynamodb_table" "aft_requests" {
  name           = "aft-requests"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  point_in_time_recovery {
    enabled = true
  }

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.aft_logs_key.arn
  }
}

resource "aws_sns_topic" "aft_notifications" {
  name            = "aft-notifications"
  kms_master_key_id = aws_kms_key.aft_logs_key.arn
}

resource "aws_cloudwatch_log_group" "aft_logs" {
  name              = "/aws/aft/logs"
  retention_in_days = 90
  kms_key_id        = aws_kms_key.aft_logs_key.arn
}
```

---
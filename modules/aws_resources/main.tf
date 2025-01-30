
# Create AWS resources for Control Tower and AFT

resource "aws_s3_bucket" "aft_logs" {
  bucket = var.aft_logs_bucket_name

  tags = {
    Name        = "AFT Logs"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "aft_logs" {
  bucket = aws_s3_bucket.aft_logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aft_logs" {
  bucket = aws_s3_bucket.aft_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.aft_key.arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "aft_logs" {
  bucket = aws_s3_bucket.aft_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "aft_key" {
  description             = "KMS key for AFT encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.master_account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "Allow CloudWatch Logs"
        Effect = "Allow"
        Principal = {
          Service = "logs.${var.aws_region}.amazonaws.com"
        }
        Action = [
          "kms:Encrypt*",
          "kms:Decrypt*",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:Describe*"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name        = "AFT KMS Key"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_kms_alias" "aft_key_alias" {
  name          = "alias/aft-key"
  target_key_id = aws_kms_key.aft_key.key_id
}

resource "aws_sns_topic" "aft_notifications" {
  name = "aft-notifications"

  kms_master_key_id = aws_kms_key.aft_key.arn

  tags = {
    Name        = "AFT Notifications"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_dynamodb_table" "aft_request" {
  name           = "aft-request"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.aft_key.arn
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name        = "AFT Request Table"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_cloudwatch_log_group" "aft_logs" {
  name              = "/aws/aft/logs"
  retention_in_days = 90

  kms_key_id = aws_kms_key.aft_key.arn

  tags = {
    Name        = "AFT Logs"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

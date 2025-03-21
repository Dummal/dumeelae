```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}

module "landing_zone_vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  create_nat_gateway  = var.create_nat_gateway
  create_internet_gateway = var.create_internet_gateway
  elastic_ips         = var.elastic_ips
  tags                = var.common_tags
}

resource "aws_s3_bucket" "aft_logs" {
  bucket = var.aft_logs_bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_organizations_organization" "org" {
  aws_service_access_principals = ["controltower.amazonaws.com"]
  feature_set                   = "ALL"
}

resource "aws_organizations_account" "development_account" {
  name      = "Development"
  email     = var.development_account_email
  parent_id = aws_organizations_organization.org.id
  tags      = var.common_tags
}

resource "aws_iam_role" "secure_access_role" {
  name               = "SecureAccessRole"
  assume_role_policy = data.aws_iam_policy_document.secure_access_policy.json

  tags = var.common_tags
}

data "aws_iam_policy_document" "secure_access_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${var.master_account_id}:role/ControlTowerExecution"]
    effect = "Allow"
  }
}
```
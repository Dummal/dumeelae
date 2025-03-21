```hcl
provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "./modules/vpc"
  region              = var.region
  cidr_block          = var.vpc_cidr_block
  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway  = var.enable_nat_gateway
  enable_eip          = var.enable_eip
  eip_count           = var.eip_count
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

resource "aws_iam_role" "control_tower_role" {
  name               = "ControlTowerRole"
  assume_role_policy = data.aws_iam_policy_document.control_tower_assume_role_policy.json

  tags = var.common_tags
}

data "aws_iam_policy_document" "control_tower_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["controltower.amazonaws.com"]
    }
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
```
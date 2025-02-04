terraform {
required_version = ">= 1.3.0"
required_providers {
aws = {
source  = "hashicorp/aws"
version = "~> 4.0"
}
}
backend "s3" {
bucket         = var.backend_bucket
key            = var.backend_key
region         = var.backend_region
dynamodb_table = var.backend_dynamodb_table
}
}

provider "aws" {
alias  = "management"
region = var.management_account_region
profile = var.management_account_profile
}

provider "aws" {
alias  = "member"
region = var.member_account_region
profile = var.member_account_profile
}

module "iam" {
source = "./modules/iam"
providers = {
aws = aws.management
}
}

module "aws_resources" {
source = "./modules/aws_resources"
providers = {
aws = aws.member
}
}

module "control_tower" {
source = "./modules/control_tower"
providers = {
aws = aws.management
}
}

output "iam_role_arn" {
value = module.iam.role_arn
}

output "s3_bucket_name" {
value = module.aws_resources.s3_bucket_name
}

output "control_tower_account_ids" {
value = module.control_tower.account_ids
}
```

---

#### `# FILE: variables.tf`
```hcl
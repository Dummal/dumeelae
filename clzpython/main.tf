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
region = var.region
}

module "iam" {
source = "./modules/iam"
account_id = var.account_id
}

module "aws_resources" {
source = "./modules/aws_resources"
region = var.region
}

module "control_tower" {
source = "./modules/control_tower"
management_account_id = var.management_account_id
member_accounts       = var.member_accounts
}
```

---

#### `# FILE: variables.tf`
```hcl
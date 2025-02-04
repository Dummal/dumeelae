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
    encrypt        = true
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
}

module "aws_resources" {
  source = "./modules/aws_resources"
}

module "control_tower" {
  source = "./modules/control_tower"
}
```

---

#### `# FILE: variables.tf`
```hcl
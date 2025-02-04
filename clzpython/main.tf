terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "multi-account-setup/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  alias  = "management"
  region = var.management_account_region
  profile = var.management_account_profile
}

provider "aws" {
  alias  = "shared_services"
  region = var.shared_services_account_region
  profile = var.shared_services_account_profile
}

provider "aws" {
  alias  = "workload"
  region = var.workload_account_region
  profile = var.workload_account_profile
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

#### `variables.tf`
```hcl
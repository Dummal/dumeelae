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
    encrypt        = true
  }
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
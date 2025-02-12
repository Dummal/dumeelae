provider "aws" {
  alias  = "management"
  region = var.management_account_region
  profile = var.management_account_profile
}

provider "aws" {
  alias  = "dev"
  region = var.dev_account_region
  profile = var.dev_account_profile
}

provider "aws" {
  alias  = "prod"
  region = var.prod_account_region
  profile = var.prod_account_profile
}

# Example: S3 bucket in the management account
resource "aws_s3_bucket" "management_bucket" {
  provider = aws.management
  bucket   = var.management_bucket_name
  acl      = "private"
}

# Example: S3 bucket in the dev account
resource "aws_s3_bucket" "dev_bucket" {
  provider = aws.dev
  bucket   = var.dev_bucket_name
  acl      = "private"
}

# Example: S3 bucket in the prod account
resource "aws_s3_bucket" "prod_bucket" {
  provider = aws.prod
  bucket   = var.prod_bucket_name
  acl      = "private"
}
```

---

#### # FILE: variables.tf
```hcl
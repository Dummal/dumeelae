variable "management_account_region" {
  description = "AWS region for the management account"
  type        = string
  default     = "us-east-1"
}

variable "management_account_profile" {
  description = "AWS CLI profile for the management account"
  type        = string
}

variable "management_bucket_name" {
  description = "S3 bucket name for the management account"
  type        = string
}

variable "dev_account_region" {
  description = "AWS region for the dev account"
  type        = string
  default     = "us-west-1"
}

variable "dev_account_profile" {
  description = "AWS CLI profile for the dev account"
  type        = string
}

variable "dev_bucket_name" {
  description = "S3 bucket name for the dev account"
  type        = string
}

variable "prod_account_region" {
  description = "AWS region for the prod account"
  type        = string
  default     = "us-west-2"
}

variable "prod_account_profile" {
  description = "AWS CLI profile for the prod account"
  type        = string
}

variable "prod_bucket_name" {
  description = "S3 bucket name for the prod account"
  type        = string
}
```

---

#### # FILE: outputs.tf
```hcl
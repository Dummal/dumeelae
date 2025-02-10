variable "backend_bucket" {
  description = "S3 bucket for Terraform backend"
  type        = string
}

variable "backend_key" {
  description = "Key for Terraform state file"
  type        = string
}

variable "backend_region" {
  description = "Region for Terraform backend"
  type        = string
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}

variable "management_account_region" {
  description = "AWS region for the management account"
  type        = string
}

variable "management_account_profile" {
  description = "AWS CLI profile for the management account"
  type        = string
}

variable "member_account_region" {
  description = "AWS region for the member account"
  type        = string
}

variable "member_account_profile" {
  description = "AWS CLI profile for the member account"
  type        = string
}
```

---

#### `# FILE: outputs.tf`
```hcl
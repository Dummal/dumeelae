variable "region" {
description = "AWS region to deploy resources"
type        = string
}

variable "backend_bucket" {
description = "S3 bucket for Terraform backend"
type        = string
}

variable "backend_key" {
description = "Key for Terraform state file in S3"
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

variable "account_id" {
description = "AWS Account ID"
type        = string
}

variable "management_account_id" {
description = "AWS Management Account ID"
type        = string
}

variable "member_accounts" {
description = "List of AWS member accounts"
type        = list(string)
}
```

---

#### `# FILE: outputs.tf`
```hcl
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
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
  description = "Region for Terraform backend S3 bucket"
  type        = string
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
```

---

#### `# FILE: outputs.tf`
```hcl
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "account_ids" {
  description = "List of AWS account IDs for the multi-account setup"
  type        = list(string)
}

variable "organization_unit" {
  description = "The name of the AWS Organization Unit (OU)"
  type        = string
}

variable "iam_roles" {
  description = "List of IAM roles to create"
  type        = list(string)
}

variable "resources" {
  description = "Map of AWS resources to create"
  type        = map(any)
}
```

---

#### `# FILE: outputs.tf`
```hcl
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "account_ids" {
  description = "List of AWS account IDs for the multi-account setup"
  type        = list(string)
}

variable "organization_unit" {
  description = "The name of the organization unit for Control Tower"
  type        = string
}

variable "iam_roles" {
  description = "List of IAM roles to create"
  type        = list(string)
}

variable "resource_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
```

---

#### `# FILE: outputs.tf`
```hcl
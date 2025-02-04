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
  description = "The name of the AWS Organization Unit (OU)"
  type        = string
}
```

---

#### `outputs.tf`
```hcl
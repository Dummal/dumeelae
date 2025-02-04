variable "role_name" {
description = "Name of the IAM role"
type        = string
default     = "example-role"
}

variable "policy_name" {
description = "Name of the IAM policy"
type        = string
default     = "example-policy"
}
```

---

#### `# FILE: modules/iam/outputs.tf`
```hcl
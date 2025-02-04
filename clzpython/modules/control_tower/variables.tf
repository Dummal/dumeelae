variable "organization_feature_set" {
description = "Feature set for the AWS Organization"
type        = string
default     = "ALL"
}

variable "account_name" {
description = "Name of the AWS account"
type        = string
default     = "example-account"
}

variable "account_email" {
description = "Email for the AWS account"
type        = string
default     = "example@example.com"
}
```

---

#### `# FILE: modules/control_tower/outputs.tf`
```hcl
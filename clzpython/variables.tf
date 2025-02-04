variable "management_account_region" {
  description = "AWS region for the management account"
  type        = string
}

variable "management_account_profile" {
  description = "AWS CLI profile for the management account"
  type        = string
}

variable "shared_services_account_region" {
  description = "AWS region for the shared services account"
  type        = string
}

variable "shared_services_account_profile" {
  description = "AWS CLI profile for the shared services account"
  type        = string
}

variable "workload_account_region" {
  description = "AWS region for the workload account"
  type        = string
}

variable "workload_account_profile" {
  description = "AWS CLI profile for the workload account"
  type        = string
}
```

---

#### `outputs.tf`
```hcl
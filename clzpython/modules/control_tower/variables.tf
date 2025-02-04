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

#### `# FILE: modules/control_tower/outputs.tf`
```hcl
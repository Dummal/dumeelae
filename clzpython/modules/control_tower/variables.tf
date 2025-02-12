variable "account_ids" {
  description = "List of AWS account IDs for the multi-account setup"
  type        = list(string)
}

variable "organization_unit" {
  description = "The name of the organization unit for Control Tower"
  type        = string
}
```

---

#### `# FILE: modules/control_tower/outputs.tf`
```hcl
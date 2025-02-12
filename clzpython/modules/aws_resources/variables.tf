variable "account_ids" {
  description = "List of AWS account IDs for the multi-account setup"
  type        = list(string)
}

variable "resource_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
```

---

#### `# FILE: modules/aws_resources/outputs.tf`
```hcl
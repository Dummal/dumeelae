variable "account_ids" {
  description = "List of AWS account IDs for which IAM roles will be created"
  type        = list(string)
}
```

---

#### `modules/iam/outputs.tf`
```hcl
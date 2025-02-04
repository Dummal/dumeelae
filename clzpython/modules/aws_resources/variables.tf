variable "account_ids" {
  description = "List of AWS account IDs for which resources will be created"
  type        = list(string)
}
```

---

#### `modules/aws_resources/outputs.tf`
```hcl
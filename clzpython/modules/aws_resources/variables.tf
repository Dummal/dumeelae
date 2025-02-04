variable "resources" {
  description = "List of AWS resources to create"
  type        = map(any)
}
```

---

#### `# FILE: modules/aws_resources/outputs.tf`
```hcl
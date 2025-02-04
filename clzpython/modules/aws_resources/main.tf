resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.account_ids)

  bucket = "multi-account-bucket-${each.value}"
  tags   = var.resource_tags
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl
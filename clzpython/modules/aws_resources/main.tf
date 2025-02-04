resource "aws_s3_bucket" "multi_account_buckets" {
  for_each = toset(var.account_ids)

  bucket = "multi-account-bucket-${each.key}"
  acl    = "private"
}

output "resources" {
  value = aws_s3_bucket.multi_account_buckets
}
```

---

#### `modules/aws_resources/variables.tf`
```hcl
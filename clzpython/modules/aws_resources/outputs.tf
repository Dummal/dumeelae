output "resources" {
  description = "Details of AWS resources created"
  value       = aws_s3_bucket.multi_account_buckets
}
```

---

### Control Tower Module Files

#### `modules/control_tower/main.tf`
```hcl
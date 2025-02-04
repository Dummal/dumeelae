output "s3_bucket_names" {
  description = "Names of the created S3 buckets"
  value       = aws_s3_bucket.multi_account_buckets[*].bucket
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl
output "s3_bucket_names" {
  description = "Names of the S3 buckets created"
  value       = aws_s3_bucket.buckets[*].bucket
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl
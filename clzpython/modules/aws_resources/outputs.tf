output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.example.bucket
}
```

---

### Control Tower Module Files

#### `modules/control_tower/main.tf`
```hcl
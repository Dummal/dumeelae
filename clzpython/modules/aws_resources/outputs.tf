output "s3_bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl
output "s3_bucket_name" {
description = "S3 Bucket Name"
value       = aws_s3_bucket.example.bucket
}

output "dynamodb_table_name" {
description = "DynamoDB Table Name"
value       = aws_dynamodb_table.example.name
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl
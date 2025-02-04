output "s3_bucket_name" {
value = aws_s3_bucket.example.bucket
}

output "dynamodb_table_name" {
value = aws_dynamodb_table.example.name
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl
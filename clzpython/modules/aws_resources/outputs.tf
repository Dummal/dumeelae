output "resource_ids" {
  description = "IDs of AWS resources created"
  value       = {
    s3_bucket = aws_s3_bucket.example.id
    dynamodb_table = aws_dynamodb_table.example.id
  }
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl
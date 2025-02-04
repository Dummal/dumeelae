output "resource_ids" {
  description = "IDs of AWS resources created"
  value       = [aws_s3_bucket.example.id]
}
```

---

### Control Tower Module

#### `# FILE: modules/control_tower/main.tf`
```hcl
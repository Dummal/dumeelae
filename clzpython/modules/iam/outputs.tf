output "role_arn" {
description = "ARN of the IAM role"
value       = aws_iam_role.example.arn
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
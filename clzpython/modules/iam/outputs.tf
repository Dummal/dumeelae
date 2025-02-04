output "iam_role_names" {
description = "List of IAM role names"
value       = aws_iam_role.roles[*].name
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
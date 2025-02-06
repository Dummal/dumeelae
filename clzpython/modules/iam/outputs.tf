output "iam_roles" {
  description = "List of IAM roles created"
  value       = aws_iam_role.roles[*].name
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
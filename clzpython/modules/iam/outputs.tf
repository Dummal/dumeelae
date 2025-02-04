output "iam_role_names" {
  description = "Names of the IAM roles created"
  value       = aws_iam_role.roles[*].name
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
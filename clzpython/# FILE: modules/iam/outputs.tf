output "iam_role_arns" {
  description = "ARNs of the created IAM roles"
  value       = aws_iam_role.roles[*].arn
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
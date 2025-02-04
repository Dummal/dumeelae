output "role_arn" {
  value = aws_iam_role.multi_account_role.arn
}
```

---

### AWS Resources Module

#### `# FILE: modules/aws_resources/main.tf`
```hcl
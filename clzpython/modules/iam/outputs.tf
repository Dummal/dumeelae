output "role_arns" {
  description = "List of IAM role ARNs created"
  value       = aws_iam_role.cross_account_role.*.arn
}
```

---

### AWS Resources Module Files

#### `modules/aws_resources/main.tf`
```hcl
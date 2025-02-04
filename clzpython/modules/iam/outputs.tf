output "role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.example.arn
}
```

---

### `modules/aws_resources/main.tf`
```hcl
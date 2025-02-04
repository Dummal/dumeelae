output "role_arn" {
  description = "IAM Role ARN"
  value       = aws_iam_role.iam_role.arn
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
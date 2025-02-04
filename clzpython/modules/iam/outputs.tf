output "iam_role_arn" {
value = aws_iam_role.example.arn
}

output "iam_policy_arn" {
value = aws_iam_policy.example.arn
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
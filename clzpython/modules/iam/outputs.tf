output "iam_role_name" {
  value = aws_iam_role.example_role.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.example_policy.arn
}
```

---

### AWS Resources Module Files

#### `# FILE: modules/aws_resources/main.tf`
```hcl
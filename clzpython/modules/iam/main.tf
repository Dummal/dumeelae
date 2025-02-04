resource "aws_iam_role" "roles" {
for_each = toset(var.iam_roles)

name = each.value

assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Effect = "Allow"
Principal = {
Service = "ec2.amazonaws.com"
}
Action = "sts:AssumeRole"
}
]
})
}

output "iam_role_names" {
value = aws_iam_role.roles[*].name
}
```

---

#### `# FILE: modules/iam/variables.tf`
```hcl
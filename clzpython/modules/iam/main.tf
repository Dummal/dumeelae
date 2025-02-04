resource "aws_iam_role" "example" {
name = "example-role"

assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Action    = "sts:AssumeRole"
Effect    = "Allow"
Principal = {
Service = "ec2.amazonaws.com"
}
},
]
})
}

output "role_arn" {
value = aws_iam_role.example.arn
}
```

---

#### `# FILE: modules/iam/variables.tf`
```hcl
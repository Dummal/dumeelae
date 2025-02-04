resource "aws_iam_role" "iam_role" {
  name = "multi-account-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

output "role_arn" {
  value = aws_iam_role.iam_role.arn
}
```

---

#### `# FILE: modules/iam/variables.tf`
```hcl
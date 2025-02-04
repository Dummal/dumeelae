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

resource "aws_iam_policy" "example" {
name        = "example-policy"
description = "An example policy"

policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Action   = "s3:ListBucket"
Effect   = "Allow"
Resource = "*"
},
]
})
}

resource "aws_iam_role_policy_attachment" "example" {
role       = aws_iam_role.example.name
policy_arn = aws_iam_policy.example.arn
}
```

---

#### `# FILE: modules/iam/variables.tf`
```hcl
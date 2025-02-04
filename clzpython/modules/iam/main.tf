resource "aws_iam_role" "multi_account_role" {
  name               = "multi-account-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

output "role_arn" {
  value = aws_iam_role.multi_account_role.arn
}
```

---

#### `# FILE: modules/iam/variables.tf`
```hcl
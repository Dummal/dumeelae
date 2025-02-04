resource "aws_iam_role" "cross_account_role" {
  for_each = toset(var.account_ids)

  name               = "CrossAccountRole-${each.key}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.key].json
}

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = toset(var.account_ids)

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [each.key]
    }
  }
}

output "role_arns" {
  value = aws_iam_role.cross_account_role.*.arn
}
```

---

#### `modules/iam/variables.tf`
```hcl
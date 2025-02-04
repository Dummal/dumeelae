resource "aws_iam_role" "roles" {
for_each = toset(var.iam_roles)

name               = each.value
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

output "iam_role_names" {
value = aws_iam_role.roles[*].name
}
```

---

#### `# FILE: modules/iam/variables.tf`
```hcl
resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev"
  parent_id = var.parent_id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = var.parent_id
}

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = var.parent_id
}

resource "aws_organizations_organizational_unit" "audit" {
  name      = "Audit"
  parent_id = var.parent_id
}

resource "aws_iam_user" "user" {
  for_each = toset(var.users_email)
  name     = each.value
}
```

```hcl
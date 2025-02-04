resource "aws_organizations_account" "accounts" {
  for_each = toset(var.account_names)

  name      = each.key
  email     = each.value
  role_name = "OrganizationAccountAccessRole"
}

output "account_ids" {
  value = [for acc in aws_organizations_account.accounts : acc.id]
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl
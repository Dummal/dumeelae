resource "aws_organizations_organization" "example" {
feature_set = "ALL"
}

resource "aws_organizations_account" "member" {
for_each = toset(var.member_accounts)

name      = "Member Account ${each.value}"
email     = "member${each.value}@example.com"
role_name = "OrganizationAccountAccessRole"
}

output "organization_id" {
value = aws_organizations_organization.example.id
}

output "member_account_ids" {
value = [for account in aws_organizations_account.member : account.id]
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl
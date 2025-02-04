resource "aws_organizations_organizational_unit" "ou" {
name      = var.organization_unit
parent_id = data.aws_organizations_organization.root_id
}

data "aws_organizations_organization" "organization" {}

resource "aws_organizations_account" "accounts" {
for_each = toset(var.account_ids)

name      = "Account-${each.value}"
email     = "account-${each.value}@example.com"
role_name = "OrganizationAccountAccessRole"
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl
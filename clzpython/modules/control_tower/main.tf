resource "aws_organizations_organization" "example" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "member_account" {
  name      = "MemberAccount"
  email     = "member@example.com"
  role_name = "OrganizationAccountAccessRole"
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl
resource "aws_organizations_account" "example" {
  name      = "example-account"
  email     = "example@example.com"
  role_name = "OrganizationAccountAccessRole"
}
```

---

#### `modules/control_tower/variables.tf`
```hcl
resource "aws_organizations_account" "example" {
  name      = "example-account"
  email     = "example@example.com"
  role_name = "OrganizationAccountAccessRole"

  tags = {
    Environment = "Production"
  }
}

output "account_id" {
  value = aws_organizations_account.example.id
}
```

---

### `modules/control_tower/variables.tf`
```hcl
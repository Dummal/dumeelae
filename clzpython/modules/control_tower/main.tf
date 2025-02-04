resource "aws_organizations_account" "example" {
name      = "example-account"
email     = "example@example.com"
role_name = "OrganizationAccountAccessRole"
}

output "account_ids" {
value = [aws_organizations_account.example.id]
}
```

---

#### `# FILE: modules/control_tower/variables.tf`
```hcl
output "organization_id" {
  value = aws_organizations_organization.org.id
}

output "dev_ou_id" {
  value = aws_organizations_organizational_unit.dev_ou.id
}

output "prod_ou_id" {
  value = aws_organizations_organizational_unit.prod_ou.id
}

output "dev_account_id" {
  value = aws_organizations_account.dev_account.id
}

output "prod_account_id" {
  value = aws_organizations_account.prod_account.id
}
```

---

### File 5: `modules/aws_organization/variables.tf`
```hcl
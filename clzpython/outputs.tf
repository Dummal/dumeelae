output "organization_id" {
  value = module.aws_organization.organization_id
}

output "dev_ou_id" {
  value = module.aws_organization.dev_ou_id
}

output "prod_ou_id" {
  value = module.aws_organization.prod_ou_id
}

output "dev_account_id" {
  value = module.aws_organization.dev_account_id
}

output "prod_account_id" {
  value = module.aws_organization.prod_account_id
}
```

---

### File 7: `variables.tf`
```hcl
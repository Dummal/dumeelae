```hcl
output "dev_ou_id" {
  value       = aws_organizations_organizational_unit.dev.id
  description = "The ID of the Dev organizational unit."
}

output "prod_ou_id" {
  value       = aws_organizations_organizational_unit.prod.id
  description = "The ID of the Prod organizational unit."
}

output "security_ou_id" {
  value       = aws_organizations_organizational_unit.security.id
  description = "The ID of the Security organizational unit."
}

output "audit_ou_id" {
  value       = aws_organizations_organizational_unit.audit.id
  description = "The ID of the Audit organizational unit."
}
```
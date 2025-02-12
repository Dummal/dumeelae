```hcl
output "dev_ou_id" {
  description = "The Organizational Unit ID for the Development environment."
  value       = aws_organizations_organizational_unit.dev.id
}

output "prod_ou_id" {
  description = "The Organizational Unit ID for the Production environment."
  value       = aws_organizations_organizational_unit.prod.id
}

output "security_ou_id" {
  description = "The Organizational Unit ID for the Security environment."
  value       = aws_organizations_organizational_unit.security.id
}

output "audit_ou_id" {
  description = "The Organizational Unit ID for the Audit environment."
  value       = aws_organizations_organizational_unit.audit.id
}
```
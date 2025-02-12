output "dev_ou_id" {
  description = "The ID of the Development Organizational Unit"
  value       = aws_organizations_organizational_unit.dev.id
}

output "prod_ou_id" {
  description = "The ID of the Production Organizational Unit"
  value       = aws_organizations_organizational_unit.prod.id
}

output "security_ou_id" {
  description = "The ID of the Security Organizational Unit"
  value       = aws_organizations_organizational_unit.security.id
}

output "audit_ou_id" {
  description = "The ID of the Audit Organizational Unit"
  value       = aws_organizations_organizational_unit.audit.id
}
```
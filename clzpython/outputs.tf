output "dev_ou_id" {
  value       = aws_organizations_organizational_unit.dev.id
  description = "The ID of the Development Organizational Unit."
}

output "prod_ou_id" {
  value       = aws_organizations_organizational_unit.prod.id
  description = "The ID of the Production Organizational Unit."
}

output "security_ou_id" {
  value       = aws_organizations_organizational_unit.security.id
  description = "The ID of the Security Organizational Unit."
}

output "audit_ou_id" {
  value       = aws_organizations_organizational_unit.audit.id
  description = "The ID of the Audit Organizational Unit."
}
```
```hcl
output "dev_ou_id" {
  description = "The ID of the Development Organizational Unit."
  value       = module.control_tower.dev_ou_id
}

output "prod_ou_id" {
  description = "The ID of the Production Organizational Unit."
  value       = module.control_tower.prod_ou_id
}

output "security_ou_id" {
  description = "The ID of the Security Organizational Unit."
  value       = module.control_tower.security_ou_id
}

output "audit_ou_id" {
  description = "The ID of the Audit Organizational Unit."
  value       = module.control_tower.audit_ou_id
}
```
```hcl
output "dev_ou_id" {
  value       = module.control_tower.dev_ou_id
  description = "The ID of the Development Organizational Unit."
}

output "prod_ou_id" {
  value       = module.control_tower.prod_ou_id
  description = "The ID of the Production Organizational Unit."
}

output "security_ou_id" {
  value       = module.control_tower.security_ou_id
  description = "The ID of the Security Organizational Unit."
}

output "audit_ou_id" {
  value       = module.control_tower.audit_ou_id
  description = "The ID of the Audit Organizational Unit."
}
```
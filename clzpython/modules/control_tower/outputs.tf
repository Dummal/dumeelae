output "organization_unit" {
  description = "The created Organizational Unit (OU)"
  value       = aws_organizations_organizational_unit.ou.id
}

output "accounts" {
  description = "List of AWS accounts created"
  value       = aws_organizations_account.accounts[*].id
}
```

---

This configuration sets up a multi-account AWS environment using Terraform, with IAM roles, AWS resources, and AWS Control Tower for organizational management.
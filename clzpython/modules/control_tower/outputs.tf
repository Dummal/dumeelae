output "organizational_unit_id" {
description = "ID of the created organizational unit"
value       = aws_organizations_organizational_unit.ou.id
}

output "account_ids" {
description = "List of AWS account IDs created"
value       = aws_organizations_account.accounts[*].id
}
```

---

This configuration sets up a multi-account AWS environment using Terraform. It includes modules for IAM roles, AWS resources, and AWS Control Tower for managing organizational units and accounts.
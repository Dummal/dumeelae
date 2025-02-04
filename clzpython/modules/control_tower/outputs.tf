output "organization_id" {
description = "AWS Organization ID"
value       = aws_organizations_organization.example.id
}

output "member_account_ids" {
description = "List of AWS Member Account IDs"
value       = [for account in aws_organizations_account.member : account.id]
}
```

---

This configuration sets up a multi-account AWS environment using Terraform, with modules for IAM, AWS resources, and Control Tower. Each module is self-contained and reusable.
output "organizational_unit_id" {
  description = "ID of the created organizational unit"
  value       = aws_organizations_organizational_unit.ou.id
}

output "account_ids" {
  description = "IDs of the created accounts"
  value       = aws_organizations_account.accounts[*].id
}
```

---

This configuration sets up a multi-account AWS environment using Terraform. It includes IAM roles, S3 buckets for each account, and an organizational unit with accounts managed by AWS Control Tower.
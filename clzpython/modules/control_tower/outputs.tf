output "organization_id" {
  value = aws_organizations_organization.example.id
}

output "member_account_id" {
  value = aws_organizations_account.member_account.id
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets, and AWS Organizations. Each module is self-contained and reusable.
output "account_ids" {
description = "List of account IDs created by Control Tower"
value       = [aws_organizations_account.example.id]
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets, and AWS Control Tower accounts. Each module is self-contained and reusable.
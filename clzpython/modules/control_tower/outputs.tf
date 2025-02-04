output "status" {
  description = "Control Tower setup status"
  value       = "Control Tower setup complete"
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets, DynamoDB tables, and AWS Control Tower. Each module is self-contained and reusable.
output "status" {
  description = "Control Tower setup status"
  value       = "Control Tower setup completed for OU: ${aws_organizations_organizational_unit.ou.name}"
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets, and an AWS Control Tower organizational unit. Each module is self-contained and reusable.
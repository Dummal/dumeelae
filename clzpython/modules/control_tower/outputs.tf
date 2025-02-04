output "ou_id" {
description = "The ID of the created Organizational Unit"
value       = aws_organizations_organizational_unit.ou.id
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, AWS resources (S3 buckets and EC2 instances), and an AWS Control Tower organizational unit. Each module is self-contained and reusable.
output "organizational_unit_id" {
  description = "Organizational Unit ID"
  value       = aws_organizations_organizational_unit.example.id
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets, and Control Tower organizational units. Each module is self-contained and reusable. Adjust the variables and resources as needed for your specific use case.
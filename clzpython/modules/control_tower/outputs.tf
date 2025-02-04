output "organizational_unit_id" {
  description = "ID of the created organizational unit"
  value       = aws_organizations_organizational_unit.ou.id
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets for each account, and an organizational unit in AWS Control Tower. You can customize the variables in `terraform.tfvars` to suit your specific requirements.
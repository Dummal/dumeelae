output "control_tower_ou_id" {
  description = "ID of the created Organizational Unit"
  value       = aws_organizations_organizational_unit.control_tower_ou.id
}
```

---

This configuration sets up a multi-account AWS environment with IAM roles, S3 buckets for each account, and an organizational unit in AWS Control Tower. You can customize the variables in `terraform.tfvars` to suit your specific requirements.
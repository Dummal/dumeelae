output "iam_role_arn" {
  description = "IAM Role ARN created in the management account"
  value       = module.iam.role_arn
}

output "s3_bucket_name" {
  description = "S3 bucket name created in the member account"
  value       = module.aws_resources.s3_bucket_name
}

output "control_tower_status" {
  description = "Control Tower setup status"
  value       = module.control_tower.status
}
```

---

#### `# FILE: provider.tf`
```hcl
output "iam_role_arn" {
  description = "IAM Role ARN created in the management account"
  value       = module.iam.role_arn
}

output "s3_bucket_name" {
  description = "S3 bucket name created in the member account"
  value       = module.aws_resources.s3_bucket_name
}

output "control_tower_organizational_unit_id" {
  description = "Control Tower Organizational Unit ID"
  value       = module.control_tower.organizational_unit_id
}
```

---

#### `provider.tf`
```hcl
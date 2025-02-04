output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = module.iam.role_arn
}

output "aws_resources_ids" {
  description = "IDs of AWS resources created"
  value       = module.aws_resources.resource_ids
}

output "control_tower_status" {
  description = "Control Tower setup status"
  value       = module.control_tower.status
}
```

---

#### `# FILE: provider.tf`
```hcl